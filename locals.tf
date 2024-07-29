locals {
  metadata = {
    user-data = "${file(var.path_to_meta_data_user)}"
  }
}
