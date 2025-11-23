// VPC Module
module "vpc" {
  source               = "./modules/vpc"
  project_name         = "eao-infra"
  cidr_block           = "10.2.0.0/26"
  azs                  = ["ap-south-1a", "ap-south-1b"]
  public_subnets_cidr  = ["10.2.0.0/27"]
  private_subnets_cidr = ["10.2.0.32/28", "10.2.0.48/28"]
}

// VPC Network Module
module "network" {
  source             = "./modules/network"
  project_name       = module.vpc.project_name
  vpc_id             = module.vpc.vpc_id
  vpc_cidr           = module.vpc.vpc_cidr
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

// Web Application Server
module "webserver" {
  source           = "./modules/compute"
  project_name     = module.vpc.project_name
  ami              = "ami-01760eea5c574eb86"
  instance_type    = "t3.micro"
  key_name         = "docker-pair"
  enable_public_ip = true
  subnet_id        = module.vpc.public_subnet_ids[0]
  security_groups  = module.network.ec2_security_groups
  boot_script      = "modules/script/docker-user-data.sh"
  tags = {
    Name        = "${module.vpc.project_name}-web-server"
    Environment = "Development"
  }
}

// SonarQube Server
module "sonarqube" {
  source           = "./modules/compute"
  project_name     = module.vpc.project_name
  ami              = "ami-02b8269d5e85954ef"
  instance_type    = "c7i-flex.large"
  key_name         = "docker-pair"
  enable_public_ip = true
  subnet_id        = module.vpc.public_subnet_ids[0]
  security_groups  = module.network.ec2_security_groups
  boot_script      = "modules/script/sonar-user-data.sh"
  tags = {
    Name        = "${module.vpc.project_name}-sonarqube-server"
    Environment = "Development"
  }
}

module "postgres" {
  source             = "./modules/database"
  vpc_id             = module.vpc.vpc_id
  project_name       = module.vpc.project_name
  security_group_ids = module.network.rds_security_groups
  private_subnet_ids = module.vpc.private_subnet_ids
}
