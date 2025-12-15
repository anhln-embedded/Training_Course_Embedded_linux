---
marp: true
theme: gaia
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.jpg')
footer: 'Embedded Linux Training | Lecturer: Lưu Ngọc Anh'
style: |
  section {
    font-family: 'Arial', sans-serif;
    font-size: 26px;
  }
  h1 {
    color: #0056b3;
  }
  h2 {
    color: #333;
    border-bottom: 3px solid #0056b3;
  }
  code {
    background: #f0f0f0;
    color: #d63384;
    font-weight: bold;
  }
  section.lead {
    background-color: #0056b3;
    color: #fff;
  }
  section.lead h1 {
    color: #fff;
  }
---

# BÀI 13: FILE I/O & SYSFS
## "Everything is a File" Philosophy

---

# 🎯 Mục tiêu bài học

1. **Triết lý:** Hiểu tại sao trong Linux "Mọi thứ đều là file" (kể cả phần cứng).
2. **System Calls:** Sử dụng thành thạo `open`, `read`, `write`, `close`, `ioctl`.
3. **Sysfs:** Điều khiển phần cứng (LED, GPIO) từ User Space mà không cần viết Driver.
4. **Thực hành:** Viết app C bật tắt đèn LED trên board.

---

# 1. File Descriptor (fd) là gì?

Khi chương trình mở một file, Kernel trả về một số nguyên không âm gọi là **File Descriptor**.

* `0`: Standard Input (stdin)
* `1`: Standard Output (stdout)
* `2`: Standard Error (stderr)
* `3, 4, ...`: Các file do user mở.

> **Tư duy:** Muốn giao tiếp với driver chuột? Mở file `/dev/input/mouse0`. Muốn ghi ra màn hình? Ghi vào file descriptor `1`.

---

# 2. Các System Call cơ bản

```c
#include <fcntl.h>
#include <unistd.h>

int fd = open("/path/to/file", O_RDWR);  // Mở file đọc/ghi
if (fd < 0) {
    perror("Lỗi mở file");  // In lỗi chi tiết
    return -1;
}

char buf[10];
read(fd, buf, 10);  // Đọc 10 bytes
write(fd, "Data", 4);  // Ghi dữ liệu
close(fd);  // Đóng file (Rất quan trọng!)
```

---

# 3. Sysfs Interface (`/sys`)

Sysfs là giao diện giúp User Space nhìn thấy cấu trúc thiết bị và điều khiển chúng.

**Ví dụ với GPIO:** Để điều khiển chân GPIO số 60:

1. **Export:** `echo 60 > /sys/class/gpio/export`
2. **Direction:** `echo out > /sys/class/gpio/gpio60/direction`
3. **Value:** `echo 1 > /sys/class/gpio/gpio60/value`

---

# 🛠️ PHẦN THỰC HÀNH (LAB 13)

### Viết App điều khiển LED

---

# Yêu cầu

1. Xác định số hiệu GPIO của một đèn LED trên board (Tra schematic hoặc dùng lệnh `gpioinfo`).
2. Viết chương trình C (`led_control.c`) thực hiện:
   * Mở file `/sys/class/gpio/export` để export chân LED.
   * Set hướng là `out`.
   * Vòng lặp: Ghi `1` rồi `0` vào file `value` để làm đèn nhấp nháy 1 giây/lần.

---

# Code mẫu (Gợi ý)

```c
// Mở file value để ghi
int fd = open("/sys/class/gpio/gpio60/value", O_WRONLY);
while(1) {
    write(fd, "1", 1);  // Bật
    sleep(1);
    write(fd, "0", 1);  // Tắt
    sleep(1);
}
close(fd);
```

> **Lưu ý:** Cần chạy với quyền `root` (hoặc `sudo`) vì truy cập `/sys` yêu cầu quyền admin.

---

# Q & A

## Hẹn gặp lại ở Bài 14: Quản lý Tiến trình!
