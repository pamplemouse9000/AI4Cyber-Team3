resource "aws_s3_bucket" "b" {
  bucket = "iu-ai-4-cyber-team-3"
  acl    = "public-read"
  policy = file("s3publicpolicy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
