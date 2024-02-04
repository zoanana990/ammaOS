# ammaOS

In this repo, we will use arm 64 architecture with [BCM2711](https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf) chip, we will use `qemu` to emulate the rasberrypi 3b

We will step by step to implement this.

## Environment Setup
Please use Linux Ubuntu or debian like system. 

```shell=
sudo apt-get install qemu-system-arm libncurses5-dev gcc-aarch64-linux-gnu build-essential git bison flex libssl-dev
```

## Compile the project
```shell
make clean all
make check
```

## Debug
In this repo, there is no `aarch64-linux-gnu-gdb` in my macbook. Therefore, I use `gdb-multiarch` here
```shell
sudo apt install gdb-multiarch
```

When you are debuging, please open two terminals

one enter `make debug` and the other enter `gdb-multiarch --tui build/ammaOS.elf`

## projects
This repo is used to implement an operating system step by step and with multi-subprojects, you can see all steps when you clone this, and the idea is refer to [mini-arm-os](https://github.com/jserv/mini-arm-os) which is friendly to some people interesting in operating system.

There are several topics in this projects:

0. Makefile: this project shows how to bring up an ARM64 machine
1. asm: this project shows some basic assembly in ARM64


