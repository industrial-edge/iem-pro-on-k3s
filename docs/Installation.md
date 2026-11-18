# K3s Installation

K3s - Lightweight Kubernetes. Easy to install, half the memory, all in a binary of less than 100 MB.

- [K3s Installation](#k3s-installation)
  - [Install Script](#install-script)
  - [Configure the kubeconfig](#configure-the-kubeconfig)
  - [Check the Status of K3s](#check-the-status-of-k3s)
- [Helm CLI Installation](#helm-cli-installation)
  - [Install Helm CLI](#install-helm-cli)

## Install Script

K3s provides an installation script that is a convenient way to install it as a service on systemd or openrc based systems. To install K3s you can easily follow the [Quick Start Guide](https://docs.k3s.io/quick-start).

While running this installation:

- The K3s service will be configured to automatically restart after node reboots or if the process crashes or is killed
- Additional utilities will be installed, including kubectl, crictl, ctr, k3s-killall.sh, and k3s-uninstall.sh
- A kubeconfig file will be written to /etc/rancher/k3s/k3s.yaml and the kubectl installed by K3s will automatically use it

For detailed information about the installation process and other installation options, please refer to the [official K3s website](https://docs.k3s.io/).

## Configure the kubeconfig

Adapt the permission of the global kubeconfig file and create a symbolic link to make it accessible for the current user. This will allow you to use kubectl without requiring root privileges:

```bash
mkdir ~/.kube/
ln -s /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config
```

## Check the Status of K3s

To check that the installation of the K3s service was successful and the Kubernetes cluster is running, execute the following command:

```bash
sudo kubectl get node
```

You should see a similar output:

```bash
NAME      STATUS   ROLES                  AGE    VERSION
siemens   Ready    control-plane,master   1h9m   v1.37.2+k3s1
```

# Helm CLI Installation

Helm is a package manager for Kubernetes that allows you to define, install, and upgrade even the most complex Kubernetes applications. Helm uses a packaging format called charts. A chart is a collection of files that describe a related set of Kubernetes resources.

## Install Helm CLI

To install Helm CLI, you can follow the [official installation guide](https://helm.sh/docs/intro/install).

There is also an official installation script that can be used:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
chmod 700 get_helm.sh
./get_helm.sh
```

Verify the installation by checking the Helm version:

```bash
helm version
```
