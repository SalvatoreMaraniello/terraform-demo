# Terraform Demo

A simple Terraform demo on GCP. In a *real life* project, this code would sit in a folder within your project, perhaps under *infra* or similar.

For CI/CD, part of it could be triggered by (say) github action or similar.


## Pre-requisites

- [Install *Terraform*](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) locally. For Mac OS:
    ```sh
    brew tap hashicorp/tap
    brew install terraform
    # update to latest version
    brew update
    brew upgrade hashicorp/tap/terraform
    ```

    To verify is all good, try: `terraform -help`

- A GCP service account with permissions: BigQuery Admin, Compute Admin & Storage Admin. Add its json key under under `keys/terraform-runner-gcp.json`.
    - If you are running Terraform from your workstation, you can also use `gcloud` and authenticate using *User Application Default Credentials* ("ADCs") as a primary authentication method. You can enable ADCs using `gcloud auth application-default login`. See also [Google provider configuration reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)


- Source the following environmental variables:

    - GCP project id.
        ```sh
        GCP_PROJECT_ID=***
        ```

    - If authenticating using service account, Terraform will need the path to service account json key:
        ```sh
        # Path to service account json key (optional). 
        GOOGLE_CREDENTIALS=keys/terraform-runner-gcp.json
        ```

- run `terraform init` to get the GCP provider.



## Managing infrastructure

- After updating, ensure to format as `terraform fmt`


## More about Terraform...

- [Terraform personal notes](https://www.notion.so/1-2-Terraform-4eb0b90017fa449995531f5e5490fe28)
- [Terraform *Getting started* on GCP](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build)
- [Google provider configuration reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)

