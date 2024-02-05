SYSTEM					:= $(shell pwd)

ifndef SYSTEM_BUILD
include $(SYSTEM)/mak/config.mk
endif

include $(SYSTEM)/mak/build.mk

ifndef LINKER
LINKER					:= $(SYSTEM)/linker.ld
endif

ifndef LOGFILE
LOGFILE					:= $(SYSTEM)/log.Makefile
endif
# Recursive start
include $(SYSTEM)/mak/rstart.mk
dir						:= $(SYSTEM)/$(d)/init
include $(dir)/make.mk

dir						:= $(SYSTEM)/$(d)/arch
include $(dir)/make.mk

dir						:= $(SYSTEM)/$(d)/driver
include $(dir)/make.mk
include $(SYSTEM)/mak/rend.mk
# Recursive complete

all: $(TARGET).bin
$(SYSTEM_BUILD)/%.o: $(SYSTEM)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(FLAGS) -MMD -c $< -o $@ >> $(LOGFILE) 2>&1

$(SYSTEM_BUILD)/%.o: $(SYSTEM)/%.S
	@mkdir -p $(dir $@)
	$(CC) $(AFLAGS) $(FLAGS) -MMD -c $< -o $@ >> $(LOGFILE) 2>&1

$(TARGET).bin: $(LINKER) $(OBJS_TOTAL)
	$(LD) -T $(LINKER) $(LDFLAGS) -o $(SYSTEM_BUILD)/$(TARGET).elf $(OBJS_TOTAL) -e _start >> $(LOGFILE) 2>&1
	$(OBJCOPY) $(SYSTEM_BUILD)/$(TARGET).elf -O binary $(SYSTEM)/$(TARGET).bin >> $(LOGFILE) 2>&1
	@echo 
	@echo ^v^ Compile Complete ^v^
	@echo

clean:
	$(RM) -rf $(TARGET).bin $(SYSTEM_BUILD) $(LOGFILE)

check:
	$(QEMU) $(QFLAGS) -kernel $(SYSTEM)/$(TARGET).bin

debug:
	$(QEMU) $(QFLAGS) -kernel $(SYSTEM_BUILD)/$(TARGET).elf -S -s

.PHONY: all clean check debug
