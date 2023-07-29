# terraform-preview-envs

> Conference at Talent Land 2023

This repository contains infrastructure as code written in Terraform that creates cloud services using GitHub actions, allowing changes to be previewed in ephemeral environments before being deployed to production.

## Workflows

tf-unit-tests.yml: Runs unit tests for Terraform code and creates code scanning reports.

tf-drift.yml: Detects drifts between Terraform configuration and the actual state of the cloud resources, then creates issue.

tf-plan-apply.yml: Applies the Terraform changes in the cloud production environment.

**tf-prev.yml**: Creates a preview environment for a pull request, allowing changes to be tested before they are merged.

## Getting started

1. Create an Azure Storage account.
2. Update Storage account info on [main.tf](main.tf) at the backend block.
3. Create 2 apps on Azure Active Directory (Write and Read)
4. Register federated credentials for each of them (using environments, pull requests and branches)
5. Assign RBAC to the Storage Account with Reader and Data Access to both apps.
6. Assign RBAC to your Azure Subscription with Contributor for the Write app and Reader for the other app.
7. Get Client Id, Object Id and Tenant Id from both apps.
8. Register them as GitHub secrets and separating Client Id on environment secrets.
9. Create a branch called prevenvs
10. Create a branch with your feature and make a pr. Compare it with prevenvs.
11. A GitHub Action workflow will be triggered

![](static/img/pr%20deploy%20staging.png)

![](static/img/ephemeral%20staging.png)

12. Once deployed and success on the checks. Merge the pull request and check the ephemeral environments has gone.

![](static/img/resource%20groups%20after%20pr%20merge.png)


## Contributing

Contributions to this project are welcome. If you would like to contribute, please read the [CONTRIBUTING.md](#contributing) file for guidelines.

## Resources

### Terraform
* [Use Terraform to create a Linux VM](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?wt.mc_id=studentamb_118941)
* [Terraform Registry](https://registry.terraform.io/browse/providers)
* [HashiCorp Configuration Language (HCL)](https://github.com/hashicorp/hcl)
* [Terraform Cheat sheet](https://spacelift.io/blog/terraform-commands-cheat-sheet)

### Tutorials
* [ARM Templates](https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/?wt.mc_id=studentamb_118941)
* [Terraform Azure](https://developer.hashicorp.com/terraform/tutorials/azure-get-started)
* [Terraform AWS](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)
* [Terraform GCP](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started)

### Examples

#### Terraform
* [terraform-azure-examples](https://github.com/alfonsof/terraform-azure-examples)
* [terraform-aws-examples](https://github.com/alfonsof/terraform-aws-examples)
* [terraform-google-cloud-examples](https://github.com/alfonsof/terraform-google-cloud-examples)

#### Docker sample
- [Docker samples that could be put within the src folder](https://docs.docker.com/samples/)
- [Install Docker with a script](https://docs.docker.com/engine/install/centos/#install-using-the-convenience-script)