############################################################
# @filename: toolchain.mk
#
# This file is used to config toolchain relatived
# config, include CC, cflag, linker, asm etc.
###########################################################
CROSS_COMPILE             := aarch64-linux-gnu-
CC                        := $(CROSS_COMPILE)gcc
AS                        := $(CROSS_COMPILE)as
AR                        := $(CROSS_COMPILE)ar
LD                        := $(CROSS_COMPILE)ld
STRIP                     := $(CROSS_COMPILE)strip --strip-unneeded
OBJCOPY                   := $(CROSS_COMPILE)objcopy
OBJDUMP                   := $(CROSS_COMPILE)objdump

############################################################
CFLAGS                    := -g -Wall -nostdlib -nostdinc
AFLAGS                    := -g
LDFLAGS                   :=

FLAGS                     := -Wall -g -Werror -Os

LD_LIBRARY_PATH           := 

############################################################
export CROSS_COMPILE CC AS AR LD 
export ASMFLAGS LDFLAGS CFLAGS 