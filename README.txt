## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/mweber-sys/ELK-Project/blob/main/diagrams/MW%20Cloud%20Diagram%20-%20ELK.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - elkproject.yml


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load balancers can protect a network against distributed denial-of-service (DDoS) attacks by shifting attack traffic to ensure one server is not overloaded. They also can protect a network because when deployed, only the public IP of the load balancer is exposed and not the other servers.
An advantage of using a single, public-facing jumpbox to connect to other virtual machines is that it creates a fan-in pattern that allows the administrator to secure and monitor the single node like a gateway router. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the machine metrics and system logs.
- Filebeat is used to monitor changes to files on the machine.
- Metricbeat is used to monitor the machine metrics such as CPU usage.

The configuration details of each machine may be found below.


| Name       | Function  | IP Address | Operating System |
|------------|-----------|------------|------------------|
| Jump Box   | Gateway   | 10.0.0.4   | Linux            |
| Web-1      | Webserver | 10.0.0.5   | Linux            |
| Web-2      | Webserver | 10.0.0.6   | Linux            |
| Web-3      | Webserver | 10.0.0.7   | Linux            |
| ELK Server | Monitor   | 10.1.0.5   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
- My machine's public IP address

Machines within the network can only be accessed by the jumpbox.
- My machine with public IP address can access the ELK VM via Port 5601

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses          |
|------------|---------------------|-------------------------------|
| JumpBox    | Yes                 | Personal IP Address           |
| Web-1      | No                  | 10.0.0.4                      |
| Web-2      | No                  | 10.0.0.4                      |
| Web-3      | No                  | 10.0.0.4                      |
| ELK Server | No                  | Personal IP Address, 10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because you can ensure that the configurations on each machine are identical. It also allows to easily add or replace machines with the same configurations. 

The playbook implements the following tasks:
- Installs docker.io
- Installs python-pip
- Installs docker
- Increases the virtual memory to accomodate for ELK
- Downloads and launches a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![] (C:\Users\maura\ELK-Project\Images\dockerps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeat collects information on file system, for example changes made to /etc/passwd/ file. Metricbeats collects informatino on the machine metrics such as uptime or CPU usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the projectelk.yml file to /etc/ansible directory on the ansible container.
- Update the host file to include the IP addresses of each group including the machines to monitor and the ELK server as a group. 
- Run the playbook, and navigate ELK server and then http://40.77.26.232:5601/app/kibana to check that the installation worked as expected.

Questions:
- Which file is the playbook? Where do you copy it? 
  - The playbook file is elkproject.yml and it is copied to ansible container. 
- Which file do you update to make Ansible run the playbook on a specific machine? 
  - The host file and ansible configurate files are updated. 
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? 
  - The host file contains groups identified with [brackets] then the playbook will specific which group it applies to.
- Which URL do you navigate to in order to check that the ELK server is running? 
  - http://[ELK_Server_Public_IP:5601/app/kibana

