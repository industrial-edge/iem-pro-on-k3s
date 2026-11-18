# Industrial Edge Management on K3s

Industrial Edge Management System can be installed on any compliant Kubernetes (K8s) cluster.  
This documentation describes the complete installation process of IEM Pro V2 on the K3s distribution.

- [Industrial Edge Management on K3s](#industrial-edge-management-on-k3s)
  - [Description](#description)
    - [Overview](#overview)
    - [General Task](#general-task)
  - [Requirements](#requirements)
    - [Prerequisites](#prerequisites)
    - [Network Requirements](#network-requirements)
    - [Used components](#used-components)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Documentation](#documentation)
  - [Contribution](#contribution)
  - [License and Legal Information](#license-and-legal-information)

## Description

### Overview

Industrial Edge Management deployed in K3s cluster.

### General Task

The objective of this tutorial is to provide a comprehensive walkthrough for users on the setup process of IEM Pro V2 on a Kubernetes cluster. To achieve this, a new Kubernetes cluster will be established utilizing the K3s framework, and subsequently, the IEM service will be deployed within it. By the conclusion of this tutorial, users will have successfully created and onboarded a new IEM instance, which will be fully prepared for utilization within the Industrial Edge Ecosystem.

![General architecture overview](docs/graphics/architecture-overview.png)
*General architecture overview*

## Requirements

### Prerequisites

- Industrial Edge Hub (IEH) Access
- Powerful host PC or server with Internet access  
  For this guide, we recommend a minimum of:
  - 8 (v)CPU cores
  - 16 GB of RAM
  - 150 GB of Disk Space
- Linux-based operating system

### Network Requirements

To ensure the successful onboarding of a new Industrial Edge Management (IEM) instance, it is imperative that the host machine possess an active internet connection and the capability to access IE Hub domains. If your host machine operates within a proxy or firewall environment, it is essential to ensure that all necessary domains are appropriately whitelisted. Please refer to the "[Industrial Edge - Security Overview](https://docs.industrial-operations-x.siemens.cloud/r/en-us/v26.09/industrial-edge-platform-operation-setup-operate-utilize/security)" document for further guidance.

### Used components

- K3s - Kubernetes distribution - v1.37.2+k3s1
- Helm CLI - Kubernetes package manager - v4.3.1
- IEM - Industrial Edge Management Pro V2 - v2.3.2

## Installation

To deploy Industrial Edge Management on a K3s cluster, you must perform the following tasks:

- [Install the K3s Cluster and Helm CLI](docs/Installation.md)
- [Create an IEM instance in the Industrial Edge Hub (IEH)](docs/Deployment.md#create-an-iem-instance-in-the-industrial-edge-hub)
- [Install the IEM on the K3s Cluster](docs/Deployment.md#install-the-iem-on-the-k3s-cluster)

## Usage

After successfully following all the installation steps, you will have a fully operational instance of IEM (Industrial Edge Management) deployed within a local Kubernetes (K3s) cluster. This instance is now ready to be utilized within the Industrial Edge Ecosystem. For comprehensive guidance on operating the IEM instance, please consult the official Industrial Edge Documentation - [Industrial Edge Management - Operation](https://docs.industrial-operations-x.siemens.cloud/r/en-us/v26.09/industrial-edge-platform-operation-setup-operate-utilize/industrial-edge-management/setup-and-operate/iem-pro-v2/operation).

## Documentation

You can find further documentation and help at the following links:

- [Industrial Edge Official Documentation](https://docs.industrial-operations-x.siemens.cloud/p/industrial-edge)
- [Industrial Edge Hub](https://iehub.eu1.edge.siemens.cloud/#/documentation)
- [Industrial Edge Mendix Forum](https://forum.mendix.com/link/space/industrial-edge)
- [Industrial Edge Forum](https://www.siemens.com/industrial-edge-forum)
- [Industrial Edge Landing page](https://www.siemens.com/en-us/products/industrial-edge/)
- [Industrial Edge GitHub page](https://github.com/industrial-edge)

## Contribution

Thank you for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section.
Additionally everybody is free to propose any changes to this repository using Pull Requests.

If you haven't previously signed the [Siemens Contributor License Agreement](https://cla-assistant.io/industrial-edge/) (CLA), the system will automatically prompt you to do so when you submit your Pull Request. This can be conveniently done through the CLA Assistant's online platform. Once the CLA is signed, your Pull Request will automatically be cleared and made ready for merging if all other test stages succeed.

## License and Legal Information

Please read the [Legal information](LICENSE.txt).
