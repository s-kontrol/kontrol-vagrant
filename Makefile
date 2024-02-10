.PHONY: all fedora ubuntu vagrant-plugin

all: fedora vagrant-plugin

fedora:
	sudo dnf install vagrant -y
	vagrant plugin install winrm
	vagrant plugin install winrm-fs
	vagrant plugin install winrm-elevated
	sudo dnf install virt-install
	sudo dnf install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer
	sudo dnf install guestfs-tools python3-libguestfs virt-top

ubuntu:
	sudo apt-get update
	sudo apt-get install vagrant -y
	sudo apt-get install virtinst
	sudo apt-get install libvirt-daemon-system libvirt-clients qemu-kvm virt-manager virt-viewer
	sudo apt-get install libguestfs-tools python3-libguestfs virt-top

vagrant-plugin:
	vagrant plugin install winrm
	vagrant plugin install winrm-fs
	vagrant plugin install winrm-elevated
