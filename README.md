# Week One

## Resources
[Terraform Registry](https://registry.terraform.io/)

[Terraform Installation](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=1s)

[Terraform Download](https://developer.hashicorp.com/terraform/downloads)

[Azure CLI Download](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

[Neblus Env Diagram](https://docs.google.com/drawings/d/1lSOiX81K8q7fdcV8eH3FndmMZQ2d78TJxHCiwVXAFBg/edit)

## Introduction
    - What is IaC
    - Declarative Languages
    - Terraform and its benefits
    - Difference between terraform and ansible (The SQL example)

## Terraform Implementation
    - Local 
    - Cloud 
    - Pipeline 

## Getting Started
    - Terraform Installation (check link above)
    - Azure CLI 
    - VSCode setup 
    - Neblus Project Introduction
    - Environment Diagram

## Configuration Directory
    - main.tf
    - provider.tf
    - variables.tf (to be treated later)
    - output.tf (to be treated later)
    - variables.auto.tfvars (to be treated later)

## Understanding Providers
    - Provider Block
    - Azurerm

## Using the resource block
    - Syntax
    - Using the terraform docs
    - Terraform fmt
    - Terraform init
    - Terraform plan
    - Terraform apply
        - tf shorthand
        - Using -auto-approve

## Hands-on Lab One
    - Provision Primary VM

## Working with Data Sources
    * Explaining the Load Balancer example
    * Using the data block

## Hands-on Lab Two
    - Quick Note on Depedencies (TF linear processing model)
    - Provision Neblus Primary Load balancer



<!-- Week Two
Variables example 2
Dependencies
Output Variables
State file


Week Three
Lifecycle rules
Loops in terraform
Version constrain

Week Four
Terraform Modules
Terraform Functions
Capstone project

The big picture for the learning series should be as follows. 
A traffic manager, two Load balacers at the backend for DC and DR, and two VMs at the backend of the LB running IIS server 
and a simple webpage.

Installation: https://www.youtube.com/watch?v=Cn6xYf0QJME&t=1s -->
