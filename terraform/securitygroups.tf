resource "aws_security_group" "internal_ssh" {
  name        = "internal-ssh"
  description = "Allow ssh"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "internal ssh"
  }
}

resource "aws_security_group" "nfs" {
  vpc_id = "${module.vpc.vpc_id}"
  name = "nfs"

  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port = 111
    to_port = 111
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_security_group" "internal_psql" {
#   name        = internal-psql
#   vpc_id      = "${module.vpc.vpc_id}"
#   description = "Allow psql traffic"
#
#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.0.0/16"]
#   }
#
#   lifecycle {
#     create_before_destroy = true
#   }
#
#   tags = {
#     Name = "internal psql"
#   }
# }
#
# resource "aws_security_group" "internal-redis" {
#   name        = "internal-redis"
#   vpc_id      = "${module.vpc.vpc_id}"
#   description = "allow redis"
#
#   ingress {
#     from_port   = 6379
#     to_port     = 6379
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.0.0/16"]
#   }
#
#   lifecycle {
#     create_before_destroy = true
#   }
#   tags = {
#     Name = "internal redis"
#   }
# }
