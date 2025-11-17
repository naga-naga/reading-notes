provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-0e68e34976bb4db93"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              cd /home/ec2-user
              echo "Hello World" > index.html
              nohup python3 -m http.server 8080 &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
