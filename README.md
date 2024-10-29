# Azure Web App Deployment with Terraform

This Terraform module provisions an Azure Web App using a Linux-based App Service Plan configured with Python as the runtime stack. It allows users to create a new Web App and define its configuration, including specifying the desired region, resource group, and runtime stack.

## Features

- Creates an Azure Resource Group (if not provided).
- Sets up an App Service Plan on Linux.
- Deploys an Azure Web App running Python.
- Configurable through variables for flexible deployment.
