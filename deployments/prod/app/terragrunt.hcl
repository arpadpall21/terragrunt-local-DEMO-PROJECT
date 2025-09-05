include "root" {
  path   = find_in_parent_folders("root.hcl")
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {
  source = "../../../modules/app"
}

dependency "vnet" {
  config_path = "../vnet"

  mock_outputs = {
    network_name = "mocked netwkork name"
  }
}

inputs = {
  filename      = "${get_terragrunt_dir()}/${include.env.locals.environment}-app.txt"
  environment   = include.env.locals.environment
  resource_name = "${include.env.locals.environment}-app"
  network       = dependency.vnet.outputs.network_name
}
