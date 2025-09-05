resource "local_file" "app" {
  content = <<EOF
ENV: ${var.environment}

Resource Name: ${var.resource_name}
EOF

  filename = "${var.filename}"
}
