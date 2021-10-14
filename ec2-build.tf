## EC2 Infrastructure creation template
## Ansible Tool Server(s) Creation Resource
resource "aws_instance" "ansible-server" {
  count                = var.resource_count
  user_data            = data.template_file.dependencies_installation.template
  ami                  = data.aws_ami.ansible-ami.id
  key_name             = var.ssh_key
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.access_profile.name
  security_groups      = [aws_security_group.ansible_sg.id]
  subnet_id            = aws_subnet.public_subnet[count.index].id
  # iam_instance_profile = var.iam_role

  tags = {
    Name        = "${var.resource_tag_name}"
    environment = "${var.resource_environment}"
    role        = "${var.resource_role}"
  }
}

## Monitoring Server(s) Creation Resource
resource "aws_instance" "monitor-server" {
  count                = var.monitor_count
  user_data            = data.template_file.dependencies_installation.template
  ami                  = data.aws_ami.monitor-ami.id
  key_name             = var.ssh_key
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.access_profile.name
  security_groups      = [aws_security_group.monitor_sg.id]
  subnet_id            = aws_subnet.public_subnet[count.index].id
  # iam_instance_profile = var.iam_role

  tags = {
    Name        = "${var.monitor_tag_name}"
    environment = "${var.monitor_environment}"
    role        = "${var.monitor_role}"
  }
}

## Web Server(s) Creation Resource
resource "aws_instance" "web-server" {
  count         = var.server_count
  user_data     = data.template_file.dependencies_installation.template
  ami           = data.aws_ami.server-ami.id
  key_name      = var.ssh_key
  instance_type = var.instance_type
  # iam_instance_profile = aws_iam_instance_profile.access_profile.name
  security_groups = [aws_security_group.webserver_sg.id]
  subnet_id       = aws_subnet.public_subnet[count.index].id
  # iam_instance_profile = var.iam_role

  tags = {
    Name        = "${var.server_tag_name[count.index]}"
    environment = "${var.server_environment[count.index]}"
    role        = "${var.server_role[count.index]}"
  }
}

