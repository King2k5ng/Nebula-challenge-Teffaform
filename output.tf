output "cloudfront_Endpoint" {
  description = "Endpoint for Nebula Cloudfront"
  value       = aws_cloudfront_distribution.Nebula_Cloudfront.domain_name
}