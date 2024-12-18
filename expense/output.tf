output "instance_info" {
    value=aws_instance.DB[0].public_ip

}