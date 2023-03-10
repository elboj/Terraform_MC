#Week One

##Introduction
    - What is IaC
    - Terraform and its benefits
    - Difference between terraform and ansible (The SQL example)

##Implementation Terraform 
    - Local 
    - Cloud 
    - Pipeline

Getting Started
    - Terraform Installation
      - Video Link: https://www.youtube.com/watch?v=Cn6xYf0QJME&t=1s
    - Azure CLI 
    - VSCode setup 
    - Neblus Project Introduction
    - Environment Diagram

Configuration Directory
    - main.tf

Understanding Providers
    - Provider Block
    - Azurerm

Using the resource block
    - Syntax
    - Using the terraform docs

Hands-on Lab One
    - Provision Primary VM

Working with Data Sources
    * Explaining the Load Balancer example
    * Using the data block

Hands-on Lab Two
    - Quick Note on Depedencies (TF declarative linear model)
    - Provision Neblus Primary Load balancer



Week Two
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

Installation: https://www.youtube.com/watch?v=Cn6xYf0QJME&t=1s
