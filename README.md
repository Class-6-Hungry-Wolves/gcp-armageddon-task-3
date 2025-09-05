# gcp-armageddon-task-3
#GCP Armageddon Task 3 README!!!

# GCP Infrastructure with Terraform

A comprehensive Terraform configuration for deploying scalable infrastructure on Google Cloud Platform (GCP) with load balancing, auto-scaling, and managed instance groups.

#Architecture Overview

This Terraform project creates a complete GCP infrastructure including:

- **VPC Network** with custom subnets
- **Load Balancer** with frontend and backend configuration
- **Managed Instance Groups (MIG)** with auto-scaling
- **Health Checks** for application monitoring  
- **NAT Gateway** for secure outbound connectivity
- **Firewall Rules** for network security
- **Compute Instances** with custom templates

## Prerequisites

Before you begin, ensure you have:

- [Terraform](https://www.terraform.io/downloads.html) v1.0+ installed
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured
- GCP Project with billing enabled
- Service Account with appropriate permissions
- `gcloud` CLI authenticated

### Required GCP APIs

Enable these APIs in your GCP project:
```bash
gcloud services enable compute.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com
```

### Authentication Setup

```bash
# Authenticate with Google Cloud
gcloud auth login
gcloud config set project YOUR_PROJECT_ID

# Create service account (optional)
gcloud iam service-accounts create terraform-sa
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
    --member="serviceAccount:terraform-sa@YOUR_PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/editor"
```

#Quick Start

1. **Clone and navigate to the project:**
   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review and customize variables:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your specific values
   ```

4. **Plan the deployment:**
   ```bash
   terraform plan
   ```

5. **Deploy the infrastructure:**
   ```bash
   terraform apply
   ```

6. **Run post-deployment script:**
   ```bash
   ./nick.sh
   ```

#File Structure

| File | Description |
|------|-------------|
| `0-authentication.tf` | GCP provider and authentication setup |
| `1-backend.tf` | Terraform backend configuration |
| `2-vpc.tf` | Virtual Private Cloud (VPC) network |
| `3-subnets.tf` | Subnet configurations across regions |
| `4-router.tf` | Cloud Router for NAT gateway |
| `5-nat.tf` | NAT Gateway for outbound internet access |
| `6-firewall.tf` | Firewall rules and security groups |
| `7a-compute.tf` | Compute instance configurations |
| `7b-template.tf` | Instance template for MIG |
| `8-health-checks.tf` | Health check configurations |
| `9-mig.tf` | Managed Instance Group with auto-scaling |
| `10-autoscale-policy.tf` | Auto-scaling policies and rules |
| `11-lb-backend.tf` | Load balancer backend configuration |
| `12-lb-frontend.tf` | Load balancer frontend and forwarding rules |
| `startup.sh` | Instance startup script |
| `joshua.sh` | Post-deployment automation script |
| `jourdan.sh` | Post-deployment automation script |
| `nick.sh` | Post-deployment automation script |
| `vito.sh` | Post-deployment automation script |
| `xavier.sh` | Post-deployment automation script |
| `yahshua.sh` | Post-deployment automation script |


#Configuration

### Standard Makeup

**VPC Network (`2-vpc.tf`)**
- Creates custom VPC network
- Configures routing mode and settings

**Subnets (`3-subnets.tf`)**
- Multi-region subnet deployment
- Private and public subnet configurations
- IP range allocations

**Load Balancer (`11-lb-backend.tf`, `12-lb-frontend.tf`)**
- HTTP(S) Load Balancer setup
- Backend service configuration
- Frontend forwarding rules
- SSL certificate management

**Auto-scaling (`9-mig.tf`, `10-autoscale-policy.tf`)**
- Managed Instance Groups
- CPU and custom metric-based scaling
- Health check integration
- Rolling updates configuration

### Key Variables

Create a `terraform.tfvars` file with your specific values:

```hcl
project_id = "your-gcp-project-id"
region     = "us-central1"
zone       = "us-central1-a"

# Network Configuration
vpc_name = "my-vpc"
subnet_cidr = "10.0.0.0/24"

# Instance Configuration
machine_type = "e2-medium"
disk_size    = 20
image_family = "ubuntu-2004-lts"

# Auto-scaling Configuration
min_replicas = 1
max_replicas = 10
target_cpu_utilization = 0.75
```

#Deployment Scripts

### `startup.sh`
Instance initialization script that runs on VM startup:
- Installs required packages
- Configures application services
- Sets up monitoring agents

### `nick.sh`
Post-deployment automation script:
- Validates infrastructure deployment
- Configures additional services
- Performs health checks
- Sets up monitoring and alerting

**Usage:**
```bash
chmod +x nick.sh
./nick.sh
```

#Monitoring and Health Checks

The infrastructure includes comprehensive health monitoring:

**Health Checks (`8-health-checks.tf`)**
- HTTP health checks for load balancer backends
- TCP health checks for database connections
- Custom health check endpoints

**Auto-scaling Metrics (`10-autoscale-policy.tf`)**
- CPU utilization monitoring
- Memory usage tracking
- Custom application metrics
- Request rate-based scaling

##Management Commands

### Terraform Operations
```bash
# Initialize and plan
terraform init
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy

#Check current state
terraform show
terraform state list
```

# GCP Resource Management
```bash
# Check instances
gcloud compute instances list

# View load balancer status
gcloud compute forwarding-rules list
gcloud compute backend-services list

# Monitor auto-scaling
gcloud compute instance-groups managed list
gcloud compute instance-groups managed describe <instance-group-name> --zone <zone>
```

#Security

- **Firewall Rules**: Restricts network access to necessary ports only
- **NAT Gateway**: Provides secure outbound internet access for private instances
- **Health Checks**: Ensures only healthy instances receive traffic
- **IAM Integration**: Uses service accounts with minimal required permissions

#Testing

### Validate Infrastructure
```bash
# Test load balancer endpoint
curl -I http://LOAD_BALANCER_IP

# Check instance health
gcloud compute backend-services get-health <backend-service-name> --global

# Monitor auto-scaling behavior
gcloud compute operations list --filter="operationType:compute.autoscalers.patch"
```

#Load Testing
```bash
# Basic load test (install apache2-utils first)
ab -n 1000 -c 10 http://LOAD_BALANCER_IP/

# Monitor scaling response
watch gcloud compute instance-groups managed list
```

#Troubleshooting

### Common Issues

**Terraform Init Fails**
```bash
# Clear terraform cache
rm -rf .terraform/
terraform init
```

**Authentication Errors**
```bash
gcloud auth list
gcloud config list
export GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account.json"
```

**Instance Template Updates**
```bash
# Force recreate instance template
terraform taint google_compute_instance_template.main
terraform apply
```

**Load Balancer Health Check Failures**
- Check firewall rules allow health check IP ranges
- Verify application is responding on configured port
- Review startup script logs: `gcloud compute instances get-serial-port-output INSTANCE_NAME`

### Useful Debugging Commands
```bash
# View terraform logs
export TF_LOG=DEBUG
terraform apply

# Check GCP quotas
gcloud compute project-info describe --project=PROJECT_ID

# Instance startup script logs
gcloud compute instances get-serial-port-output INSTANCE_NAME --zone ZONE
```

#Cost Optimization

- **Instance Types**: Use appropriate machine types for workload
- **Auto-scaling**: Configure proper min/max limits
- **Preemptible Instances**: Consider for non-critical workloads
- **Regional Resources**: Use regional persistent disks where appropriate

#Updates and Maintenance

### Rolling Updates
```bash
# Update instance template
terraform apply

# Trigger rolling update
gcloud compute instance-groups managed rolling-action start-update <instance-group> \
    --version template=<new-template> --zone <zone>
```

### Backup Strategy
- Infrastructure state is stored in GCS backend
- Regular terraform state backups
- Instance snapshots for persistent data

##Support

For issues and questions:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review GCP logs in Cloud Console
3. Validate Terraform configuration with `terraform validate`
4. Check resource quotas and billing status

---

**Last Updated**: August 2025  
**Terraform Version**: 1.5+  
**GCP Provider Version**: 4.0+
#