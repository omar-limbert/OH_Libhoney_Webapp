# OpenStack Automation

## Requirements

- Open Stack Server
- Vagrant 1.7.4 or higher installed
    - Plugin: vagrant-docker-compose
    - Plugin: vagrant-openstack-provider
    - Plugin: vagrant-env

You could find information in following link:
- https://www.vagrantup.com/docs/installation

## After installation you could verify this with:

    $ vagrant -v
    
   or
    
    $ vagrant --version
    
You will obtains:

    Vagrant 2.1.2

## In order to run this Vagrantfile, you need install following plugins:

vagrant-docker-compose, Execute following command.

    $ vagrant plugin install vagrant-docker-compose

vagrant-env, Execute following command.

    $ vagrant plugin install vagrant-env, Execute following command.

vagrant-openstack-provider, Execute following command.

    $ vagrant plugin install vagrant-openstack-provider

## To verify if all plugins already installed:
    $ vagrant plugin list

You will obtains:

    vagrant-docker-compose (1.3.0)
    vagrant-env (0.0.3)
    vagrant-openstack-provider (0.12.0)
    
## Now you need clone the repository with following command:

    git clone https://github.com/devops-at06/OH.git

## Go to repository directory and find "vagrant" folder.
   Inside this folder you will find 2 files and 1 directory:
   
       .env (env file to set environment variables on vagrantfile)
       Vagrantfile (vagrantfile to config VM)
       docker (This folder contains docker-componse.yml sample to run Jenkins)
      
## Before to Run this Vagrantfile you need set .env file with your information.

    OS_AUTH_URL = must.be.set
    OS_IDENTITY_API_VERSION = must.be.set 
    OS_TENANT_NAME = must.be.set
    OS_PROJECT_NAME = must.be.set
    OS_USERNAME = must.be.set
    OS_PASSWORD = must.be.set
    OS_DOMAIN_NAME= must.be.set
    OS_FLAVOR= must.be.set
    OS_IMAGE= must.be.set
    OS_KEY_PAIR_NAME= must.be.set
    OS_KEY_PATH= must.be.set
    OS_VM_NAME= must.be.set
     
## In this file to display state of the machines Vagrant is managing.

    $ vagrant status

## Create and boot an OpenStack instance with this Vagrantfile.

    $ vangrant up

## After up, you can connect via ssh with following command:

    $ vagrant ssh
    
## Now you are ready to use your VM also you can use docker and docker-compose.




