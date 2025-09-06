include "root" {                                    // executes the referenced file here
  path   = find_in_parent_folders("root.hcl")
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {                                         // imports the terrafrom module
  source = "../../../modules/app"
}

dependency "vnet" {                                 // dependency
  config_path = "../vnet"

  mock_outputs = {                                  // mock value (in case the unit is deployed alone or for stack plan)
    network_name = "mocked network name"
  }
}

inputs = {                                          // inputs passed to the terraform module
  filename      = "${get_terragrunt_dir()}/${include.env.locals.environment}-app.txt"
  environment   = include.env.locals.environment
  resource_name = "${include.env.locals.environment}-app"
  network       = dependency.vnet.outputs.network_name
}
