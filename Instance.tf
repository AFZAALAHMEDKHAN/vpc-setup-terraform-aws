resource "aws_instance" "instance-r1" {
  provider                    = aws.region1
  count                       = length(module.vpc1.private_subnets)
  ami                         = var.region1_ami
  instance_type               = var.inst_type
  subnet_id                   = element(module.vpc1.private_subnets, count.index)
  key_name                    = "terraform-key"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_for_all_r1.id]
  tags = {
    Name = "instance-vpc1-${count.index}"
  }
}

resource "aws_instance" "instance-r2" {
  provider                    = aws.region2
  count                       = length(module.vpc2.private_subnets)
  ami                         = var.region2_ami
  instance_type               = var.inst_type
  subnet_id                   = element(module.vpc2.private_subnets, count.index)
  key_name                    = "terraform2-key"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_for_all_r2.id]
  tags = {
    Name = "instance-vpc2-${count.index}"
  }
}