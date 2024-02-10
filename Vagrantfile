
#############################################################################################################
# VM CONFIGURATION - WINDOWS
#############################################################################################################

# Define image and number of nodes for windows
windows_image = "jborean93/WindowsServer2019"

# Node count
windows_node_count = 2

# VM specs
windows_vm_memory = 4096
windows_vm_cpus = 4

# Vm hostname. It expects a string. It will be appended automatically to the node count later. example: node-01, node-02, etc.
# Only accepts characters, numbers and dashes. No spaces or special characters or underscores.
windows_vm_hostname = "windows-node"

#############################################################################################################
# NETWORK CONFIGURATION
#############################################################################################################

# attach to the default network interface. Can be changed to a specific interface. it expects a string with the interface name. ie "eth0".
default_network_interface=`ip route | awk '/^default/ {printf "%s", $5; exit 0}'`

# get the ip address of the default network interface. It expects a string with the ip address such as 192.168.0 or 10.0.0 or 172.16.0, etc.
default_ip_address=`ip route | grep "$default_network_interface" | head -n 1 | awk '{printf "%s", $3}' | sed 's/\.[^\.]*$//'`

#############################################################################################################
# VAGRANT CONFIGURATION STARTS HERE. CHANGE AT YOUR OWN RISK.
#############################################################################################################

Vagrant.configure("2") do |config|
  # Use a loop to create multiple VMs with the same configuration
  (0..windows_node_count-1).each do |i|
    config.vm.define "#{windows_vm_hostname}-#{i.to_s.rjust(2, "0")}" do |node|
      node.vm.box = windows_image
      node.vm.hostname = "#{windows_vm_hostname}-#{i.to_s.rjust(2, "0")}"
      node.vm.network :public_network,
      :dev => "#{default_network_interface}",
      :mode => "bridge",
      :type => "bridge"
      # Adjust the libvirt provider configuration for memory and CPUs
      node.vm.provider "libvirt" do |libvirt|
        libvirt.memory = windows_vm_memory
        libvirt.cpus = windows_vm_cpus
        libvirt.storage :file, :size => '10G', :device => 'sdb'
      end
      node.vm.provision "shell", path: "provision_scripts/winrmsetup.ps1"
      node.vm.provision "shell", path: "provision_scripts/initial-setup.ps1"
    end
  end
end
