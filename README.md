## What is this repository?
The purpose of this repository is to deploy a variable number of local Windows Virtual Machines for development use, using Vagrant and libvirt.

---
#### Requirements
- `Vagrant 2.4.3` (https://www.vagrantup.com/downloads)
- `libvirt` as the Vagrant provider (ensure it's installed on your system).
- `A bridged network interface`

---
### How to use:
- Review the `Vagrantfile` if you want to change settings.
- Run `vagrant up` to start the VMs.
- Run `vagrant destroy` to destroy the VMs.
- Run `vagrant status` to see the VMs.
- You can also pass a box name to any of those commands to target a node.
  `vagrant up windows-node-00`
- The default password for Windows is `vagrant`
---
### Vagrantfile Settings
Review the `Vagrantfile` for any desired changes.

By default, we create the following:
- `1 Windows Server 2019 VM. 4 vCPU 4096 RAM.`

---
### What are the hosts IP?
- If you didn't change anything, it uses a local IP.

---
### Provision scripts.
**These scripts ARE NOT INTENDED TO BE RUN IN A PRODUCTION ENVIRONMENT.**
The provision scripts enable quick `WinRM` access to your machines and open the necessary ports.

---
### SSH Key for Windows VMs
Check `provision_scripts/winrmsetup.ps1`. This will enable WinRM on the hosts.
