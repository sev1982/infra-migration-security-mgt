#!/bin/bash
# ====================================================
# Terraform Backend Setup Script for AWS
# Author: Séverin Kouemo
# ====================================================

# ---- Variables ----
AWS_REGION="us-east-1"
BUCKET_NAME="infra-migration-tfstate"
DYNAMO_TABLE="terraform-locks"

echo "🚀 Starting backend setup in region: $AWS_REGION"

# ---- Create S3 bucket ----
echo "🪣 Creating S3 bucket: $BUCKET_NAME"
aws s3api create-bucket --bucket $BUCKET_NAME --region $AWS_REGION \
  --create-bucket-configuration LocationConstraint=$AWS_REGION 2>/dev/null

# ---- Enable versioning ----
echo "🔁 Enabling versioning on bucket..."
aws s3api put-bucket-versioning \
  --bucket $BUCKET_NAME \
  --versioning-configuration Status=Enabled

# ---- Create DynamoDB table ----
echo "🧱 Creating DynamoDB table for Terraform state lock..."
aws dynamodb create-table \
  --table-name $DYNAMO_TABLE \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST 2>/dev/null

# ---- Confirm creation ----
echo "✅ Backend resources created:"
echo "   - S3 bucket: $BUCKET_NAME"
echo "   - DynamoDB table: $DYNAMO_TABLE"
echo ""
echo "Next: Run 'terraform init -reconfigure' inside terraform/aws"
