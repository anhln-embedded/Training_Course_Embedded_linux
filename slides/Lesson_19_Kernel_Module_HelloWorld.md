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
  table {
    border-collapse: collapse;
    width: 100%;
  }
  th {
    background: #eee;
  }
  td, th {
    padding: 10px;
    border: 1px solid #ddd;
  }
---

# BÀI 19: NHẬP MÔN KERNEL MODULE
## Hello World from Kernel Space

---

# 🎯 Mục tiêu bài học

1. **Khái niệm:** Kernel Module (`.ko`) là gì? Tại sao không biên dịch cứng vào nhân?
2. **Cấu trúc:** Hàm `init`, hàm `exit` và Macros.
3. **Giấy phép:** Tại sao bắt buộc phải có `MODULE_LICENSE("GPL")`?
4. **Công cụ:** Các lệnh `insmod`, `rmmod`, `lsmod`, `dmesg`.

---

# 1. Kernel Module là gì?

* Là một đoạn code có thể nạp vào (load) hoặc gỡ ra (unload) khỏi nhân Kernel khi đang chạy mà không cần khởi động lại máy.
* **Ví dụ:** Cắm USB Wifi vào -> Kernel nạp driver Wifi. Rút ra -> Gỡ driver.
* **Đuôi file:** `.ko` (Kernel Object).

> **So sánh:** Giống như file `.dll` trên Windows nhưng chạy ở quyền Admin cao nhất.

---

# 2. Cấu trúc một Module cơ bản

```c
#include <linux/module.h>  // Thư viện bắt buộc
#include <linux/init.h>    // Macros init/exit

// Hàm chạy khi nạp module (insmod)
static int __init my_init(void) {
    printk("Hello Kernel World!\n");
    return 0;  // Trả về 0 là thành công
}

// Hàm chạy khi gỡ module (rmmod)
static void __exit my_exit(void) {
    printk("Goodbye Kernel!\n");
}

module_init(my_init);
module_exit(my_exit);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Luu Ngoc Anh");
MODULE_DESCRIPTION("A simple Hello World Module");
```

---

# 3. Kernel Makefile

Khác với Makefile ứng dụng, ta phải dùng hệ thống **Kbuild** của Kernel.

```makefile
# Makefile
obj-m += hello.o

all:
# Gọi Makefile của Kernel source để build module này
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```

> **Lưu ý:** Khi cross-compile cho board, đường dẫn `-C` phải trỏ tới thư mục source kernel đã build ở Bài 10.

---

# 4. Các lệnh thao tác (CLI)

1. **`insmod hello.ko`**: Insert module (Nạp vào RAM).
2. **`lsmod`**: List modules (Liệt kê module đang chạy).
3. **`modinfo hello.ko`**: Xem thông tin (Tác giả, License).
4. **`rmmod hello`**: Remove module (Gỡ bỏ).
5. **`dmesg`**: Xem log của Kernel (Nơi `printk` in ra).

> **Mẹo:** Dùng `dmesg -w` để theo dõi log realtime.

---

# 🛠️ PHẦN THỰC HÀNH (LAB 19)

### Hello Kernel

---

# Yêu cầu

1. Viết file `hello.c` và `Makefile`.
2. Biên dịch trên máy ảo Ubuntu (Native build).
3. Nạp module: `sudo insmod hello.ko`.
4. Kiểm tra log: `dmesg | tail`.
5. Gỡ module: `sudo rmmod hello`.
6. Kiểm tra log lần nữa.

> **Thử thách:** Sửa code để module nhận tham số đầu vào khi nạp.
> Ví dụ: `insmod hello.ko my_name="Anh"`
> *Gợi ý: Tìm hiểu `module_param`.*

---

# Q & A

## Hẹn gặp lại ở Bài 20: Character Driver!
