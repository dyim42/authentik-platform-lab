resource "docker_hub_repository" "authentik_platform_lab" {
    name        = "authentik-platform-lab"
    description = "My Docker repository managed by Terraform"
    visibility  = "public"
}

terraform {
    backend "local" {
        path = "state/terraform.tfstate"
    }
}