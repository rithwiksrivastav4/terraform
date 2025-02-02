region   = "ap-south-1"
vpc_cidr = "10.10.0.0/16"

subnet_cidrs = [
  "10.10.0.0/24",
  "10.10.1.0/24"
]

azs = [
  "ap-south-1a",
  "ap-south-1b"
]

subnets_names = [
  "private-sub",
  "public-sub"
]

rtn = [
  "ntire-private",
  "ntire-public"
]

vpc_name = "ntire"

igwn = "ntire-igw"