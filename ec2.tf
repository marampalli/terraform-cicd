resource "aws_instance" "web" {
  ami           = ami-022ce6f32988af5fa
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
