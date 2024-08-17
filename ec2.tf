resource "aws_instance" "web" {
  ami           = "ami-022ce6f32988af5fa"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
/*
resource "aws_instance" "jenkins"{
  ami = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  tags = {
    Name = "Jenkins Server"
    Terraform   = "true"
    Environment = "dev"
  } 
}
*/
