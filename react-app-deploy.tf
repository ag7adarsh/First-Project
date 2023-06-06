# Configure AWS provider along with credentials of IAM user named- React-app-Deployer
provider "aws" {
  access_key = "AKIA2SNZGTVHLH66E5NW"
  secret_key = "edCL3BYVc0RyWSulKyK9J+Nwdwfzu6xAXha8pOE1"
  region     = "ap-south-1"
}

# Create an AWS key pair resource
resource "aws_key_pair" "example" {
  key_name   = "id_rsa"
  public_key = file("/root/.ssh/id_rsa.pub")
}

# Create an AWS EC2 instance resource
resource "aws_instance" "example" {
  key_name      = aws_key_pair.example.key_name
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  # Define the SSH connection details 
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/root/.ssh/id_rsa")
    host        = self.public_ip
  }

  # Provisioner for remote-exec install and configure docker on remorte ec2 instance
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker.io",
      "sudo service docker start",
      "sudo groupadd docker",
      "sudo usermod -aG docker ubuntu",
      "exit",
      "sudo su - ubuntu",
      "sudo service docker enable"
    ]
  }

  # Provisioner for installing Docker Compose
  provisioner "remote-exec" {
    inline = [
      "sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose"
    ]
  }

  # Provisioner for cloning a Git repository and running Docker Compose
  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y git",
      "git clone https://github.com/ag7adarsh/First-Project.git",
      "cd First-Project",
      "docker compose -d up --build"
    ]
  }
tags = {
      Name     = "React-app-instance"
      task         = "DevOps Assignment"
      company = "SmartCow Company"
    }
}


output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.example.public_ip
}

