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

# BÀI 27: TỰ ĐỘNG HÓA VỚI BUILDROOT
## Embedded System Automation

---

# 🎯 Mục tiêu bài học

1. **Vấn đề:** Tại sao việc build thủ công (Toolchain -> U-Boot -> Kernel -> RootFS) lại không hiệu quả cho dự án lớn?
2. **Build Systems:** Giới thiệu Buildroot vs Yocto Project.
3. **Buildroot:** Cấu trúc, cách cấu hình (`make menuconfig`) và thêm package mới.
4. **Thực hành:** Tạo ra một file ảnh thẻ nhớ (`sdcard.img`) chỉ với 1 lệnh `make`.

---

# 1. Tại sao cần Build System?

Ở Giai đoạn 2, chúng ta đã làm thủ công:

1. Tải source code (từ nhiều nguồn git khác nhau).
2. Patch lỗi.
3. Cấu hình (`defconfig`).
4. Biên dịch.
5. Copy từng file vào thẻ nhớ.

> **Rủi ro:** Khó quản lý phiên bản, khó tái hiện (reproduce) lỗi, tốn công sức khi update thư viện.

---

# 2. Buildroot là gì?

Là một bộ Makefile khổng lồ giúp tự động hóa toàn bộ quy trình trên.

* **Đầu vào:** File cấu hình (`.config`).
* **Xử lý:** Tự tải source (GCC, Kernel, App...), tự patch, tự build.
* **Đầu ra:** Một thư mục `output/images/` chứa sẵn `zImage`, `u-boot.img`, `rootfs.tar` và thậm chí là `sdcard.img`.

> **Triết lý:** "Simple, efficient and easy to use".

---

# 3. Buildroot vs Yocto

| Đặc điểm | Buildroot | Yocto Project |
| :--- | :--- | :--- |
| **Độ khó** | Dễ (dùng `kconfig` giống Kernel). | Khó (dùng khái niệm `Layer`, `Recipe`). |
| **Cấu trúc** | Dùng Makefile. | Dùng BitBake (Python). |
| **Tùy biến** | Tốt cho hệ thống nhỏ, tĩnh. | Cực mạnh, chuẩn công nghiệp cho hệ thống phức tạp. |
| **Đối tượng** | Người mới bắt đầu, Hobbyist. | Các hãng chip (NXP, TI, Intel). |

---

# 4. Quy trình làm việc với Buildroot

1. **Clone:** `git clone git://git.buildroot.net/buildroot`
2. **Config:**
   * Chọn board mẫu: `make raspberrypi3_defconfig`
   * Tùy chỉnh: `make menuconfig` (Thêm gói `vim`, `openssh`, `python`...).
3. **Build:** `make` (Chờ khoảng 30p - 2 tiếng tùy mạng và CPU).
4. **Flash:** Ghi file `output/images/sdcard.img` ra thẻ nhớ.

---

# 🛠️ PHẦN THỰC HÀNH (LAB 27)

### Build hệ thống Linux hoàn chỉnh trong 1 nốt nhạc

---

# Yêu cầu

1. Tải Buildroot bản mới nhất (LTS).
2. Cấu hình cho board BeagleBone Black (`beaglebone_defconfig`).
3. Vào `Target packages` -> `Games` -> Chọn `sl` (Steam Locomotive - Tàu hỏa chạy trên màn hình).
4. Build hệ thống (`make`).
5. Nạp thẻ, boot board và chạy lệnh `sl` để giải trí.

> **Lưu ý:** Lần đầu build sẽ rất lâu vì nó phải tải và biên dịch GCC từ đầu. Hãy kiên nhẫn hoặc treo máy qua đêm.

---

# Q & A

## Hẹn gặp lại ở Bài 28: Kick-off Đồ án!
