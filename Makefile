.PHONY: all fedora ubuntu vagrant-plugin

all: fedora vagrant-plugin

fedora:
	sudo dnf install vagrant -y
	sudo dnf install virt-install -y
	sudo dnf install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer -y
	sudo dnf install guestfs-tools python3-libguestfs virt-top -y

ubuntu:
	sudo apt-get update -y
	sudo apt-get install vagrant -y
	sudo apt-get install virtinst -y
	sudo apt-get install libvirt-daemon-system libvirt-clients qemu-kvm virt-manager virt-viewer -y
	sudo apt-get install libguestfs-tools python3-libguestfs virt-top -y

vagrant-plugin:
	vagrant plugin install winrm
	vagrant plugin install winrm-fs
	vagrant plugin install winrm-elevated
