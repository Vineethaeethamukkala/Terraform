resource "aws_instance" "DB" {
    ami = "ami-0166fe664262f664c"
    vpc_security_group_ids = [aws_security_group.allow_ssh1.id]
    instance_type = "t2.micro"

    tags = {
        Name = "db"
    }
}

resource "aws_security_group" "allow_ssh1" {
    name = "allow_ssh1"
    description = "allowing SSH access"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all traffic
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "allow_ssh1"
    CreatedBy = "Vineetha"
  }

}

