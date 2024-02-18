# Terraform Demo

A simple Terraform demo on GCP. 

In a *real life* project, this code would sit in a folder within your project, perhaps under *infra* or similar.

For CI/CD, part of it could be triggered by (say) github action or similar.

**Credits:** [DE Zoomcamp, Youtube](https://www.youtube.com/watch?v=Y2ux7gq3Z0o&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=13)


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

- A GCP service account `terraform-runner` with permissions: BigQuery Admin, Compute Admin & Storage Admin. Add its json key under under `keys/terraform-runner-gcp.json`.
    - If you are running Terraform from your workstation, you can also use `gcloud` and authenticate using *User Application Default Credentials* ("ADCs") as a primary authentication method. You can enable ADCs using `gcloud auth application-default login`. See also [Google provider configuration reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)

- If authenticating using service account, Terraform will need the path to service account json key:
    ```sh
    # Path to service account json key (optional). 
    GOOGLE_CREDENTIALS=keys/terraform-runner-gcp.json
    ```

- run `terraform init` to get the GCP provider.


## Deploy new resources.

- `terraform plan`. Check the plan - in particular the options and defaults of all resources to be created.

- `terraform apply`. To deploy.


## Destroy resources

- `terraform destroy`


## Way of working

- After every update to the Terraform code, ensure to format as `terraform fmt`.

- Refer to the [Terraform Registry](https://registry.terraform.io/) for snippets of code; [start here for GCP specific content](https://registry.terraform.io/providers/hashicorp/google/latest/docs).

- [Using environmental variables](https://support.hashicorp.com/hc/en-us/articles/4547786359571-Reading-and-using-environment-variables-in-Terraform-runs#:~:text=Terraform%20can%20directly%20access%20environment,using%20variable%20%22foo%22%20%7B%7D%20.): Terraform can directly access environment variables that are named using the pattern `TF_VAR_`. Otherwise, use the external data source.



## More about Terraform...

- [Terraform personal notes](https://www.notion.so/1-2-Terraform-4eb0b90017fa449995531f5e5490fe28)
- [Terraform *Getting started* on GCP](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build)
- [Google provider configuration reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)
- [Terraform Registry](https://registry.terraform.io/) | [start here for GCP specific content](https://registry.terraform.io/providers/hashicorp/google/latest/docs).

