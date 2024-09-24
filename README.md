# Terraform AWS EC2 Instance

This repository contains Terraform code to provision an **EC2 instance** on **AWS** using a **Free Tier eligible** configuration. The instance is based on either **Amazon Linux 2** or **Ubuntu**, and is configured to run using **t2.micro** or **t4g.micro** instance types to stay within Free Tier limits.

## Features

- **EC2 Instance**: A single EC2 instance using either `t2.micro` (x86_64) or `t4g.micro` (arm64) instance types.
- **Free Tier Eligible**: Designed to help you stay within the AWS Free Tier limits.
- **Customizable**: Easily switch between Ubuntu or Amazon Linux 2, and modify instance types or regions.
- **Tagging**: Each instance is tagged for easy identification in your AWS environment.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads) (v1.0.0 or later)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- An **AWS Account** with permissions to create EC2 instances and associated resources
- Git (optional, for cloning and contributing)

### AWS Credentials

You can set up AWS credentials using the AWS CLI:

```bash
aws configure
```

Make sure your AWS user has the following permissions:

- ec2:RunInstances
- ec2:TerminateInstances
- ec2:DescribeInstances
- vpc:CreateSecurityGroup
- vpc:AuthorizeSecurityGroupIngress

## Usage

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/terraform-aws-ec2-instance.git
cd terraform-aws-ec2-instance
```

### 2. Modify the Configuration (Optional)

By default, the EC2 instance uses the Amazon Linux 2 AMI and the t2.micro instance type. If you'd like to use Ubuntu or the t4g.micro (Graviton/arm64) instance, modify the main.tf file.

Example configuration:

```hcl
provider "aws" {
  region = "us-west-2"  # Change the region if needed
}

resource "aws_instance" "ec2-controller" {
  ami           = "ami-0dba2cb6798deb6d8"  # Ubuntu 20.04 LTS x86_64 Free Tier Eligible AMI
  instance_type = "t2.micro"               # Change to 't4g.micro' for ARM64 architecture

  tags = {
    Name = "MyFreeTierEC2"
  }
}

```

To find the correct AMI ID for your region, check the AWS console or use the AWS CLI:

```bash
aws ec2 describe-images --owners 099720109477 --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*" --query 'Images[*].[ImageId]' --output text
```

### 3. Initialize Terraform

Run the following command to initialize Terraform:

```bash
terraform init
```

### 4. Apply the Terraform Configuration

To create the EC2 instance, use:

```bash
terraform apply
```

Review the planned actions, then type yes to confirm and create the resources.

### 5. SSH into Your EC2 Instance

Once Terraform finishes, it will output the public IP of the EC2 instance. You can SSH into the instance using:

```bash
ssh -i /path/to/your/key.pem ec2-user@<instance-public-ip>
```

Replace /path/to/your/key.pem with your actual private key file, and <instance-public-ip> with the public IP provided by Terraform.

### 6. Destroy the Resources

To avoid incurring charges, destroy the resources when you are done:

```bash
terraform destroy
```

## Customization

Feel free to customize the main.tf file to suit your specific needs. You can change the AMI, instance type, region, and other parameters based on your project requirements.

### Common Customizations:

Instance Type: Modify instance_type to change the EC2 size (e.g., t2.micro, t4g.micro).
AMI: Update the ami to use a different Linux distribution or version.
Security Groups: You can add or modify security groups for additional network control.
Contributing
Feel free to fork this repository, submit issues, or send pull requests to improve or extend the functionality.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
