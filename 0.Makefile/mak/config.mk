############################################################
# @filename: config.mk
#
# This file is used to project configure, include
# qemu emulator board etc.
############################################################
SYSTEM                  := $(shell pwd)
SYSTEM_MAK              := $(SYSTEM)/mak
SYSTEM_BUILD            := $(SYSTEM)/build

TARGET                  := ammaOS

############################################################
# include                 $(SYSTEM)/toolchain.mk
include                 $(SYSTEM_MAK)/toolchain.mk

############################################################
BOARD                   := raspi3b
QEMU                    := qemu-system-aarch64

QFLAGS                  := -machine raspi3b -nographic
DFLAGS                  :=

SRCS_TOTAL              :=
OBJS_TOTAL              :=
DEPS_TOTAL              :=
############################################################
export SYSTEM_BUILD TARGET 
export QFLAGS BOARD DFLAGS