.PHONY: all fedora ubuntu vagrant-plugin

all: fedora vagrant-plugin

fedora:
	sudo dnf install vagrant -y
	sudo dnf install virt-install -y
	sudo dnf install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer -y
	sudo dnf install guestfs-tools python3-libguestfs virt-top -y

ubuntu:
	sudo apt-get update
	sudo apt-get install vagrant virtinst libvirt-daemon-system libvirt-clients qemu-kvm virt-manager virt-viewer libguestfs-tools virt-top -y

vagrant-plugin:
	vagrant plugin install winrm
	vagrant plugin install winrm-fs
	vagrant plugin install winrm-elevated
