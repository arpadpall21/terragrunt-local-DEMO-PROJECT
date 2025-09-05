remote_state {
  backend = "local"
  generate = {
    path      = "${get_parent_terragrunt_dir()}/../backend/${path_relative_to_include()}/backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {}
}

// usually this is where the provider file (provider.tf) is also generated