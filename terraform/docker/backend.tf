resource "docker_hub_repository" "authentik_platform_lab" {
    name        = "authentik-platform-lab"
    description = "My Docker repository managed by Terraform"
    namespace   = "dyim42_authentik_terraform_lab"
    private     = false
}

terraform {
    # temporarily set it for local while we build out the remote backend
    backend "local" {
        path = "state/terraform.tfstate"
    }
}
