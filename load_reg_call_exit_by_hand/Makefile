

CC := arm-none-eabi-gcc
CFLAGS += -O0 -mthumb -nostdlib -nostartfiles -nodefaultlibs
CFLAGS_ADDS += -g

OUT_DIR := out

all: $(OUT_DIR)/main.s $(OUT_DIR)/main.o

$(OUT_DIR):
	mkdir -p $(OUT_DIR)
$(OUT_DIR)/%.s: %.c Makefile | $(OUT_DIR)
	$(CC) $(CFLAGS) -S -o $@ $<
	sed -i '/^\s*\(\.eabi_attribute.*\|\@ .*\|.section.*\|.align.*\|.p2align.*\)$$/d' $@

$(OUT_DIR)/%.o: %.c Makefile | $(OUT_DIR)
	$(CC) $(CFLAGS) -o $@ $<


