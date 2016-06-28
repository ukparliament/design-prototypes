# PDS Prototype Kit

## Installation

Install Docker for Mac from here - https://docs.docker.com/docker-for-mac/

Install Docker for Windows from here - https://docs.docker.com/docker-for-windows/

## Setup

Edit your host file and add the following line

```bash
$ sudo nano /etc/hosts
$ *.docker.localhost localhost
```

Execute the following commands:

```bash
$ make build
$ make run
```

Now browse to http://design-prototypes.docker.localhost

### Destroy
```bash
$ make destroy
```