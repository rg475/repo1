resource "aws_instance" "Terraform_Ubuntu" {
  ami                    = "ami-0817d428a6fb68645"
  instance_type          = "t2.micro"
  key_name               = "Practico_1"
  vpc_security_group_ids = [aws_security_group.actu_en_clase.id]

  tags = {
    Name = "Ubuntu-Terraform"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/root/Descargas/Practico_1.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y ca-certificates wget",
      "wget https://get.glennr.nl/unifi/install/unifi-5.13.32.sh",
    ]
  }
}


