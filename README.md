# RADAR-in-a-Box

Virtual machine containing Radar-Base stack ready to run. It uses Hashicorp Packer to build the Virtual machine Image and Hashicorp Vagrant to set up the build environment and virtual machine.

## Requirements

System with `vagrant`, `packer` and VirtualBox installed.

# Usage

Set up a RADAR-Kubernetes environemnt first
```
git clone --branch dev https://github.com/RADAR-base/RADAR-Kubernetes.git ansible/files/RADAR-Kubernetes
```

Then build the image with

```
packer build image.json
```
