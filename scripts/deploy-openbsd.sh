#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

# https://app.vagrantup.com/generic/boxes/openbsd6
vagrant box add "generic/openbsd6" --provider=libvirt
vagrant init --template Vagrantfile.provision.bash.openbsd.erb
vagrant up --provider=libvirt "vg-openbsd-02"
# vagrant ssh vgnode04 -c "hostnamectl"

vagrant box list #veridy installed boxes
vagrant status #Check the status of the VMs to see that none of them have been created yet
virsh list --all #show all running KVM/libvirt VMs
# vagrant destroy -f "vg-compute-05"


echo "========================================================================================="
