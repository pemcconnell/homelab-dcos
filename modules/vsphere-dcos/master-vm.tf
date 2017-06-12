resource "vsphere_virtual_machine" "dcos-master" {
  name   = "dcos-master"
  vcpu   = 2
  memory = 4096
  domain = "dcos-master.local"

  network_interface {
    label = "DCOS Network"
  }

  disk {
    template = "dcos-master"
  }
}
