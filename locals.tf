# Liste der AZs, Subnet-CIDRs und Namen der Subnetze
locals {
  azs                  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets       = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
  private_subnets      = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
  public_subnet_names  = ["public-subnet-1a", "public-subnet-1b", "public-subnet-1c"]
  private_subnet_names = ["private-subnet-1a", "private-subnet-1b", "private-subnet-1c"]
}
