# 🌦 Weather App – Fast Clean Final (Dev Branch)

## 📌 Project Overview  
This branch contains a **clean and optimized Terraform + GitHub Actions setup** for deploying the Weather App on Azure.  

It includes:  
- **Infrastructure as Code (IaC)** with Terraform for:
  - Azure Kubernetes Service (AKS)
  - Azure Redis Cache (Test & Prod)
  - Azure Container Registry (ACR)
  - Azure Storage Account for Terraform backend
- **Automated CI/CD** via GitHub Actions to deploy infrastructure and application
- **Optimized folder structure** for quicker deployment and testing

---

## 🚀 Deployment Steps (for this branch)  

### 1️⃣ Prerequisites
- Azure CLI installed & authenticated  
- Terraform v1.9+ installed  
- GitHub account with repo access  
- OpenWeather API key

---

### 2️⃣ GitHub Secrets
Navigate to: **Repo → Settings → Secrets and variables → Actions → New repository secret**

Add the following secrets:

#### `AZURE_CREDENTIALS`
JSON output from Azure Service Principal creation:
```json
{
  "clientId": "xxxx",
  "clientSecret": "xxxx",
  "subscriptionId": "xxxx",
  "tenantId": "xxxx"
}
```

#### `GHCR_TOKEN`
GHCR_TOKEN
GitHub token with write:packages scope.

WEATHER_API_KEY
- Your OpenWeather API key.

### 3️⃣ Terraform Backend
We use an Azure Storage Account to store the Terraform state remotely:

``` hcl
backend "azurerm" {
  resource_group_name  = "tfstate-rg"
  storage_account_name = "stroageweatherapp"
  container_name       = "container1"
  key                  = "terraform.tfstate"
}
```

### 4️⃣ GitHub Actions Workflow
- The deploy.yml workflow:

- Runs terraform init, terraform validate, terraform plan, and terraform apply automatically on push to this branch.

- Deploys all resources to Azure.

- Ensures CI/CD integration for infrastructure provisioning.

###  How to Push This Branch
```bash
# Create branch from current work
git checkout -b fast-clean-final

# Add and commit changes
git add .
git commit -m "Clean branch with Terraform + GitHub Actions deployment"

# Push to GitHub
git push origin dev
```
