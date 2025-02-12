output "ssh-command" {
  value = "ssh -i ${var.webserver_info.private_key_path} ${var.webserver_info.admin_username}@${azurerm_linux_virtual_machine.web.public_ip_address}"

}

output "public_ip_address" {
  description = "Public IP address"
  value       = data.azurerm_public_ip.ip.ip_address
}

output "web-url" {
  value = format("http://%s", data.azurerm_public_ip.ip.ip_address)
}