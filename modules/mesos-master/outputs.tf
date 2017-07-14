output "ip" {
  value = "${vsphere_virtual_machine.mesos-master.network_interface.ipv4_address}"
}
