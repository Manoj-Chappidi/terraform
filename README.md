# AWS Infrastructure as Code with Terraform

This repository contains Terraform configuration files to set up an AWS infrastructure with the following components:

## Components

1. **VPC**
    - Name: \`mynginx-vpc\`
    - Public Subnets: 3
    - Private Subnets: 3
    - Internet Gateway: 1
    - NAT Gateway: 1

2. **EC2 Auto Scaling Group**
    - Minimum Instances: 2
    - Maximum Instances: 4
    - Subnets: Private Subnets only
    - NGINX installed on Ubuntu
    - No Public IPv4 assigned to EC2 instances
    - SSH access disabled

3. **Route 53 A Record**
    - Points to the NAT Gateway IP
    - Allows NGINX to serve the default webpage

## Terraform Commands

To deploy this infrastructure, follow these steps:

1. **Initialize Terraform**:
    \`\`\`sh
    terraform init
    \`\`\`

2. **Validate the Terraform configuration**:
    \`\`\`sh
    terraform validate
    \`\`\`

3. **Create an execution plan**:
    \`\`\`sh
    terraform plan
    \`\`\`

4. **Apply the execution plan**:
    \`\`\`sh
    terraform apply
    \`\`\`

5. **Destroy the infrastructure (if needed)**:
    \`\`\`sh
    terraform destroy
    \`\`\`

## Main Aim

The main aim of this project is to automate the provisioning of AWS infrastructure using Terraform. The setup includes a Virtual Private Cloud (VPC) with both public and private subnets, an EC2 Auto Scaling Group with NGINX installed on Ubuntu instances, and a Route 53 A record to route traffic to the NGINX servers through a NAT Gateway.

## Notes

- Ensure that you have the necessary AWS credentials configured before running the Terraform commands.
- Adjust the AWS region and other configurations as needed to match your specific requirements.

