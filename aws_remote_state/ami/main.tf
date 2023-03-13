
resource "aws_instance" "rams_devops_ami_instance" {
  ami           = "ami-0f2e14a2494a72db9"
  instance_type = "t2.micro"
  key_name = aws_key_pair.ssh_key.id

}


resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-key"
  public_key = file("/home/rkaruppiah/.ssh/id_rsa.pub")
}