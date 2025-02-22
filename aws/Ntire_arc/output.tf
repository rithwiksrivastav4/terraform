output "url" {
  value = "http://${aws_lb.boxer.dns_name}/boxer"

}

output "ssh_commands" {
  value = [for i in range(length(aws_instance.web)) : "ssh -i ${var.web_server_info.private_key_path} ${var.web_server_info.username}@${aws_instance.web[i].public_ip}"]
}


