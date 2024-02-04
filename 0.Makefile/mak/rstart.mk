############################################################
# @filename: rstart.mk
#
# This file is recursive start Makefile
# 
# Each folder will include this makefile and create their
# own source, objecets, dependencies etc.
# and the total of source, object, dependency will reassigned
# the new one by appending way
############################################################
sp					:= $(sp).x
dirstack_$(sp)		:= $(d)
d 					:= $(dir)

SRCS_C_$(d) 		:= $(wildcard $(d)/*.c)
OBJS_C_$(d)			:= $(patsubst $(d)/%.c,$(SYSTEM_BUILD)/%.o,$(SRCS_C_$(d)))

SRCS_S_$(d)			:= $(wildcard $(d)/*.S)
OBJS_S_$(d)			:= $(patsubst $(d)/%.S,$(SYSTEM_BUILD)/%.o,$(SRCS_S_$(d)))

SRCS_$(d)			:= $(SRCS_S_$(d)) $(SRCS_C_$(d))
OBJS_$(d)			:= $(OBJS_S_$(d)) $(OBJS_C_$(d))
DEPS_$(d) 			:= $(OBJS_$(d):%.o=%.d)

SRCS_TOTAL			:= $(SRCS_TOTAL) $(SRCS_$(d))
OBJS_TOTAL			:= $(OBJS_TOTAL) $(OBJS_$(d))
DEPS_TOTAL			:= $(DEPS_TOTAL) $(DEPS_$(d))