output "ip" {
  value = "${vsphere_virtual_machine.mesos-agent.network_interface.ipv4_address}"
}
