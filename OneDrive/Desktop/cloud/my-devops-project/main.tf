# 1. Cloud Provider Configuration
provider "aws" {
  region = "us-east-1" 
}

# 2. EC2 Instance Resource (Unit III: Cloud Services)
resource "aws_instance" "portfolio_server" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2023 (Free Tier)
  instance_type = "t3.micro"             # Economics: Free Tier eligible

  # 3. User Data Script (Automation)
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              sudo docker run -d -p 80:80 sudeepkumarreddyeaga/sudeep-portfolio:latest
              EOF

  tags = {
    Name = "Sudeep-Portfolio-Server"
  }
}
