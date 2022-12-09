## azure region
region = "East US"

## stack environment
environment = "dev"

tags = {
    environment_name         = "Dev"
    location                 = "East US"
    team_name                = "Devops Team"
}

## resource group configuration map
resource_groups = {
  "rg" = {
    create_resource_group      = true
    location                   = "East US"
    resource_group_name        = "mytestrg"
  }
}
