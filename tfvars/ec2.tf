resource "aws_instance" "expense" {
  count = length(var.instances)
  ami = "ami-09c813fb71547fc4f"   #devops-practice ami
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name= "${var.project}-${var.environment}-${var.instances[count.index]}"
    }
  )
}
# the dependency security group will create first and then ec2 instance
resource "aws_security_group" "allow_tls" {
  name = "${var.project}-${var.environment}"
  description = "Allow tls inbound traffic and all outbound traffic"
  ingress {     # in bound traffic
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {      # out bound traffic
    from_port = 0
    to_port = 0
    protocol = "-1"   # -1 means all protocols allowed
    cidr_blocks = ["0.0.0.0/0"]   # allow all
  }
  tags = {
    Name = "${var.project}-${var.environment}"
  }
}