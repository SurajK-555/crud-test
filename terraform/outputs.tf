# ============================================
# OUTPUTS - Print results after creation
# ============================================
output "server_public_ip" {
  description = "Public IP of the server"
  value       = aws_eip.app_eip.public_ip
}

output "ssh_command" {
  description = "How to SSH into your server"
  value       = "ssh -i your-key.pem ec2-user@${aws_eip.app_eip.public_ip}"
}

output "app_url" {
  description = "URL to access your app"
  value       = "http://${aws_eip.app_eip.public_ip}"
}
