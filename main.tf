module "mesos-master" {
  source = "./modules/mesos-master"

  datacenter_name = "${var.datacenter_name}"
  domain          = "${var.domain}"
  cluster         = "${var.cluster}"
  dns_servers     = ["${var.dns_servers}"]
  timezone        = "${var.timezone}"
  ipv4_address    = "${var.mesos-master-ipv4_address}"
  datastore       = "${var.vsphere_datastore}"
}

module "mesos-agent" {
  source = "./modules/mesos-agent"

  datacenter_name = "${var.datacenter_name}"
  domain          = "${var.domain}"
  cluster         = "${var.cluster}"
  dns_servers     = ["${var.dns_servers}"]
  timezone        = "${var.timezone}"
  ipv4_address    = "${var.mesos-agent-ipv4_address}"
  datastore       = "${var.vsphere_datastore}"
}

module "mesos-publicagent" {
  source = "./modules/mesos-agent"

  datacenter_name = "${var.datacenter_name}"
  domain          = "${var.domain}"
  cluster         = "${var.cluster}"
  dns_servers     = ["${var.dns_servers}"]
  timezone        = "${var.timezone}"
  ipv4_address    = "${var.mesos-publicagent-ipv4_address}"
  datastore       = "${var.vsphere_datastore}"
}

module "dcos" {
  source = "./modules/dcos"

  datacenter_name        = "${var.datacenter_name}"
  domain                 = "${var.domain}"
  cluster                = "${var.cluster}"
  dns_servers            = ["${var.dns_servers}"]
  timezone               = "${var.timezone}"
  mesos_master_ip        = "${module.mesos-master.ip}"
  mesos_agents_ips       = ["${module.mesos-agent.ip}"]
  mesos_publicagents_ips = ["${module.mesos-publicagent.ip}"]
  datastore       = "${var.vsphere_datastore}"
}
