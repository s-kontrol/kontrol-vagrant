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
### What does the provision_scripts do?
- **These script ARE NOT INTENDED TO BE RUN IN A PRODUCTION ENVIRONMENT**
- The provision scripts are configured to enable quick `WinRM` / `ssh` access(optional) to your machines and open the necessary ports.

### How do I get the linux ssh key for the host?
It is recommended that you use vagrant ssh and provide your key. There's that you can use.
The key that vagrant uses should be under:
- `.vagrant/boxname/private_key`

