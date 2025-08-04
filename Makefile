APP_NAME := check_python
SRC := check_python.c
BUILD_DIR := build
DOCKER_IMAGE := openwrt-builder:0.1
CONTAINER_NAME := openwrt_container

all: docker-build

docker-build:
	docker build -t $(DOCKER_IMAGE) .

# build:
# 	mkdir -p $(BUILD_DIR)
# 	$(CC) -o $(BUILD_DIR)/$(APP_NAME) $(SRC)

run: docker-build
	docker run --rm -it \
		-v $$(pwd):/project \
		--name $(CONTAINER_NAME) \
		$(DOCKER_IMAGE)



# package:
# 	@echo "[*] Packaging into .ipk inside Docker container..."
# 	docker run --rm -it \
# 		-v $$(pwd):/project \
# 		--name $(CONTAINER_NAME) \
# 		$(DOCKER_IMAGE) \
# 		bash -c "cd /home/builder/openwrt && make package/checkpython/compile V=s"

# clean:
# 	rm -rf $(BUILD_DIR) /tmp/python_ver.log
