resource "aws_instance" "DB" {
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    count=length(var.instance_name)
    instance_type = var.instance_name[count.index] == "db" ? "t3.micro" : "t2.micro"

    tags = merge (
        var.common_tags,
        {
            Name=var.instance_name[count.index]
            Module=var.instance_name[count.index]
        }
    )
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

  tags = merge (
    var.tags,
        {
            CreatedBy="vineetha"
        }
    )
}

