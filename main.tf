resource "aws_s3_bucket" "NebulaBucket" {
  bucket = "nebula.kingsley.me"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
  }
}


resource "aws_s3_bucket_object" "upload_html" {

  bucket = aws_s3_bucket.NebulaBucket.id

  key = "index.html"

  acl = "public-read"

  source = "assets/index.html"

  etag = filemd5("assets/index.html")

  content_type = "text/html"

}

resource "aws_s3_bucket_object" "upload_js" {

  bucket = aws_s3_bucket.NebulaBucket.id

  key = "index.js"

  acl = "public-read"

  source = "assets/index.js"

  etag = filemd5("assets/index.js")

  content_type = "text/javascript"

}

resource "aws_s3_bucket_object" "upload_css" {

  bucket = aws_s3_bucket.NebulaBucket.id

  key = "style.css"

  acl = "public-read"

  source = "assets/style.css"

  etag = filemd5("assets/style.css")

  content_type = "text/css"

}

resource "aws_cloudfront_distribution" "Nebula_Cloudfront" {
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    target_origin_id       = "NebulaOrigin"
    viewer_protocol_policy = "allow-all"
    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

  }
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"

  origin {
    domain_name = aws_s3_bucket.NebulaBucket.website_endpoint
    origin_id   = "NebulaOrigin"
    custom_origin_config {

      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]

    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = "PriceClass_All"


}