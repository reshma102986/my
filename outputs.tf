output "volume_ids" {
  value = aws_ebs_volume.example[*].id
}