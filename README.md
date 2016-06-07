# PDS Prototype Kit

## Installation

To install Docker visit https://docs.docker.com/mac/step_one/

If you haven't already created a boot2docker VM then run 

```bash
$ docker-machine create --driver virtualbox default
```

## Usage

```bash
$ make run
```

Now browse to the URL provided from the "make run" command above.

### Destroy
```bash
$ make destroy
```