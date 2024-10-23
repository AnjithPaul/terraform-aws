resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.3.0/25"
  tags = {
    Name = "ec2_iac_vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.3.0/26"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "ec2_iac_subnet"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["192.168.3.64"]

  tags = {
    Name = "ec2_iac_network_interface"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-04a37924ffe27da53"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  tags = {
    Name = "ec2_iac_backend_server"
  }
}