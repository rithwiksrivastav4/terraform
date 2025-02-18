module "myMODULES" {


  source       = "github.com/rithwiksrivastav4/terraform/aws//activity5?ref=v1.0.0"
  region       = "ap-south-1"
  vpc_cidr     = "10.10.0.0/16"
  network_name = "ntire"
  public_subnets = [
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
  private_subnets = [
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
    rules = [
      {
        from_port   = 22
        to_port     = 22
        ip_protocol = "tcp"
        cidr_ipv4   = "0.0.0.0/0"
      },
      {
        from_port   = 80
        to_port     = 80
        ip_protocol = "tcp"
    }]
  }
  db_security_group = {
    name = "db-sg"
    rules = [{
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 3306
      to_port     = 3306
      ip_protocol = "tcp"
    }]
  }
  key_pair_path = {
    name             = "mykeypair"
    public_key_path  = "~/.ssh/id_rsaa.pub"
    private_key_path = "~/.ssh/id_rsaa"
  }
  web_server = {
    name = "my_instance"
    ami_filter = {
      name  = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115"
      owner = "099720109477"
    }
    instance_type               = "t2.micro"
    associate_public_ip_address = "true"
    username                    = "ubuntu"
  }
  build_id = "2"


}

output "web_url" {
  value = module.myMODULES.web-url
}

output "ssh_command" {
  value = module.myMODULES.ssh_command

}