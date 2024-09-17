module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name = "EKS-VPC"
  cidr = var.vpc_cidr[0]


  azs             = data.aws_availability_zones.az.names
  private_subnets = var.priv_sub[*]
  public_subnets  = var.pub_sub[*]

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = {
    Terraform                           = "true"
    Environment                         = "test"
    "kubernetes.io/cluster/Web-Cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/Web-Cluster" = "shared"
    "kubernetes.io/role/elb"            = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/Web-Cluster" = "shared"
    "kubernetes.io/role/internal-elb"   = 1
  }

}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.20.0"

  cluster_name    = "eks-cluster"
  cluster_version = "1.30"

  cluster_endpoint_public_access = true

  cluster_security_group_id = module.vpc.default_security_group_id

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    web_nodes = {
      instance_types = ["t2.small"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
    # enable_auto_scaling = true
    # iam_role_additional_policies = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
    }
  }

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
