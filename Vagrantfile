BOX_COUNT = 1
CPU_PER_BOX = 2
MEMORY_PER_BOX = 4096
IMAGE = "basebox_k3d_focal"

Vagrant.configure("2") do |config|
  config.vm.define "k3d-desk" do |desk|
    desk.vm.box = "chenhan/ubuntu-desktop-20.04"
    desk.vm.provider :virtualbox do |v|
      v.linked_clone = true
      v.memory = MEMORY_PER_BOX
      v.cpus = CPU_PER_BOX
    end
    desk.vm.hostname = "k3d-desk"
    desk.vm.network  :private_network, ip: "10.0.0.#{BOX_COUNT+20}"
  end
  (1..BOX_COUNT).each do |i|
    config.vm.define "k3d#{i}" do |k3ds|
      k3ds.vm.box = IMAGE
      k3ds.vm.provider :virtualbox do |v|
        v.linked_clone = true
        v.memory = MEMORY_PER_BOX
        v.cpus = CPU_PER_BOX
      end
      k3ds.vm.hostname = "k3d#{i}"

      #### Enable the folowing, if you want to shell into the box from another machine
      #### In thise case, add your public key to /home/vagrant/.ssh/authorized_keys by enabling the command abit further below
      #k3ds.vm.network "forwarded_port", guest: 22, host: 12222, protocol: "tcp"

      k3ds.vm.network  :private_network, ip: "10.0.0.#{i+10}"

      k3ds.vm.provision "shell", inline: <<-SHELL
        # Add current node in  /etc/hosts
        echo "127.0.1.1 $(hostname)" >> /etc/hosts

        k3d cluster create cluster1 --servers 3 --agents 1
        k3d node create cluster1-agent-1 --cluster cluster1 --role agent --replicas 3

        # Put the kube config in place, so kubectl can work without params
        mkdir -p /home/vagrant/.kube && \
		    k3d kubeconfig get cluster1 > /home/vagrant/.kube/config && \
		    chown -R vagrant:vagrant /home/vagrant/.kube && \
        chmod 600 /home/vagrant/.kube/config

        # Bash Completion for kubectl - very handy
        kubectl completion bash >/etc/bash_completion.d/kubectl

        # Install OLM
        kubectl apply -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.17.0/crds.yaml
        kubectl apply -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.17.0/olm.yaml

        # Install HELM
        curl -O https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
        bash ./get-helm-3 
        # Lets get version
        helm version 

        # Tekton CLI Install 
        curl -LO https://github.com/tektoncd/cli/releases/download/v0.29.0/tektoncd-cli-0.29.0_Linux-64bit.deb
        sudo dpkg -i tektoncd-cli-0.29.0_Linux-64bit.deb

        # Install Tekton Pipelines
        kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

        # Install Tekton Triggers
        kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
        kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

        # Install Cosign
        curl -LO  https://github.com/sigstore/cosign/releases/download/v1.13.1/cosign_1.13.1_amd64.deb
        sudo dpkg -i cosign_1.13.1_amd64.deb
        
        ### if you want to have connectivity over native ssh
	#echo "<YOUR_PUBLIC_KEY_HERE>" >> /home/vagrant/.ssh/authorized_keys

        echo "Provision done"
        echo ""
        echo Installed toolS:
        helm version
        tkn version
        echo ""
        cosign version
        echo ""
        echo "Cluster ready"
        k3d node list
      SHELL
    end
  end
end