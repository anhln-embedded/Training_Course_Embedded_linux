# Khóa Học Embedded Linux

## Giới Thiệu
Khóa học Embedded Linux dành cho sinh viên, bao gồm 30 bài học từ cơ bản đến nâng cao về hệ điều hành Linux nhúng, lập trình hệ thống và phát triển ứng dụng trên nền tảng ARM.

## Yêu Cầu Phần Cứng
- **Board phát triển**: BeagleBone Black / Raspberry Pi
- **Processor**: ARM Cortex-A (AM335x hoặc tương đương)
- **RAM**: Tối thiểu 512MB
- **Storage**: MicroSD Card 8GB trở lên
- **Kết nối**: USB to Serial (UART), Ethernet

## Yêu Cầu Phần Mềm
- **Hệ điều hành host**: Linux (Ubuntu 20.04/22.04 khuyến nghị) hoặc Windows với WSL2
- **Toolchain**: ARM GCC Cross-compiler
- **Tools**: 
  - Minicom/PuTTY (Serial Terminal)
  - Git
  - Make, CMake
  - VS Code hoặc IDE tương đương

## Cài Đặt Môi Trường

### 1. Cài đặt Cross-Compiler (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
```

### 2. Cài đặt Marp CLI (Để xuất slides)
```bash
npm install -g @marp-team/marp-cli
```

### 3. Clone Repository
```bash
git clone <repository-url>
cd Training_Course_Embedded_linux
```

## Cấu Trúc Thư Mục
```
├── README.md                # File này
├── themes/                  # Theme CSS cho slides
├── assets/                  # Tài nguyên (images, docs)
├── slides/                  # Source code slides (Markdown)
├── exports/                 # Slides đã export (PDF/HTML)
└── code_examples/           # Code mẫu cho Lab
```

## Cách Sử Dụng

### Xem Slides
1. Mở file `.md` trong thư mục `slides/` bằng VS Code với extension Marp
2. Hoặc export sang PDF/HTML từ thư mục `exports/`

### Chạy Code Examples
```bash
cd code_examples/Lab_XX_YourLab
make
./program
```

## Danh Sách Bài Học (Curriculum)

### Giai Đoạn 1: Environment & Toolchain
1. **Introduction & Environment Setup**: Tổng quan Embedded Linux & Cài đặt môi trường.
2. **Command Line & Shell Scripting**: Làm chủ dòng lệnh Linux & Scripting cơ bản.
3. **Advanced C & Makefile**: Ôn tập C nâng cao & Quản lý dự án với Makefile.
4. **Cross-Compilation Toolchains**: Kiến trúc Host-Target & Toolchain.
5. **Static vs Dynamic Libraries**: Thư viện tĩnh, thư viện động & Quy trình Build.

### Giai Đoạn 2: System Porting (Boot to Root)
6. **Linux Boot Sequence**: Quy trình khởi động Linux & Tổng quan Bootloader.
7. **U-Boot Porting & Commands**: Thực hành U-Boot: Biên dịch, Nạp & Cấu hình.
8. **Kernel Architecture & Configuration**: Kiến trúc Linux Kernel & Kconfig.
9. **Device Tree Source & Bindings**: Device Tree (DTS): Bản đồ phần cứng.
10. **Kernel Compilation & Debugging**: Biên dịch Kernel & Xử lý lỗi Kernel Panic.
11. **RootFS & SysVinit/Systemd**: Cấu trúc Root Filesystem & Hệ thống Init.
12. **Building RootFS with BusyBox**: Tạo RootFS thủ công với BusyBox.

### Giai Đoạn 3: Application Development
13. **File Operations & Sysfs**: Linux File I/O & Điều khiển GPIO qua Sysfs.
14. **Process Management**: Quản lý Tiến trình & Tín hiệu (Fork/Exec & Signals).
15. **Multithreading & Synchronization**: Lập trình Đa luồng & Đồng bộ hóa.
16. **IPC Mechanisms**: Giao tiếp liên tiến trình (Pipe, Message Queue, Shared Memory).
17. **Network Socket Programming**: Lập trình Mạng Socket TCP/IP.
18. **Hardware Interfaces**: Giao tiếp phần cứng từ User Space (UART, I2C, SPI).

### Giai Đoạn 4: Linux Device Driver
19. **Hello World LKM**: Nhập môn Kernel Module.
20. **Character Device Driver**: Major/Minor Numbers & Device Nodes.
21. **User-Kernel Data Exchange**: Trao đổi dữ liệu (copy_to_user / copy_from_user).
22. **GPIO Driver**: Legacy & Descriptor-based GPIO.
23. **Interrupt Handling**: Xử lý Ngắt trong Kernel (Top-half & Bottom-half).
24. **Platform Device & Driver**: Mô hình Linux Driver & Platform Driver.
25. **Parsing DT in Kernel**: Tương tác Driver với Device Tree.
26. **Kernel Synchronization**: Đồng bộ hóa trong Kernel (Spinlocks, Mutex).

### Giai Đoạn 5: Automation & Project
27. **Embedded System Automation**: Tự động hóa hệ thống với Buildroot.
28. **Final Project Kickoff**: Khởi động Đồ án & Thiết kế kiến trúc.
29. **Advanced Debugging**: Kỹ thuật Debug nâng cao (GDB, Strace, Valgrind).
30. **Final Defense**: Bảo vệ Đồ án & Định hướng nghề nghiệp.

## Hỗ Trợ
- Email: anhln.embedded@gmail.com
- Forum: 

## Tác Giả

Lưu Ngọc Anh
## License
[Specify license]
