## What is this repository?
The purpose of this repository is to deploy a variable number of local Windows Virtual Machines for development use, using Vagrant and libvirt.

---
#### Requirements
- `Vagrant 2.4.3` (https://www.vagrantup.com/downloads)
- `libvirt` as the Vagrant provider (ensure it's installed on your system).
- `A bridged network interface`

# Project Setup

This repository provides a set of Makefile targets to simplify the setup of your development environment on Fedora and Ubuntu for Vagrant. The targets include:

- **fedora**: Installs Vagrant and required plugins, along with additional dependencies for Fedora.
- **ubuntu**: Installs Vagrant and required plugins, along with additional dependencies for Ubuntu.
- **vagrant-plugin**: Installs necessary Vagrant plugins.

## Usage

```bash
make all  # Installs Vagrant and plugins on for Fedora
make fedora  # Installs Vagrant and plugins on Fedora
make ubuntu  # Installs Vagrant and plugins on Ubuntu
make vagrant-plugin  # Installs Vagrant plugins
```
Ensure you have the necessary permissions when executing these commands. Customize the Makefile as needed for your specific requirements.

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


