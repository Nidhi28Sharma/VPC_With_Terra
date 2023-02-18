
#Creating a VPC
resource "aws_vpc" "nidhi-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"  #gives you an internal domain name
  enable_dns_hostnames = "true"  #gives you an internal host name
  tags = {
    Name = "Nidhi Sharma"
    Owner="nidhi.sharma@cloudeq.com"
    Purpose="Trainig"
  }
}

#Creating a subnet
resource "aws_subnet" "nidhi-subnet1" {
  vpc_id     = aws_vpc.nidhi-vpc.id  # linkung above VPC with subnet
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true #to make subnet public

  tags = {
    Name = "Nidhi Sharma"
    Owner="nidhi.sharma@cloudeq.com"
    Purpose="Trainig"
  }
}

#creating  2 instances for above subnet
resource "aws_instance" "nidhi-inst1" {
  count=var.var-inst1
  ami           = "ami-0f1a5f5ada0e7da53"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.nidhi-subnet1.id
  security_groups = ["${aws_security_group.nidhi_security.id}"]

  tags={
       Name="nidhi-inst1-${count.index}"
       Owner="nidhi.sharma@cloudeq"
       purpose="Trainig"
  }
  volume_tags = {
    availability_zone = "us-west-2"
    size              = 40
    Name = "Nidhi-volume"
    Owner="nidhi.sharma@cloudeq"
    Purpose="Trainig"
  }
  
}


#Creating a subnet-2
resource "aws_subnet" "nidhi-subnet2" {
  vpc_id     = aws_vpc.nidhi-vpc.id
  cidr_block = "10.0.0.0/24"
 map_public_ip_on_launch = true # to make subnet public

  tags = {
    Name = "Nidhi Sharma"
    Owner="nidhi.sharma@cloudeq.com"
    Purpose="Trainig"
  }
}


#creating 2 instances for subnet 2
resource "aws_instance" "nidhi-inst2" {
  count=var.var-inst2
  ami           = "ami-0f1a5f5ada0e7da53"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.nidhi-subnet2.id
  security_groups = ["${aws_security_group.nidhi_security.id}"]
  tags={
      Name ="nidhi-inst2-${count.index}"
       Owner="nidhi.sharma@cloudeq"
       purpose="Trainig"
  }
  volume_tags = {
    availability_zone = "us-west-2"
    size              = 40
    Name = "Nidhi-volume"
    Owner="nidhi.sharma@cloudeq"
    Purpose="Trainig"
  }
  
}