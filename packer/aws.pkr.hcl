
# could not parse template for following block: "template: hcl2_upgrade:4: function \"clean_ami_name\" not defined"
variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "aws_region" {
  type = string
  default = "eu-central-1"
}

source "amazon-ebs" "create_image" {
  access_key    = var.aws_access_key
  ami_name      = "Radar-in-a-box {{ timestamp }}"
  instance_type = "t3a.2xlarge"
  launch_block_device_mappings {
    delete_on_termination = true
    device_name           = "/dev/sda1"
    volume_size           = 100
    volume_type           = "gp2"
  }
  region       = var.aws_region
  secret_key   = var.aws_secret_key
  source_ami   = "ami-0767046d1677be5a0"
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.create_image"]

  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_STDOUT_CALLBACK=yaml"]
    extra_arguments  = ["-v"]
    playbook_file    = "./ansible/playbook.yml"
  }

}
