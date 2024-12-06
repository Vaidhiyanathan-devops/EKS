module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"

  vpc_id      = aws_vpc.main.id
  subnet_ids  = [aws_subnet.public_subnet.id]
  security_group_ids = [aws_security_group.eks_sg.id]

  cluster_role_arn = aws_iam_role.eks_cluster_role.arn
  worker_role_arn  = aws_iam_role.eks_worker_role.arn

  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  } }
