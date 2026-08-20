# source: https://registry.terraform.io/providers/docker/docker/latest/docs

terraform {
    required_providers {
        docker = {
            source  = "docker/docker"
            version = "~> 0.2"
        }
    }
}

