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
sp                     := $(sp).x
dirstack_$(sp)         := $(d)
d                      := $(dir)
build_d_path           := $(subst $(SYSTEM),$(SYSTEM)/build,$(d))

SRCS_C_$(d)            := $(wildcard $(d)/*.c)
OBJS_C_$(d)            := $(patsubst $(d)/%.c,$(build_d_path)/%.o,$(SRCS_C_$(d)))

SRCS_S_$(d)            := $(wildcard $(d)/*.S)
OBJS_S_$(d)            := $(patsubst $(d)/%.S,$(build_d_path)/%.o,$(SRCS_S_$(d)))

SRCS_$(d)              := $(SRCS_S_$(d)) $(SRCS_C_$(d))
OBJS_$(d)              := $(OBJS_S_$(d)) $(OBJS_C_$(d))
DEPS_$(d)              := $(OBJS_$(d):%.o=%.d)

SRCS_TOTAL             += $(SRCS_$(d))
OBJS_TOTAL             += $(OBJS_$(d))
DEPS_TOTAL             += $(DEPS_$(d))