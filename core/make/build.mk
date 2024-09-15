############################################################
# @filename: build.mk
#
# This file is used to config Makefile and include path 
# related parameters
############################################################
SYSTEM                    := $(shell pwd)
SYSTEM_MAK                := $(SYSTEM)/make

############################################################
MK_OPTIONS                :=
MAKE_FLAGS                :=

############################################################
include $(SYSTEM)/make/inc.mk

FLAGS                     += $(INC)