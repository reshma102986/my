provider "aws" {
  region = "us-east-1"
}

resource "aws_ebs_volume" "example" {
  for_each = toset(var.volume_ids)

  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp3"
  snapshot_id       = each.value.snapshot_id
  tags = {
    Name = "MyVolume"
  }

  lifecycle {
    ignore_changes = [
      size, // Ignore size to only change the volume type
    ]
  }
}