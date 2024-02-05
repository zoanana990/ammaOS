############################################################
# @filename: build.mk
#
# This file is used to config Makefile and include path 
# related parameters
############################################################
SYSTEM                    := $(shell pwd)
SYSTEM_MAK                := $(SYSTEM)/mak

############################################################
MK_OPTIONS                :=
MAKE_FLAGS                :=

############################################################
include $(SYSTEM)/mak/inc.mk

FLAGS                     += $(INC)