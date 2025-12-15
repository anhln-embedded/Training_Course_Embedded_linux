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

# BÀI 11: ROOT FILESYSTEM & INIT SYSTEM
## Cơ thể của Hệ điều hành

---

# 🎯 Mục tiêu bài học

1. **Cấu trúc:** Hiểu chuẩn FHS (Filesystem Hierarchy Standard).
2. **Init System:** Vai trò của chương trình đầu tiên (`PID 1`).
3. **Pseudo Filesystems:** Hiểu về `/proc`, `/sys`, `/dev`.
4. **Chuẩn bị:** Những gì cần có để tạo một RootFS tối thiểu.

---

# 1. Root Filesystem là gì?

Là cấu trúc thư mục chứa tất cả file cần thiết để hệ thống hoạt động (Ứng dụng, Thư viện, Cấu hình).

**Các thư mục bắt buộc (FHS):**
* `/bin`, `/sbin`: Chứa lệnh cơ bản (`ls`, `cp`, `ip`).
* `/lib`: Thư viện (`libc.so`, `ld-linux.so`).
* `/etc`: File cấu hình (`inittab`, `fstab`, `network/`).
* `/dev`: Chứa device nodes (đại diện phần cứng).
* `/proc`, `/sys`: Giao tiếp với Kernel.
* `/var`, `/tmp`: Dữ liệu tạm, log.

---

# 2. Quy trình Init (PID 1)

Sau khi Kernel mount xong RootFS, nó sẽ tìm và chạy chương trình `/sbin/init`. Đây là cha của mọi tiến trình.

**Các loại Init System phổ biến:**
1. **SysVinit:** Cổ điển, dùng script (`/etc/init.d/`), đơn giản, dễ hiểu. (Khuyên dùng cho Embedded nhỏ).
2. **Systemd:** Hiện đại, phức tạp, khởi động song song, quản lý service mạnh mẽ. (Dùng trên Ubuntu/PC).
3. **BusyBox Init:** Cực kỳ đơn giản, cấu hình qua `/etc/inittab`.

---

# 3. Hệ thống file ảo (Pseudo Filesystems)

Đây là các thư mục không chứa file trên ổ cứng, mà là cửa sổ nhìn vào RAM/Kernel.

* **`/proc` (Process Info):** Thông tin tiến trình.
  * `cat /proc/cpuinfo`: Xem thông tin CPU.
  * `cat /proc/meminfo`: Xem RAM.
* **`/sys` (Sysfs):** Cấu trúc cây thiết bị, driver.
  * Dùng để điều khiển GPIO, LED từ user space.
* **`/dev` (Device Nodes):**
  * `/dev/ttyS0` (UART), `/dev/sda` (Ổ cứng).

---

# 🛠️ PHẦN THỰC HÀNH (LAB 11)

### Khám phá cấu trúc RootFS trên máy ảo

---

# Nhiệm vụ

Trên máy ảo Ubuntu:

1. **Khám phá `/proc`:**
   * Tìm PID của tiến trình `bash` hiện tại (`echo $$`).
   * Vào `/proc/<PID>/` xem có gì trong đó.
2. **Khám phá `/sys`:**
   * Vào `/sys/class/net/` để xem danh sách card mạng.
3. **Khám phá `/dev`:**
   * `ls -l /dev/zero`, `/dev/null`.
   * Thử lệnh `echo "test" > /dev/null` (Hố đen vũ trụ).

---

# Q & A

## Hẹn gặp lại ở Bài 12: Tạo RootFS với BusyBox!
