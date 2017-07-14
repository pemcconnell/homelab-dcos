/* variables that should be set at run */
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "vsphere_datastore" {}

/* defaults */
variable "datacenter_name" {
  default = "homelab"
}
variable "domain" {
  default = "homelab.local"
}
variable "cluster" {
  default = "dcos-cluster"
}
variable "dns_servers" {
  default = ["10.0.1.10", "8.8.8.8"]
}
variable "timezone" {
  default = "Europe/London"
}
variable "mesos-master-ipv4_address" {
  default = "10.0.1.170"
}
variable "mesos-agent-ipv4_address" {
  default = "10.0.1.180"
}
variable "mesos-publicagent-ipv4_address" {
  default = "10.0.1.190"
}
