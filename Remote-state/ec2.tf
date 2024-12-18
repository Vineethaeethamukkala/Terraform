resource "aws_instance" "db" {
    ami = "ami-0166fe664262f664c"
    vpc_security_group_ids = ["sg-0bc69184d77b10a9d"]
    instance_type = "t2.micro"

    tags = {
        Name = "db"
    }
}