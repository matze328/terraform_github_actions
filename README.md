# terraform_github_actions
 
name: Terraform deploy

on: workflow_dispatch

jobs:
  copy: # kopiert den Repository Inhalt auf den Runner
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@v4
    - name: ls
      run: |
        ls
  image-push:
    runs-on: ubuntu-latest
    steps:
    # Code Kopieren
    - name: checkout
      uses: actions/checkout@v4
    # Bei AWS Authentifizieren
    - name: Configure AWS Credentials 2
      uses: aws-actions/configure-aws-credentials@v4
      with:
        aws-region: eu-central-1
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-session-token: ${{ secrets.AWS_SESSION_TOKEN }}
     # Terraform installieren
    - name: Install Terraform
      run: |
       curl -LO https://raw.githubusercontent.com/hashicorp/setup-terraform/main/scripts/install.sh
       chmod +x install.sh
       ./install.sh

  
    - name: Terraform Init
      run: terraform init

    - name: Terraform Fmt check
      run: terraform fmt --check

    - name: Terraform Plan
      run: terraform plan

    - name: Terraform Validate
      run: terraform validate
  
    - name: Terraform Apply
      run: terraform apply -auto-approve