# Project 0, Makefile
In this file, i will record my development process, the issue i met, and the solution i use.

## Issue
This repo is used to check the recursive make is worked. There are several issue we need to solve:
1. We need to use `+=` instead of `:=` when we are recursing
2. We need to compile error for duplicated filename, in this case, we need to make a same architecture folder in `build` so that we can avoid the compile error, like this:
```Makefile=
CROSS_COMPILE := aarch64-linux-gnu-
CC := $(CROSS_COMPILE)gcc
AS := $(CROSS_COMPILE)as
LD := $(CROSS_COMPILE)ld

CFLAGS := -g -Wall -nostdlib -nostdinc
SRC_DIRS := arch driver init
BUILD_DIR := build

OBJS := $(foreach dir,$(SRC_DIRS),$(patsubst $(dir)/%.c,$(BUILD_DIR)/$(dir)/%.o,$(wildcard $(dir)/*.c))) \
        $(foreach dir,$(SRC_DIRS),$(patsubst $(dir)/%.S,$(BUILD_DIR)/$(dir)/%.o,$(wildcard $(dir)/*.S)))

include $(shell pwd)/mak/inc.mk

all: $(OBJS)

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(BUILD_DIR)/%.o: %.S
	@mkdir -p $(dir $@)
	$(CC) $(INC) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
```
## Solution