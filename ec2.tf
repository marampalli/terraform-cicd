data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name    = "name"
    values  = ["amzn2-ami-hvm-*-gp2"]
    }
  filter {
    name    = "root-device-type"
    values  = ["ebs"]
  }  
  filter {
    name    = "virtualization-type"
    values  = ["hvm"]
  }
  filter {
    name    = "architecture"
    values  = ["x86_64"]
  }
}

resource "aws_instance" "jenkins" {
  ami = data.aws_ami.amzlinux.id
  #count = 1
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh")
  key_name = "terraform-key"
  tags = {
    #Name = "Jenkins-Server-${count.index}"
    Name = "Jenkins"
  }
}