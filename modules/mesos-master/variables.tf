/* variables that should be set at run */
variable "datacenter_name" {}

/* defaults */
variable "name" {
  default = "mesos-master"
}
variable "network_label" {
  default = "DCOS Network"
}
variable "ipv4_gateway" {
  default = "10.0.1.1"
}
variable "ipv4_address" {
  default = "10.0.1.180"
}
variable "ipv4_prefix_length" {
  default = "24"
}
variable "dns_servers" {
  default = ["10.0.1.10", "8.8.8.8"]
}
variable "datastore" {
  default = "datastore"
}
variable "disk_template" {
  default = "mesos-master.vmdk"
}
variable "disk_type" {
  default = "thin"
}
variable "timezone" {
  default = "Europe/London"
}
variable "vcpu" {
  default = "2"
}
variable "memory" {
  default = "4096"
}
variable "size" {
  default = "120"
}
variable "domain" {
  default = "homelab.local"
}
variable "cluster" {
  default = "dcos-cluster"
}
