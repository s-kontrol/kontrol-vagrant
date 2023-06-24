## What is this repository?
The objective of this repository is to deploy a X number of nodes of both Windows / Linux VMs for development use.

I have created this repository to the best of my abilities at the time, aiming to provide a helpful resource for others on their Vagrant learning journey. However, please note that it may not encompass the most advanced or comprehensive techniques. It is intended as a sincere effort to assist and support others in their exploration of Vagrant.

This does **NOT** meet any of the requirements of a production server in terms of configurations, security and or reliability. *Do not use for production.* *Do not use on a network you do not own.*

---
#### Requirements
---
- `Vagrant 2.2.16` (https://developer.hashicorp.com/vagrant/downloads)
- `VirtualBox 6.1.44` (https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

Note: *Vagrant versions above `2.2.16` havent been tested. Feel free to try them though!*

---
### How to use:
- Review the `Vagrant file` if you want to change settings.
- `vagrant up` to start the vms.
- `vagrant destroy` to destroy the vms.
- `vagrant status` to see the vms.
- You can also pass a box name to any of those commands to target a node.
  `vagrant up windows-node`
---
### Vagrantfile Settings
You can review the Vagrantfile which contains information on how to do so.

By default, we create the following:
- `1 windows server 2019 vm. 2 vcpu 2048 ram. Default network bridge. IP your.first.threeoctet.90`
- `1 linux server 2019 vm. 2 vcpu 2048 ram. Default network bridge. IP your.first.threeoctet.180`
---
### What are the hosts ip?
- If you didn't change anything, by default it would use a bridge connection so it'll have a local ip on the same range as your host.
- The last `octet` will be `90+nodenumber` for `windows`, `180+nodenumber` for `windows.`
- **Example:** Your `host` is connected to a `192.168.0.0/24` network. 
  Your VMs IPs would be `192.168.0.90+nodenumber`(windows) - `192.168.0.180+nodenumber`(linux). 
  **Node number starts at 0, *of course.***
- We recommend changing the last `octet` for an easy configuration. 
  *Advanced networking setup is out of scope of this repository.*
---
### Provision scripts.
- **These script ARE NOT INTENDED TO BE RUN IN A PRODUCTION ENVIRONMENT**
- The provision scripts are configured to enable quick `WinRM` / `ssh` access(optional) to your machines and open the necessary ports.
---
### SSH Key for linux VMs
It is recommended that you use vagrant ssh and provide your key.
You can do so by adding your public key to `provision_scripts/initial_setup.sh`
The key that vagrant uses should be under on the host: `.vagrant/boxname/private_key`
