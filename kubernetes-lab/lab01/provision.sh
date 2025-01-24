#!/usr/bin/env bash
echo "Atualizando Ubuntu e pacotes..."
sudo apt-get update | sudo apt-get upgrade | sudo apt install net-tools
echo "Instalando o Kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
echo "Criando alias k para o kubectl"
alias k=kubectl
complete -F __start_kubectl k
cat >> /etc/hosts << EOT
192.168.1.101 lab01
192.168.1.102 lab02
192.168.1.103 lab03
EOT
echo "Alterando o nome do hostname"
sudo hostname lab01