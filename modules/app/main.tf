resource "local_file" "app" {
  content = <<EOF
ENV: ${var.environment}

Resource Name       : ${var.resource_name}
Connected to network: ${var.network}
EOF

  filename = "${var.filename}"
}
