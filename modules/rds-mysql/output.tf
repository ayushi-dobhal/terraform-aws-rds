output "writer_endpoint" {
  value = aws_rds_cluster.rds_cluster.endpoint
}

output "reader_endpoint" {
  value = aws_rds_cluster.rds_cluster.reader_endpoint
}
