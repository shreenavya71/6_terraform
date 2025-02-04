resource "aws_instance" "expense" {
  count = 3
  ami                    = "ami-09c813fb71547fc4f"           # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id] # typeofresource.name.id
  instance_type          = "t3.micro"
  tags = {
    Name    = "terraform-demo" # tag to display name of the instance
    purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress { # incoming traffic
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress { # outgoing traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}