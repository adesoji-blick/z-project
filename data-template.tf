data "template_file" "dependencies_installation" {
  template = file("${path.module}/Scripts/dependencies.sh")
}
