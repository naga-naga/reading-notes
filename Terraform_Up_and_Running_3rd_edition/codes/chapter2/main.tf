provider "aws" {
  region = "ap-northeast-1"
}

variable "server_port" {
  description = "HTTP リクエストを待ち受けるポート"
  type        = number
  default     = 8080
}

resource "aws_instance" "example" {
  ami                    = "ami-0e68e34976bb4db93"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              cd /home/ec2-user
              echo "Hello World" > index.html
              nohup python3 -m http.server ${var.server_port} &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  description = "EC2 インスタンスの Public IP アドレス"
  value = aws_instance.example.public_ip
}
