# create security group
resource "aws_security_group" "terraform-ansible" {
  name        = "terraform-ansible-sg"
  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# create an instance
resource "aws_instance" "terraform-ansible" {
  ami           = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"
  key_name      = "KP_MARCH_2021"
  security_groups = ["${aws_security_group.terraform-ansible.name}"]

  tags = {
    Name = "terraform-ansible"
  }
}

output "pubid" {
  value = "${aws_instance.terraform-ansible.public_ip}"
}
