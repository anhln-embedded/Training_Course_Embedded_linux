# Lab 01: Hello World on Embedded Linux

## Mục tiêu
- Cross-compile chương trình C đầu tiên cho ARM target
- Hiểu quy trình deploy và chạy trên board

## Yêu cầu
- Host PC với ARM cross-compiler đã cài đặt
- Target board (BeagleBone Black / Raspberry Pi)
- Kết nối serial hoặc SSH

## Code

Xem file `main.c` và `Makefile` trong thư mục này.

## Hướng dẫn Build

```bash
# Compile cho ARM
make

# Hoặc compile thủ công
arm-linux-gnueabihf-gcc -o hello main.c

# Check file type
file hello

# Transfer to target (example via SCP)
scp hello root@192.168.1.100:/home/root/

# Run on target
ssh root@192.168.1.100
./hello
```

## Expected Output

```
Hello from ARM Embedded Linux!
Running on: armv7l
```

## Troubleshooting

**Issue**: `bash: ./hello: No such file or directory`
- **Solution**: Đảm bảo đã compile cho đúng architecture (ARM)

**Issue**: Permission denied
- **Solution**: `chmod +x hello`
