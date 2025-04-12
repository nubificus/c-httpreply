# Compiler and flags
CC = gcc
CFLAGS = -Wall -g
LDFLAGS =

# Define the source and output
SRC = main.c
OUT_LINUX = httpreply

# Compiler flags for each environment
CFLAGS_LINUX = $(CFLAGS)

all: linux

# Target for Linux build
linux: $(SRC)
	$(CC) $(CFLAGS_LINUX) -o $(OUT_LINUX) $(SRC)
	@echo "Linux build complete. Run './$(OUT_LINUX)' to start."

# Clean the generated files
clean:
	rm -f $(OUT_LINUX)
	@echo "Cleaned up build files."

.PHONY: linux clean

