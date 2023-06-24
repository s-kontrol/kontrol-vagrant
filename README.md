## What is this repository?
This repository is intended to provide an easy testing environment in both Windows and Linux.

---
#### Requirements
---
- Vagrant 2.2.16 (https://developer.hashicorp.com/vagrant/downloads)
- VirtualBox 6.1.44 (https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

Note: 
- We want to use these packages in our system instead of the ones provided by pip to avoid any issue.
- Vagrant versions above 2.2.16 could introduce side effects. Feel free to try them though!
---
### How to use:
- Review the `Vagrant file` if you want to change settings.
- `vagrant up` to start the vms.
- `vagrant destroy` to destroy the vms.
- `vagrant status` to see the vms.


### Vagrantfile Settings
You can review the Vagrant file which contains information on how to do so.

By default, we create the following:
- `1 windows server 2019 vm. 2 vcpu 2048 ram. Default network bridge.`
- `1 linux server 2019 vm. 2 vcpu 2048 ram. Default network bridge.`

### Provision scripts.
- **These script ARE NOT INTENDED TO BE RUN IN A PRODUCTION ENVIRONMENT**
- The provision scripts are configured to enable quick `WinRM` / `ssh` access(optional) to your machines and open the necessary ports.

### SSH Key for linux VMs
It is recommended that you use vagrant ssh and provide your key.
You can do so by adding your public key to `provision_scripts/initial_setup.sh`
The key that vagrant uses should be under on the host: `.vagrant/boxname/private_key`
