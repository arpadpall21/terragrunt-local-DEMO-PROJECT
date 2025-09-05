# Terragrunt Local

## Description
- Terragrunt project with `local_file` resources only. The purpose of this project is to demonstrate and document a recommended Terragrunt project structure without needing any provider or remote connection

## Requirements
 - Terragrunt ^0.84.1

## Usage
  - `dev` or `prod` stacks can be executed (CMD `terragrunt run --all plan|apply|destroy`) from:
    - `deployments/dev` 
    - `deployments/prod`
  - units can be executed (CMD `terragrunt plan|apply|destroy`) from:
    - `deployments/dev/app`
    - `deployments/dev/vnet`
    - `deployments/prod/app`
    - `deployments/prod/vnet`
