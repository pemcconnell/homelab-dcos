resource "vsphere_virtual_machine" "dcos-agent" {
  name       = "${var.agent-name}"
  vcpu       = "${var.agent-vcpu}"
  memory     = "${var.agent-memory}"
  datacenter = "${var.datacenter}"
  domain     = "${var.agent-domain}"

  network_interface {
    label = "${var.network-label}"
  }

  disk {
    template = "dcos-agent"
  }
}
