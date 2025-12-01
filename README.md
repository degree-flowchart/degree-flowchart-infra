# Degree Flowchart Infrastructure

This repository contains the Terraform configuration for the Degree Flowchart application infrastructure on AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials

## Structure

- `vpc.tf`: Configures the Virtual Private Cloud, subnets, and networking.
- `eks.tf`: Configures the Elastic Kubernetes Service cluster and node groups.
- `ecr.tf`: Configures Elastic Container Registry repositories for microservices.
- `variables.tf`: Input variables for customization.
- `outputs.tf`: Output values useful for other tools (e.g., cluster endpoint).

## Usage

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

2.  **Review the plan:**
    ```bash
    terraform plan
    ```

3.  **Apply the configuration:**
    ```bash
    terraform apply
    ```

4.  **Connect kubectl to the cluster:**
    ```bash
    aws eks update-kubeconfig --region <region> --name <cluster_name>
    ```
