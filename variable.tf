
variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "us-east-1"
}

variable "aws_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aws_internet_gateway_tags" {
  type = map(string)
  default = {
    Name = "main_igw"
  }

}

variable "aws_enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "aws_vpc_tags" {
  type = map(any)

}

variable "aws_subnets_cidr_block" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "aws_subnet_tags" {
  type = map(any)
  default = {
    Name = "public_subnet"
  }

}

variable "aws_private_subnet_tags" {
  type = map(any)
  default = {
    Name = "public_subnet"
  }

}


variable "aws_route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "aws_route_table_tags" {
  type = map(any)
  default = {
    Name = "public_route-table"
  }

}

variable "private_route_table_tags" {
  type = map(any)
  default = {
    Name = "private_route-table"
  }

}



variable "aws_security_group_name" {
  type    = string
  default = "sg_nginx"

}

variable "aws_security_group_ingress_cidr_block" {
  type    = list(any)
  default = ["0.0.0.0/0", "0.0.0.0/0"]
}

variable "aws_security_group_egress_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0", ]

}

variable "aws_security_group_tags" {
  type = map(any)
  default = {
    Name = "sg_main"
  }

}

variable "aws_sg_nginx2_name" {
  type    = string
  default = "sg_nginx2"

}

variable "aws_sg_nginx2_tags" {
  type = map(any)
  default = {
    Name = "sg_main2"
  }

}

//variable "main_vpc_cidr_block" {
//    type = list(string)
//    default = ["10.0.0.0/16"]

//}





variable "aws_instance_ami" {
  type    = string
  default = "ami-026b57f3c383c2eec"

}

variable "aws_instance_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_instance_tags" {
  type = map(any)
  default = {
    Name = "public-ec2"
  }

}

variable "aws_private_instance_tags" {
  type = map(any)
  default = {
    Name = "private-ec2"
  }

}

variable "company" {
  type        = string
  description = "compagny name for resource tagging"
  default     = "Globomatics"

}

variable "project" {
  type        = string
  description = "project name for resource tagging"
  default     = "nginx"

}

variable "billing_code" {
  type        = string
  description = "billing code name for resource tagging"
  default     = "demo"

}



