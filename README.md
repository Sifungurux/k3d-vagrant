# k3d-vagrant
Run k3d in Vagrant for experimentation


## What is Vagrant
Vagrant is a tool for VM usage automation. It uses different VM backends to do its job. Typically used with VirtualBox(r) backend.

## Why K3d
K3d is a nice tool to run k3s (a distribution of K8s that is user friendly) in Docker Containers.

## Why K3d in Vagrant
Clearly the idea is to be able to automate the quick creation and disposal of a K3d clusters without tainting your host operating system. Indeed, spinning up a cluster in the host will be much quicker but OTOH you can scrap the whole project by just calling `vagrant destroy -f` and then recreate with `vagrant up`.
When cluster is running there is a lot of commands that can show and change the status of the cluster
See [k3d](https://k3d.io/v5.3.0/usage/commands/k3d/)

## How to use?
1. Change into `basebox/` directory and run `make-k3d-box.bat`. This will build the basebox. The idea behind the basebox is to set up all dependecies (Docker, K3s, k3d, container images, and other package) so you don't need to download them every time you spin off a child box. Very similar to the way base container images are used. You need to run this only once. You can re-run the command without creating problems. Once a week the basebox (Ubuntu 20.04 vagrant box) is updated so if you rebuild your basebox image you will get the updates. Update whenever you feel ok. This project is for experimentation purposes.
2. Edit Vagrantfile to adjust the CPU and RAM settings of your child box.
3. After successful basebox build, go one directory up and run `vagrant up`. A child box will be spinned up. It will take some time, depending on how fast your machine is. In the Vagrantfile a k3d cluster with name `cluster1` consisting of 3 master(control plane) nodes and 3 worker nodes is started.
4. To shell into the box, once ready, use vagrant ssh
5. If you want to ssh from outside but not by using vagrant, then you need to have a Public/Private Key pair (existing or generate one with `ssh-keygen -f ./.ssh/id_rsa`). Then uncomment two lines in Vagrantfile to enable port forwarding (in the example port 12222 on the host is opened) as well as addition of the public key to `/home/vagrant/.ssh/authorized_keys`. If the box is running then destroy it (`vagrant destroy -f`) and create it a new (`vagrant up`).

## Misc
1. [Operator Lifecycle Manager](https://github.com/operator-framework/operator-lifecycle-manager) is already preinstalled, so you can install operators pretty quickly
