resource "vsphere_virtual_disk" "dcos-agent" {
  size          = "${var.agent-size}"
  vmdk_path     = "${var.agent-disk}"
  datacenter    = "${var.datacenter}"
  datastore     = "local"
  adapter_type  = "lsiLogic"
}
