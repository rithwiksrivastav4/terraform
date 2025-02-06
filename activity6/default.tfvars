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
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = "22"
    to_port     = "22"
    ip_protocol = "tcp"

  }]
}

db_security_group = {
  name = "db-sg"
  rules = [{
    cidr_ipv4   = "10.10.0.0/16"
    from_port   = "3306"
    to_port     = "3306"
    ip_protocol = "all"
  }]
}

key_pair_path = {
  name = "mykeypair"
}






