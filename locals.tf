locals {

  tags = {
    environment_name         = var.environment
    availability_zone        = "None"
    location                 = var.region
    team_name                = "Devops Team"
  }
}
