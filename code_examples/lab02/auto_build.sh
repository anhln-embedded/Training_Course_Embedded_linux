#!/bin/bash
# Shebang: Báo cho hệ thống biết dùng bash shell để chạy script này

# Dừng script ngay lập tức nếu có bất kỳ lệnh nào bị lỗi
set -e

# ==========================================
# 1. KHAI BÁO CẤU HÌNH (VARIABLES)
# ==========================================
export CROSS_COMPILE="arm-linux-gnueabihf-"
TARGET_IP="192.168.1.100"  # Thay bằng IP thật của board nếu có

echo "=== BẮT ĐẦU QUY TRÌNH BUILD & DEPLOY ==="

# ==========================================
# 2. HÀM KIỂM TRA MÔI TRƯỜNG (FUNCTIONS)
# ==========================================
check_toolchain() {
    echo "[1/3] Checking cross-compiler..."
    if ! command -v ${CROSS_COMPILE}gcc &> /dev/null; then
        echo "ERROR: Cross-compiler '${CROSS_COMPILE}gcc' not found!"
        echo "Please install it: sudo apt install gcc-arm-linux-gnueabihf"
        exit 1
    fi
    echo "  -> Toolchain OK!"
}

# ==========================================
# 3. HÀM BIÊN DỊCH
# ==========================================
build_project() {
    echo "[2/3] Cleaning and Building project..."
    make clean
    # Biến CROSS_COMPILE đã được export nên Makefile sẽ tự nhận
    make 
    echo "  -> Build Success! File 'hello' generated."
}

# ==========================================
# 4. HÀM DEPLOY XUỐNG BOARD
# ==========================================
deploy_to_target() {
    echo "[3/3] Deploying to Target IP: ${TARGET_IP}..."

    # Cố gắng ping board trước khi copy
    if ping -c 1 -W 2 ${TARGET_IP} &> /dev/null; then
        echo "  -> Target is ONLINE. Transferring file..."
        scp hello root@${TARGET_IP}:/home/root/

        echo "  -> Executing on Target..."
        ssh root@${TARGET_IP} "chmod +x /home/root/hello && /home/root/hello"
    else
        echo "  -> WARNING: Target ${TARGET_IP} is UNREACHABLE."
        echo "  -> Skipping deploy step. Simulation mode only."
    fi
}

# ==========================================
# 5. CHẠY CÁC HÀM (EXECUTION)
# ==========================================
check_toolchain
build_project
deploy_to_target

echo "=== QUY TRÌNH KẾT THÚC ==="
