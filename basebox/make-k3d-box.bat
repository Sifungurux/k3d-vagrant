	vagrant up
	vagrant halt
	vagrant package --output basebox_k3d_focal.box
	vagrant box remove basebox_k3d_focal -f
	vagrant box add basebox_k3d_focal basebox_k3d_focal.box
	DEL basebox_k3d_focal.box
	vagrant destroy	-f