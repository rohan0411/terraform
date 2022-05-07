resource "aws_instance" "hello-world" {

 ami = "ami-0fb653ca2d3203ac1" 
 instance_type = "t2.micro"
 vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
 key_name = "terraform"
 tags = {
	 Name = "Hello world"
 }
}
 resource "aws_security_group" "webserver_sg" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internet access from outside"
    from_port   = 0
    protocol    = var.protocol
    to_port     = var.http_port
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access from outside"
    from_port   = var.ssh_port
    protocol    = var.protocol
    to_port     = var.ssh_port
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outboud rule to any for all ports"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}
