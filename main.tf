terraform {
  backend "artifactory" {
    url      = "https://artifactory.company.com/artifactory"
    repo     = "pta-terraform"
    subpath  = "template-windows-10-prod"
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = "vc.company.com"

  # The released versions are listed here: https://github.com/terraform-providers/terraform-provider-vsphere/releases
  version        = "~> 1.15.0"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

module "template-windows-10-prod" {
  source                    = "git::https://github.com/Forcepoint/fp-pta-terraform-vsphere-vm-windows-datastore-cluster.git?ref=master"
  name                      = "template-windows-10-prod"
  folder                    = "PTA/Prod"
  vm_clone_from             = "PTA/Test/template-windows-10-test"
  ipv4_address              = "192.168.0.11"
  ipv4_netmask              = 24
  ipv4_gateway              = "192.168.0.1"
  dns_domain                = "company.com"
  dns_server_list           = ["192.168.0.2"]
  time_zone                 = 15
  product_key               = var.win_product_key
  full_name                 = var.admin_user
  admin_password            = var.admin_password
  workgroup                 = "WORKGROUP"
  vlan_main                 = "VLAN192"
  vsphere_datastore_cluster = "DS Cluster"
  vsphere_compute_cluster   = "General Cluster"
  vsphere_datacenter        = "DC"
  customize_timeout         = 20
}
