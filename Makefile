# Makefile
# Criado por Matheus Leme Da Silva
# Licensa MIT

ROOT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
BUILD_DIR := $(ROOT_DIR)build
SCRIPTS_DIR := $(ROOT_DIR)scripts
BIN_DIR := $(BUILD_DIR)/bin
OBJ_DIR := $(BUILD_DIR)/obj
IMAGES_DIR := $(BUILD_DIR)/images

DIRS := $(BUILD_DIR) $(BIN_DIR) $(OBJ_DIR) $(IMAGES_DIR)

ARCH ?= i686
IMAGE := $(IMAGES_DIR)/KeyStoneOS-$(ARCH).img

CHECKDEPS := $(SCRIPTS_DIR)/checkdeps.sh

export BUILD_DIR
export BIN_DIR
export OBJ_DIR
export IMAGES_DIR

all: checkdeps $(DIRS) $(IMAGE)

clean:
	rm -rf $(BUILD_DIR)

$(DIRS):
	mkdir -p $@

checkdeps:
	chmod +x $(CHECKDEPS)
	$(CHECKDEPS)

$(IMAGE): $(DIRS)


.PHONY: all clean checkdeps
