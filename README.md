# PDS Prototype Kit

## Installation

Install Docker for Mac from here - https://docs.docker.com/docker-for-mac/

Install Docker for Windows from here - https://docs.docker.com/docker-for-windows/

## Setup

1. Execute your host file using:

```bash
$ sudo nano /etc/hosts
```

2. Add the following line:

```bash
$ *.docker.localhost localhost
```

3. Execute the following command:

```bash
$ make build
```

4. Execute the following command:

```bash
$ make run
```

Now browse to http://design-prototypes.docker.localhost

### Destroy
```bash
$ make destroy
```