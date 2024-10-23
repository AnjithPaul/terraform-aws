resource "aws_instance" "app_server" {
  ami           =  "ami-04a37924ffe27da53"
  instance_type = "t2.micro"

  tags = {
    Name = "backend_server"
  }
}