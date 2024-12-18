#1. command line
#2. tfvars
#3. ENV variable
#4. variable default value

variable "image_id" {
    type=string
    default = "ami-0166fe664262f664c"
 }

variable "instance_type" {
    type=string
    default="t2.micro"
}


# example for map

variable "tags" {
    default={
        project="expense"
        Environment="Dev"
        Module="DB"
        Name="DB"

    }
}

# example for string 

variable "sg_name" {
    default="allow_ssh"    
    
}

variable "sg_description" {
    default = "allowing port 22"
}

# example for number

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

# example for list(string)

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}