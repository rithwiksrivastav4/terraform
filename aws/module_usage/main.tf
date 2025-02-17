module "mymodule" {
  source        = "github.com/rithwiksrivastav4/terraform/aws//activity4"
  region        = "ap-south-1"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidrs  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  azs           = ["ap-south-1a", "ap-south-1b", "ap-south-1a", "ap-south-1b"]
  subnets_names = ["web", "app", "db-1", "db-2"]


}