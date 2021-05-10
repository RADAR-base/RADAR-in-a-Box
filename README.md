# RADAR-in-a-Box

Virtual machine containing Radar-Base stack ready to run. It uses Hashicorp Packer to build the Virtual machine Image and Hashicorp Vagrant to set up the build environment and virtual machine.

## Requirements

System with `vagrant`, `packer`, `ansible` and VirtualBox installed.

# Usage
First create a file named `variables.pkrvars.hcl` and put AWS credentials in this format:
```
aws_access_key = "XXXX"
aws_secret_key = "XXXX"
```

Then build the image with

```
packer build -var-file="variables.pkrvars.hcl" packer/aws.pkr.hcl
```

If you add `-debug` flag packer will ask a prompt for every step and leaves an SSH private key so you could SSH into the packer machine and inspect the build.
