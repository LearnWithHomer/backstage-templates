# main.tf
provider "aws" {
  region = var.awsRegion
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.instanceType

  vpc_security_group_ids = [
    aws_security_group.example.id
  ]

  user_data = <<-EOF
    #!/bin/bash
    # Install Docker
    amazon-linux-extras install docker -y
    systemctl start docker
    usermod -a -G docker ec2-user

    # Pull and run the Docker container
    docker run -d -p 80:3000 YOUR_DOCKER_IMAGE
  EOF

  tags = {
    Name = "example-instance"
  }
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Allow inbound traffic on port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

