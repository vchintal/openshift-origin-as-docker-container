# Openshift Origin as docker container on Fedora

## Prerequisites

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
    sudo dnf -y install bind bind-utils
  ```

## Setup

There are two folders :

1. origin
2. named


### Deploy and start Openshift Origin 

Change directory to **origin** and run the following command:

```sh
ansible-playbook -K origin.yml
```

### Configure and start named service

Understand what **named.conf** is and has before proceeding further. You can customize it however you want.  The idea here is to resolve `*.cluster.local` to `127.0.0.1` as that is where the Openshift Origin's HAProxy router is bound to and will process the necessary forwarding to the right POD.

> Pay extra attention to the forwarding DNS ip address in **named.conf**. Here is where you will place all the regular/usual DNS servers thru who all the other name resolutions would be done outside of Openshift stuff.

Change directory to named and do the following:

1. Copy **cluster.local** as `/var/named/cluster.local`. You might need `sudo` rights for this.
2. Backup `/etc/named.conf` as `/etc/named.conf.orig` and copy **named.conf** file into `/etc` folder
3. Run the command `sudo systemctl start named`. Optionally you can enable service by running `sudo systemctl enable named` 
4. Now ensure that the `/etc/resolv.conf` has just one line: `nameserver 127.0.0.1`

Now all the routes should be resolved and their links are now clickable in Openshift console.
