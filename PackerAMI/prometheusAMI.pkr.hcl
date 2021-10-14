source "amazon-ebs" "prometheus" {
  ami_name      = "prometheus-ami"
  instance_type = "t2.micro"
  region        = "ca-central-1"
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"

  tags = {
    Name = "packer-prometheus-ami"
  }
}

build {
  sources = [
    "source.amazon-ebs.prometheus"
  ]

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "../Prometheus/node-exporter.service"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "../Prometheus/prometheus.service"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "../Prometheus/prometheus.yml"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "../Scripts/ansible_client.sh"
  }

  provisioner "shell" {
    script = "../Prometheus/nodeExporter-install.sh"
  }

  provisioner "shell" {
    script = "../Prometheus/prometheus-install.sh"
  }

  provisioner "shell" {
    script = "../Prometheus/grafana-install.sh"
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}