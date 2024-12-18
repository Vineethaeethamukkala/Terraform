resource "aws_instance" "DB" {
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type

    tags = var.tags
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description



  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.protocol
    cidr_blocks = var.allowed_cidr # Allow traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all traffic
    cidr_blocks = var.allowed_cidr  # Allow all outbound traffic
  }

  tags = {
    Name = var.sg_name
    CreatedBy = "Vineetha"
  }

}

