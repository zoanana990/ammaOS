############################################################
# @filename: rend.mk
#
# This file is recursive end Makefile
# 
# Actually, you can ignore this file
############################################################
d					:= $(dirstack_$(sp))
sp					:= $(basename $(sp))
