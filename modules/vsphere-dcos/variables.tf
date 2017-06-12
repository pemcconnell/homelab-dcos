variable "datacenter" {
  default = "homelab"
}
variable "network-label" {
  default = "Homelab DCOS"
}
variable "master-name" {
  default = "dcos-master"
}
variable "master-vcpu" {
  default = "2"
}
variable "master-memory" {
  default = "4096"
}
variable "master-disk" {
  default = "dcos-master.vmdk"
}
variable "master-size" {
  default = "60"
}
variable "master-domain" {
  default = "dcos-master.local"
}
variable "agent-name" {
  default = "dcos-agent"
}
variable "agent-vcpu" {
  default = "2"
}
variable "agent-memory" {
  default = "4096"
}
variable "agent-disk" {
  default = "dcos-agent.vmdk"
}
variable "agent-size" {
  default = "120"
}
variable "agent-domain" {
  default = "dcos-agent.local"
}
