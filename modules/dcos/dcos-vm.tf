resource "vsphere_virtual_machine" "dcos" {
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

  provisioner "file" {
    destination = "/etc/genconf/config.yml"
    content     = "${data.template_file.config.rendered}"
  }

  provisioner "file" {
    destination = "/etc/genconf/dcos_init.sh"
    content     = "${data.template_file.dcos_init.rendered}"
  }

  provisioner "file" {
    destination = "/etc/genconf/ip-detect"
    content     = "${data.template_file.ip_detect.rendered}"
  }

  provisioner "remote-exec" {
    inline = [
      "sh /etc/genconf/dcos_init.sh",
    ]
  }
}


data "template_file" "config" {
  template = "${file("${path.module}/files/config.tpl")}"

  vars {
    agents       = "  - ${join("\n  - ", var.mesos_agents_ips)}"
    publicagents = "  - ${join("\n  - ", var.mesos_publicagents_ips)}"
    master       = "${var.mesos_master_ip}"
    cluster      = "${var.cluster}"
  }
}

data "template_file" "dcos_init" {
  template = "${file("${path.module}/files/dcos_init.tpl")}"

  vars {
    agents       = "  - ${join("\n  - ", var.mesos_agents_ips)}"
    publicagents = "  - ${join("\n  - ", var.mesos_publicagents_ips)}"
    master       = "${var.mesos_master_ip}"
    cluster      = "${var.cluster}"
  }
}

data "template_file" "ip_detect" {
  template = "${file("${path.module}/files/ip_detect.tpl")}"

  vars {
    agents       = "  - ${join("\n  - ", var.mesos_agents_ips)}"
    publicagents = "  - ${join("\n  - ", var.mesos_publicagents_ips)}"
    master       = "${var.mesos_master_ip}"
    cluster      = "${var.cluster}"
  }
}
