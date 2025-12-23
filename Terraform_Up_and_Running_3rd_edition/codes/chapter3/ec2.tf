resource "aws_instance" "example" {
  ami           = "ami-0e68e34976bb4db93"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}
