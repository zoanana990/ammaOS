############################################################
# @filename: inc_path.mk
#
# This file is used to record include path Makefile
############################################################
SYSTEM					:= $(shell pwd)
INC						+= -I$(SYSTEM)/include
INC						+= -I$(SYSTEM)/include/mm
INC						+= -I$(SYSTEM)/include/arch/arm

export INC