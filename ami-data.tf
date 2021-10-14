# Use terraform to query latest generated AMIs..

data "aws_ami" "ansible-ami" {

  filter {
    name   = "tag:Name"
    values = [var.ansible_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "server-ami" {

  filter {
    name   = "tag:Name"
    values = [var.server_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "monitor-ami" {

  filter {
    name   = "tag:Name"
    values = [var.monitor_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}