include "root" {
  path   = find_in_parent_folders("root.hcl")
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {
  source = "../../../modules/vnet"

}

inputs = {
  filename     = "${get_terragrunt_dir()}/${include.env.locals.environment}-vnet.txt"
  environment   = include.env.locals.environment
  resource_name = include.env.locals.network_name
}
