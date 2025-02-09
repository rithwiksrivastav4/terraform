region = "ap-south-1"

private_subnets = [
  {
    name = "private-sub-1"
    cidr = "10.10.0.0/24"
    az   = "ap-south-1a"
    }, {
    name = "private-sub-2"
    cidr = "10.10.1.0/24"
    az   = "ap-south-1b"
  }
]
public_subnets = [
  {
    name = "web-1"
    cidr = "10.10.2.0/24"
    az   = "ap-south-1a"
    }, {
    name = "app-1"
    cidr = "10.10.3.0/24"
    az   = "ap-south-1b"
  }
]

web_security_group = {
  name = "web-sg"
  rules = [{
    #cidr_ipv4   = "0.0.0.0/0"
    from_port = 22
    to_port   = 22
    }, {
    from_port = 80
    to_port   = 80
  }]
}

db_security_group = {
  name = "db-sg"
  rules = [{
    #cidr_ipv4   = "10.10.0.0/16"
    from_port = 3306
    to_port   = 3306

  }]
}

key_pair_path = {
  name = "mykeypair"
}

web_server = {
  name = "my_instance"
  ami_filter = {
    name  = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115"
    owner = "099720109477"
  }
  #ami_filter = {}
  associate_public_ip_address = "true"
}






