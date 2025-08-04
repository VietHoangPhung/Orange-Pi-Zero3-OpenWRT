# OpenWRT Docker Build for Orange Pi Zero 3

This project provides a Docker-based environment to build a custom OpenWRT firmware for the **Orange Pi Zero 3**. It includes a custom utility package `checkpython` that verifies the presence and version of Python 3 in the target system.

---

# Project Structure

### `Dockerfile`
Sets up an Ubuntu-based container with all required dependencies to build OpenWRT. It:
- Set up an Ubuntu 24.04 container with all necessary build dependencies.
- Clone the OpenWRT source code.
- Install all OpenWRT feeds and packages.
- Copy the custom package and board-specific config.
- Build the OpenWRT firmware using make

### `custom_package/checkpython`
- Contains a simple C program (check_python.c) that checks for Python 3 and logs its version.
- The accompanying Makefile defines how to compile and install this utility into the OpenWRT image.

**A simple C utility that:**
- Runs `python3 --version`
- Logs the detected version to `/tmp/python_ver.log`
- Included in the OpenWRT image as `/usr/bin/checkpython`

### `opi_z3.config`
- A pre-configured OpenWRT .config file tailored for the Orange Pi Zero 3.
- Specifies target architecture, kernel options, and included packages. (LuCI, python, checkpython, etc).


### `Makefile`
Rules to:
- Build the Docker image
```bash
make docker-build
```
- Run the Docker container interactively 
```bash
make run
```

--------

# Build Instructions

### Prerequisites
- docker & make installed
- GNU Make available

### Steps

1. **Build the Docker Image**
```bash
make docker-build
```
This uses the Dockerfile to create an image named openwrt-builder:0.1 with all necessary build tools.

2. **Run the Docker Container**
```bash
make run
```
This opens an interactive shell in the container, so that you can get what you need (img, .apk, etc). 

Images should be stored at 
`/openwrt/bin/targets/sunxi/cortexa53/`

.apk should be stored at 
`/openwrt/bin/packages/aarch64_cortex-a53/base/`
or 
`/openwrt/staging_dir/packages/sunxi/`
