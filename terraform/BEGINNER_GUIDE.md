# SIMPLE TERRAFORM DEPLOYMENT GUIDE FOR BEGINNERS

## What This Does

This simplified Terraform setup will:
1. Create a VPC (Virtual Private Cloud) on AWS
2. Launch an EC2 instance (virtual server) with your FastAPI backend
3. Create an S3 bucket to host your React frontend
4. Give you URLs to access your application

## Prerequisites

1. **AWS Account** - Sign up at https://aws.amazon.com/
2. **AWS CLI** - Download from https://aws.amazon.com/cli/
3. **Terraform** - Download from https://www.terraform.io/downloads.html
4. **Text Editor** - VS Code, Notepad, etc.

## Step 1: Configure AWS Credentials

```powershell
# Open PowerShell and run:
aws configure

# You'll be asked for:
# AWS Access Key ID: [Paste your key]
# AWS Secret Access Key: [Paste your secret]
# Default region: us-east-1
# Default output format: json
```

Get AWS credentials from: https://console.aws.amazon.com/iam/home

## Step 2: Create terraform.tfvars File

Create a file named `terraform.tfvars` in the terraform folder with:

```hcl
aws_region   = "us-east-1"
project_name = "crud-app"
environment  = "development"
```

Save it in: `c:\Users\DELL\Desktop\Proj\terraform\terraform.tfvars`

## Step 3: Initialize Terraform

```powershell
cd c:\Users\DELL\Desktop\Proj\terraform
terraform init
```

This downloads necessary plugins. (Only run once)

## Step 4: Review What Will Be Created

```powershell
terraform plan
```

This shows you exactly what AWS resources will be created.
Review the output to make sure everything looks correct.

## Step 5: Deploy to AWS

```powershell
terraform apply
```

Type `yes` when prompted.

**This will take 2-5 minutes**

## Step 6: Get Your Server IP

After deployment completes, run:

```powershell
terraform output backend_public_ip
```

This will give you the IP address of your backend server.

## Step 7: Upload Your Backend Code

1. SSH into your server:
```powershell
ssh -i C:\path\to\your\keypair.pem ubuntu@YOUR_PUBLIC_IP
```

2. Upload your backend code:
```bash
cd /home/ubuntu/app
# Copy your main.py, models.py, schemas.py, database.py here
```

3. Start the FastAPI server:
```bash
python3 -m uvicorn main:app --host 0.0.0.0 --port 8000
```

4. Test it:
```powershell
curl http://YOUR_PUBLIC_IP:8000/docs
```

You should see Swagger documentation!

## Step 8: Deploy Frontend to S3

1. Build your React app:
```powershell
cd c:\Users\DELL\Desktop\Proj\frontend
npm run build
```

2. Get S3 bucket name:
```powershell
terraform output s3_bucket_name
```

3. Upload to S3:
```powershell
aws s3 sync build/ s3://YOUR_BUCKET_NAME/
```

4. Access frontend:
```
http://YOUR_BUCKET_NAME.s3-website-us-east-1.amazonaws.com/
```

## Common Errors & Fixes

### "Error: AWS credentials not configured"
Run: `aws configure` and enter your AWS keys

### "Error: subnet not found"
Make sure terraform.tfvars exists and terraform init was run

### "Cannot connect to backend"
- Check security group allows port 8000
- Make sure FastAPI is running on the server
- Check firewall allows traffic

### "S3 bucket access denied"
Make sure bucket policy is public (already configured)

## Managing Your Deployment

### View all resources:
```powershell
terraform show
```

### Stop everything (delete AWS resources):
```powershell
terraform destroy
```

Type `yes` to confirm. This saves money if you're not using it.

### Update something:
Edit `terraform.tfvars`, then run:
```powershell
terraform apply
```

## Cost Estimate

- **EC2 (t3.micro)**: ~$8/month (free tier eligible first year)
- **S3 storage**: ~$1/month
- **Data transfer**: ~$1-5/month
- **Total**: ~$10-15/month (or FREE with AWS free tier!)

## Next Steps

1. Copy your backend code to the EC2 instance
2. Copy your frontend build to S3
3. Update frontend API URL to point to your backend IP
4. Test everything works

## Getting Help

- Terraform docs: https://www.terraform.io/docs
- AWS docs: https://docs.aws.amazon.com/
- Ask in AWS forums or Stack Overflow

## Important Security Notes

⚠️ **For Production:**
- Enable HTTPS (SSL/TLS certificate)
- Restrict SSH access to your IP only
- Use environment variables for sensitive data
- Enable VPC security groups properly
- Backup your database regularly

⚠️ **Don't forget to:**
- Save your keypair file safely
- Keep AWS credentials secret
- Destroy resources when not in use to save money
- Use strong passwords

That's it! Your app is now deployed on AWS! 🎉
