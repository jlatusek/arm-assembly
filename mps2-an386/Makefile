
ARMGNU = arm-none-eabi

AOPS = --warn --fatal-warnings -mcpu=cortex-m0 -mthumb
COPS = -Wall -Werror -O0 -nostdlib -nostartfiles -ffreestanding  -mcpu=cortex-m0 -g -mthumb
OUT_DIR := $(shell pwd)/out

all : $(OUT_DIR)/notmain.bin

clean:
	clean:
	@read -p "Are you sure you want to clean the build output? [y/N] " ans; \
	if [ "$$ans" = "y" ] || [ "$$ans" = "Y" ]; then \
		echo "Cleaning..."; \
		rm -rf $(OUT_DIR); \
	else \
		echo "Aborted."; \
	fi

$(OUT_DIR):
	mkdir -p $@

$(OUT_DIR)/vectors.o : vectors.s | $(OUT_DIR)
	$(ARMGNU)-as $(AOPS) $< -o $@

$(OUT_DIR)/notmain.o : notmain.c | $(OUT_DIR)
	$(ARMGNU)-gcc $(COPS) -mthumb -c notmain.c -o $@

$(OUT_DIR)/notmain.bin : linker.ld $(OUT_DIR)/vectors.o $(OUT_DIR)/notmain.o | $(OUT_DIR)
	$(ARMGNU)-ld -o $(OUT_DIR)/notmain.elf -T $^
	$(ARMGNU)-objdump -D $(OUT_DIR)/notmain.elf > $(OUT_DIR)/notmain.list
	$(ARMGNU)-objcopy $(OUT_DIR)/notmain.elf $(OUT_DIR)/notmain.bin -O binary

run:
	qemu-system-arm -M mps2-an386 -m 16M -nographic -kernel $(OUT_DIR)/notmain.bin

run-debug:
	qemu-system-arm -M mps2-an386 -m 16M -nographic -S -gdb tcp::3333 -kernel $(OUT_DIR)/notmain.bin

device-tree-dump:
	qemu-system-arm -machine mps2-an386,dumpdtb=virt.dtb 


debug:
	arm-none-eabi-gdb $(OUT_DIR)/notmain.elf \
		-ex "target remote :3333"
