resource "aws_instance" "ec2-controller" {
  ami                    = "ami-0484447029a0f38a0"
  instance_type          = "t2.micro"
  key_name               = "k8s-kp"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_custom.id]

  tags = {
    Name = "ec2-controller"
  }
}

resource "aws_eip" "elastic-ip-controller" {
  instance = aws_instance.ec2-controller.id
}
