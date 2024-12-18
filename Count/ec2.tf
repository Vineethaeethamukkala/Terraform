resource "aws_instance" "DB" {
    ami = "ami-0166fe664262f664c"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_name[count.index] == "db" ? "t3.micro" : "t2.micro"
    # count=3
    count=length(var.instance_name)

    tags = {
        Name = var.instance_name[count.index]
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
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
    Name = "allow_ssh"
    CreatedBy = "Vineetha"
  }

}