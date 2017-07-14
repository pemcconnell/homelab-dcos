resource "vsphere_virtual_machine" "mesos-agent" {
  name       = "${var.name}"
  vcpu       = "${var.vcpu}"
  memory     = "${var.memory}"
  domain     = "${var.domain}"
  datacenter = "${var.datacenter_name}"
  cluster    = "${var.cluster}"

  network_interface {
    label              = "${var.network_label}"
    ipv4_gateway       = "${var.ipv4_gateway}"
    ipv4_address       = "${var.ipv4_address}"
    ipv4_prefix_length = "${var.ipv4_prefix_length}"
  }

  dns_servers = ["${var.dns_servers}"]

  disk {
    datastore = "${var.datastore}"
    template  = "${var.disk_template}"
    type      = "${var.disk_type}"
  }

  time_zone = "${var.timezone}"
}
