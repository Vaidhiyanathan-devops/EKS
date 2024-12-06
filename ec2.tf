resource "aws_instance" "worker_node" {
  ami           = data.aws_ami.eks_optimized.id
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.eks_sg.id]

  tags = {
    Name = "eks-worker-node"
  }
}

data "aws_ami" "eks_optimized" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }

  owners = ["602401143452"] # Amazon EKS optimized AMI account ID
}
