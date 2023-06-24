
#############################################################################################################
# VM CONFIGURATION - WINDOWS
#############################################################################################################

# Define image and number of nodes for windows
windows_image = "StefanScherer/windows_2019"

# Node count
windows_node_count = 1

# VM specs
windows_vm_memory = 2048
windows_vm_cpus = 2

# Vm hostname. It expects a string. It will be appended automatically to the node count later. example: node-01, node-02, etc.
# Only accepts characters, numbers and dashes. No spaces or special characters or underscores.
windows_vm_hostname = "windows-node"

#############################################################################################################
# VM CONFIGURATION - LINUX
#############################################################################################################

# Define image and number of nodes for linux
linux_image = "ubuntu/focal64"

# Node count
linux_node_count = 1

# VM specs
linux_vm_memory = 2048
linux_vm_cpus = 2

# Vm hostname. It expects a string. It will be appended automatically to the node count later. example: node-01, node-02, etc.
# Only accepts characters, numbers and dashes. No spaces or special characters or underscores.
linux_vm_hostname = "linux-node"

#############################################################################################################
# NETWORK CONFIGURATION
#############################################################################################################

# attach to the default network interface. Can be changed to a specific interface. it expects a string with the interface name. ie "eth0".
$default_network_interface=`ip route | awk '/^default/ {printf "%s", $5; exit 0}'`

# get the ip address of the default network interface. It expects a string with the ip address such as 192.168.0 or 10.0.0 or 172.16.0, etc.
default_ip_address=`ip route | grep "$default_network_interface" | awk '{printf "%s", $3}' | sed 's/\.[^\.]*$//'`

# starting last octet for the ip address of the VMs. It expects an integer. This completes the entire IP range for the VMs.
windows_last_octet = 90
linux_last_octet = 180

# Global network settings
network_type="public_network"


#############################################################################################################
# VAGRANT CONFIGURATION STARTS HERE. CHANGE AT YOUR OWN RISK.
#############################################################################################################

Vagrant.configure("2") do |config|
  # Use a loop to create multiple VMs with the same configuration
  (0..windows_node_count-1).each do |i|
    config.vm.define "#{windows_vm_hostname}-#{i.to_s.rjust(2, "0")}" do |node|
      node.vm.box = windows_image
      node.vm.hostname = "#{windows_vm_hostname}-#{i.to_s.rjust(2, "0")}"
      node.vm.network "#{network_type}", ip: "#{default_ip_address}.#{windows_last_octet + i}", bridge: $default_network_interface
      node.vm.provision "shell", path: "provision_scripts/winrmsetup.ps1"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = windows_vm_memory
        vb.cpus = windows_vm_cpus
      end
    end
  end
  # Use a loop to create multiple VMs with the same configuration
  (0..linux_node_count-1).each do |i|
    config.vm.define "#{linux_vm_hostname}-#{i.to_s.rjust(2, "0")}" do |node|
      node.vm.box = linux_image
      node.vm.hostname = "#{linux_vm_hostname}-#{i.to_s.rjust(2, "0")}"
      node.vm.network "#{network_type}", ip: "#{default_ip_address}.#{linux_last_octet + i}", bridge: $default_network_interface
      node.vm.provision "shell", path: "provision_scripts/initial_setup.sh"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = linux_vm_memory
        vb.cpus = linux_vm_cpus
      end
    end
  end
end
