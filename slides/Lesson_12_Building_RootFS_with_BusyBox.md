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

# BÀI 12: TẠO ROOTFS VỚI BUSYBOX
## Building a Minimal Root Filesystem

---

# 🎯 Mục tiêu bài học

1. **BusyBox:** Hiểu tại sao nó được gọi là "Con dao đa năng" của Embedded Linux.
2. **Build:** Biên dịch BusyBox từ source.
3. **Skeleton:** Tạo cấu trúc thư mục rỗng.
4. **Libraries:** Copy thư viện C cần thiết từ Toolchain.
5. **Kết quả:** Hệ thống khởi động thành công vào dấu nhắc lệnh `root@board:~#`.

---

# 1. BusyBox là gì?

* Một file thực thi duy nhất (`/bin/busybox`) nhưng chứa hàng trăm lệnh Linux (`ls`, `cp`, `mv`, `vi`, `init`, `sh`...).
* Dựa vào tên gọi (symlink) mà nó biết phải làm gì.
  * Nếu gọi `./ls` -> Nó chạy chức năng liệt kê.
  * Nếu gọi `./vi` -> Nó chạy chức năng soạn thảo.
* **Ưu điểm:** Kích thước siêu nhỏ (< 2MB).

---

# 2. Quy trình tạo RootFS

1. **Biên dịch BusyBox:** Để có các lệnh cơ bản.
2. **Tạo thư mục:** `mkdir proc sys dev etc lib ...`
3. **Cài đặt thư viện:** Copy `libc.so`, `ld-linux.so` từ Toolchain vào `/lib` của RootFS (Trừ khi build BusyBox dạng Static).
4. **Tạo file cấu hình:**
   * `/etc/inittab`: Chỉ dẫn cho tiến trình Init.
   * `/etc/init.d/rcS`: Script chạy khởi động.

---

# 🛠️ PHẦN THỰC HÀNH (LAB 12)

### Tạo RootFS thủ công ("By Hand")

---

# Bước 1: Build BusyBox

```bash
# 1. Tải source
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar -xjvf busybox-1.36.1.tar.bz2
cd busybox-1.36.1

# 2. Cấu hình (Giống Kernel)
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make defconfig
make menuconfig
# (Chọn Settings -> Build static binary nếu muốn khỏi copy thư viện - Dễ cho người mới)

# 3. Build & Install
make
make install
# Mặc định nó sẽ cài vào thư mục ./_install
```

---

# Bước 2: Hoàn thiện cấu trúc (Skeleton)

Vào thư mục `_install` vừa tạo:

```bash
cd _install
mkdir proc sys dev etc lib root

# Tạo file khởi động rcS
mkdir -p etc/init.d
touch etc/init.d/rcS
chmod +x etc/init.d/rcS
```

Nội dung file `etc/init.d/rcS`:

```bash
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
/sbin/mdev -s  # Tự động tạo device node
echo "Chao mung den voi Embedded Linux!"
```

---

# Bước 3: Đóng gói & Nạp thẻ nhớ

1. **Xóa dữ liệu cũ** trên phân vùng ROOTFS của thẻ nhớ.
2. **Copy toàn bộ** nội dung trong `_install` vào thẻ nhớ.

```bash
sudo cp -r _install/* /media/user/ROOTFS/
```

3. **Boot:** Cắm thẻ vào board và quan sát.

---

# Kết quả mong đợi

Nếu thành công, bạn sẽ thấy log chạy qua Kernel và dừng lại ở:

```
Please press Enter to activate this console.
/ #
```

Gõ thử `ls`, `vi`.

**Chúc mừng! Bạn đã tự tay xây dựng một hệ điều hành Linux.**

---

# Q & A

## Kết thúc Giai đoạn 2.

### Chuẩn bị sang Giai đoạn 3: Application Development!
