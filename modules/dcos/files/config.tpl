---
agent_list:
${agents}
public_agent_list:
${publicagents}
master_list:
${master}
resolvers:
  - 8.8.4.4
  - 8.8.8.8
ssh_port: 22
ssh_user: core
bootstrap_url: file:///opt/dcos_install_tmp
cluster_name: ${cluster}
exhibitor_storage_backend: static
master_discovery: static
ip_detect_public_filename: /etc/ip_detect.sh
