## Openshift Origin as docker container on Fedora

### Prerequisites

If you were to follow this article please make sure to have the following prerequisites met before continuing.

> Important Note: Though this article has nothing that could adversely impact your platform, please **backup** any configuration file you plan on changing!

* Docker

  ```sh
  sudo dnf -y install docker docker-client docker-devel python-docker-py python3-docker-py
  ```

* Ansible

  ```sh
  sudo dnf -y install ansible
  ```
* Bind (_Optional_)

  ```sh
  sudo dnf


### Setup

There are two folders :

1. origin
2. named


#### Deploy and start Openshift Origin 

Change directory to **origin** and run the following command:

```sh
ansible-playbook -K origin.yml
```


