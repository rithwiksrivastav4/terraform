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




