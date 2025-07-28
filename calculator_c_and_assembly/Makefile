.PHONY: all run debug

CC := arm-unknown-linux-gnueabi-cc
CFLAGS += -O0 -znoexecstack -g -mthumb -mcpu=cortex-a7
ASMFLAGS := 

OUT_DIR := out

all: $(OUT_DIR)/main.elf $(OUT_DIR)/parser_test.elf

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.s: %.c Makefile | $(OUT_DIR)
	$(CC) $(CFLAGS) $(ASMFLAGS) -S -o $@ $<

$(OUT_DIR)/%.o: %.c Makefile | $(OUT_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUT_DIR)/%.o: test/%.c Makefile | $(OUT_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUT_DIR)/%.o: %.s Makefile | $(OUT_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUT_DIR)/main.elf: $(OUT_DIR)/main.o $(OUT_DIR)/calculator.o
	$(CC) $(CFLAGS) -o $@ $^

$(OUT_DIR)/parser_test.elf: $(OUT_DIR)/parse_string_test.o $(OUT_DIR)/parse_string.o
	$(CC) $(CFLAGS) -o $@ $^



