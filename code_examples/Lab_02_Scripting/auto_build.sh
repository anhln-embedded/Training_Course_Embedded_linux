#!/bin/bash

################################################################################
# Auto Build Script for Embedded Linux Projects
# Lab 02 - Shell Scripting
################################################################################

set -e  # Exit on error

# Configuration
CROSS_COMPILE="arm-linux-gnueabihf-"
BUILD_DIR="build"
TARGET_IP="192.168.1.100"
TARGET_USER="root"
TARGET_PATH="/home/root/"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

################################################################################
# Functions
################################################################################

print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

check_toolchain() {
    print_info "Checking cross-compiler..."
    if ! command -v ${CROSS_COMPILE}gcc &> /dev/null; then
        print_error "Cross-compiler not found: ${CROSS_COMPILE}gcc"
        exit 1
    fi
    print_info "Toolchain OK: $(${CROSS_COMPILE}gcc --version | head -n1)"
}

clean_build() {
    print_info "Cleaning previous build..."
    rm -rf ${BUILD_DIR}
    mkdir -p ${BUILD_DIR}
}

build_project() {
    print_info "Building project..."
    cd ../Lab_01_Hello
    make clean
    make CROSS_COMPILE=${CROSS_COMPILE}
    
    if [ $? -eq 0 ]; then
        print_info "Build successful!"
        file hello
    else
        print_error "Build failed!"
        exit 1
    fi
}

deploy_to_target() {
    print_info "Deploying to target board..."
    
    # Check if target is reachable
    if ! ping -c 1 ${TARGET_IP} &> /dev/null; then
        print_warning "Target board not reachable at ${TARGET_IP}"
        print_warning "Skipping deployment..."
        return
    fi
    
    # Copy file via SCP
    scp hello ${TARGET_USER}@${TARGET_IP}:${TARGET_PATH}
    
    if [ $? -eq 0 ]; then
        print_info "Deployment successful!"
        
        # Run on target
        print_info "Running on target..."
        ssh ${TARGET_USER}@${TARGET_IP} "chmod +x ${TARGET_PATH}/hello && ${TARGET_PATH}/hello"
    else
        print_error "Deployment failed!"
        exit 1
    fi
}

################################################################################
# Main Script
################################################################################

echo "========================================"
echo "  Auto Build Script - Lab 02"
echo "========================================"
echo ""

check_toolchain
clean_build
build_project

# Ask user if they want to deploy
read -p "Deploy to target board? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    deploy_to_target
else
    print_info "Skipping deployment"
fi

print_info "Script completed!"
