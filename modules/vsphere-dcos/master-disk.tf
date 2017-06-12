resource "vsphere_virtual_disk" "dcos-master" {
  size          = "${var.master-size}"
  vmdk_path     = "${var.master-disk}"
  datacenter    = "${var.datacenter}"
  datastore     = "local"
  adapter_type  = "lsiLogic"
}
