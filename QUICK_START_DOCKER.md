# 🚀 QUICK START - Docker + Simplified Terraform

## Option 1: Run Locally with Docker (Fastest for Learning)

### Requirements
- Docker Desktop installed ([download](https://www.docker.com/products/docker-desktop))
- You're in the project directory

### Run Everything in 1 Command
```bash
docker-compose -f docker-compose-simple.yml up --build
```

Wait 30 seconds, then visit:
- **Frontend**: http://localhost:3000
- **Backend API Docs**: http://localhost:8000/docs

### Stop Everything
```bash
docker-compose -f docker-compose-simple.yml down
```

### See Logs (for debugging)
```bash
docker-compose -f docker-compose-simple.yml logs
```

---

## Option 2: Deploy to AWS (For Production-like Testing)

### Requirements
- AWS account (free tier eligible)
- AWS CLI configured
- Terraform installed
- SSH key pair created in AWS

### Step 1: Setup
```bash
cd terraform

# Verify Terraform is installed
terraform --version

# Initialize Terraform (first time only)
terraform init
```

### Step 2: See What Will Be Created
```bash
# This shows you exactly what will be created
terraform plan
```

### Step 3: Deploy Everything
```bash
# Create all resources on AWS
terraform apply

# Type "yes" when prompted
```

### Step 4: Get Your Server Address
```bash
# See the public IP
terraform output server_public_ip

# Copy this IP and visit: http://YOUR_IP
```

### Step 5: Monitor Installation
```bash
# EC2 instance runs install.sh which:
# - Installs Docker
# - Clones your GitHub repo
# - Starts the app automatically

# Wait 2-3 minutes for installation to complete
```

### Step 6: Cleanup (Stop Paying!)
```bash
# Delete everything when done
terraform destroy

# Type "yes" when prompted
```

---

## Comparison: Local vs Cloud

| Aspect | Local Docker | AWS Terraform |
|--------|--|--|
| Cost | Free | Free (free tier) |
| Setup time | 1 minute | 5 minutes |
| Best for | Learning & testing | Production-like environment |
| Teardown | `docker-compose down` | `terraform destroy` |
| Scaling | Limited | Easy to scale |

---

## File Structure Explained

```
Proj/
├── backend/                    # Python API code
│   ├── main.py                 # FastAPI app
│   ├── models.py               # Database models
│   ├── schemas.py              # Data validation
│   ├── database.py             # DB setup
│   └── requirements.txt         # Python dependencies
│
├── frontend/                   # React app code
│   ├── src/
│   │   ├── App.js              # Main React component
│   │   ├── api.js              # API client
│   │   └── App.css             # Styling
│   └── package.json            # npm dependencies
│
├── terraform/
│   ├── main-simple.tf          # AWS infrastructure (simplified)
│   ├── variables-simple.tf      # Configuration variables
│   ├── install.sh              # Script runs on server startup
│   └── terraform.tfvars        # Your settings
│
├── Dockerfile.backend          # Backend container recipe
├── Dockerfile.frontend         # Frontend container recipe
├── docker-compose-simple.yml   # Run both containers together
├── nginx.conf                  # Nginx web server config
│
├── DOCKER_GUIDE.md             # Docker explanation
├── TERRAFORM_SIMPLIFIED.md     # Terraform explanation
└── README.md                   # General instructions
```

---

## Common Troubleshooting

### Docker: Port Already in Use
```bash
# Find what's using the port
docker ps

# Stop the containers
docker-compose -f docker-compose-simple.yml down
```

### Terraform: AWS Credentials Not Found
```bash
# Configure AWS
aws configure

# Enter your access key and secret
```

### Server Not Responding
```bash
# Check if instance is running
aws ec2 describe-instances --region us-east-1

# Wait 2-3 minutes for install.sh to complete
# Then visit: http://YOUR_IP
```

---

## Next Learning Steps

1. ✅ Run locally with Docker → Understand how containers work
2. ✅ Deploy with Terraform → Learn Infrastructure as Code
3. ✅ Modify the Terraform → Change server type, region, etc.
4. ✅ Add more AWS features → S3, RDS database, load balancer
5. ✅ Create CI/CD pipeline → Auto-deploy on code push

---

## Support Resources

**Docker Learning**
- Official Docs: https://docs.docker.com/
- Interactive Tutorial: https://www.docker.com/play-with-docker

**Terraform Learning**
- Official Docs: https://www.terraform.io/docs
- AWS + Terraform: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

**AWS Learning**
- Free Tier: https://aws.amazon.com/free/
- AWS Academy: https://aws.amazon.com/training/awsacademy/

---

**Ready to learn?** Pick Option 1 or 2 above and let's go! 🎉
