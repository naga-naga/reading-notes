provider "aws" {
  region = "ap-northeast-1"
}

variable "server_port" {
  description = "HTTP リクエストを待ち受けるポート"
  type        = number
  default     = 8080
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-0e68e34976bb4db93"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              cd /home/ec2-user
              echo "Hello World" > index.html
              nohup python3 -m http.server ${var.server_port} &
              EOF

  lifecycle {
    create_before_destroy = true
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

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier = data.aws_subnets.default.ids

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}

output "public_ip" {
  description = "EC2 インスタンスの Public IP アドレス"
  value       = aws_instance.example.public_ip
}
