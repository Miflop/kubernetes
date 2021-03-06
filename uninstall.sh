#!/bin/bash
#!/bin/bash
kubeadm reset -f
rm -rf /etc/cni /etc/kubernetes /var/lib/dockershim /var/lib/etcd /var/lib/kubelet /var/run/kubernetes /home/$USER/.kube/* #~/.kube/*
iptables -F && iptables -X
iptables -t nat -F && iptables -t nat -X
iptables -t raw -F && iptables -t raw -X
iptables -t mangle -F && iptables -t mangle -X
sudo systemctl daemon-reload
# remove all running docker containers
docker rm -f `docker ps -a | grep "k8s_" | awk '{print $1}'`
sudo systemctl restart docker
