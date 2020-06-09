# template-windows-10-prod

Not much to say here. Refer to the README.md for template-centos-7-prod. Same things apply here,
except that you shouldn't need to run this on your own machine, just in Jenkins.

The only real difference is that there is no inventory.py file. I honestly don't remember why that is,
except that there was a reason it wouldn't work. ~shrug~ It's been about 2 years since I set 
this up. Sorry. You need to modify the hosts file so it has the appropriate IP that matches
what you put in main.tf for Terraform.

For information about PTA and how to use it please visit https://github.com/Forcepoint/fp-pta-overview/blob/master/README.md