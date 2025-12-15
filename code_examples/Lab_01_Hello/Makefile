# Makefile for Lab 01 - Hello World

# Cross-compiler settings
CROSS_COMPILE ?= arm-linux-gnueabihf-
CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = 

# Target executable
TARGET = hello

# Source files
SRC = main.c

# Build rule
all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
	@echo "Build completed: $(TARGET)"
	@file $(TARGET)

# Clean rule
clean:
	rm -f $(TARGET)
	@echo "Cleaned build artifacts"

# Install rule (copy to target if mounted)
install: $(TARGET)
	@if [ -d "/mnt/target" ]; then \
		cp $(TARGET) /mnt/target/home/root/; \
		echo "Installed to /mnt/target"; \
	else \
		echo "Target mount point not found"; \
	fi

.PHONY: all clean install
