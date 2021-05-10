# RADAR-in-a-Box

Virtual machine containing Radar-Base stack ready to run. It uses Hashicorp Packer to build the Virtual machine Image and Hashicorp Vagrant to set up the build environment and virtual machine.

## Deployment
| AWS Region Code | Name | Launch |
| --- | --- | ---
| eu-central-1 | Germany (Frankfurt)| [![cloudformation-launch-stack](images/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=eu-central-1#/stacks/new?stackName=Radar-in-a-box&templateURL=https://s3.amazonaws.com/radar-base/radar-in-a-box/RadarInABox-Frankfurt.yaml) |

Follow the wizard and enter the domain name and other variables, in the end there should be an EC2 instance with Radar-base installed on it.
For connecting to the server use SSH user `ubuntu` and the EC2 KeyPair specified during installation step.
Installation repository is on `/opt/Radar-Kubernetes` and you can follow documentation on (Radar-Kubernetes)[https://github.com/RADAR-base/RADAR-Kubernetes] to work with this the application stack.  `kubectl`, `helm` and `helmfile` are also installed on the server.
Finally you will need to point a DNS domain name to the EC2 IP address in order to access the Management Portal and other web portals.

## Development

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
