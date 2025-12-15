---
marp: true
theme: ../themes/custom_style.css
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.jpg')
footer: 'Embedded Linux Training Course | Lecturer: Lưu Ngọc Anh'
---

# LỘ TRÌNH ĐÀO TẠO
# KỸ SƯ EMBEDDED LINUX
### Từ Zero đến Hero

**Người trình bày:** Lưu Ngọc Anh
*Thời lượng dự kiến: 30 Buổi*

---

# Tại sao chọn Embedded Linux?

> "Thế giới IoT không chỉ có tắt bật đèn LED. Nó là Camera AI, là Router, là Gateway xử lý hàng triệu gói tin."

- **Nhu cầu:** 90% thiết bị IoT cao cấp chạy Linux.
- **Thu nhập:** Thường cao hơn 30-50% so với lập trình MCU truyền thống.
- **Thách thức:** Khó hơn, trừu tượng hơn, nhưng quyền năng hơn.

---

![bg right:40%](https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80)

# Bức tranh toàn cảnh (Architecture)

Chúng ta không chỉ viết code, chúng ta **xây dựng hệ điều hành**.

1. **Bootloader:** Người dẫn đường (U-Boot).
2. **Kernel:** Trái tim (Linux Kernel).
3. **Root Filesystem:** Cơ thể (Libraries, Configs).
4. **User Application:** Linh hồn (App của bạn).

---

# Tổng quan lộ trình (30 Buổi)

| Giai đoạn | Chủ đề chính | Mục tiêu |
| :--- | :--- | :--- |
| **Phần 1** | **Environment & Toolchain** | Biết dùng Terminal, Cross-compile |
| **Phần 2** | **System Porting** | Board khởi động được vào Linux |
| **Phần 3** | **Application (User)** | Viết App điều khiển, Mạng, Đa luồng |
| **Phần 4** | **Driver (Kernel)** | Viết Driver điều khiển phần cứng |
| **Phần 5** | **Project** | Hoàn thiện sản phẩm cuối khóa |

---

# Giai đoạn 1: Nhập môn & Sinh tồn
### (Buổi 1 - 5)

> Mục tiêu: Xóa bỏ nỗi sợ màn hình đen.

---

# Giai đoạn 1: Nội dung chi tiết

1. **Làm chủ dòng lệnh:** `ls`, `grep`, `chmod`, `vim`.
2. **Shell Scripting:** Tự động hóa tác vụ.
3. **Cross-Compilation:**
   - Tại sao code trên PC (x86) lại chạy trên Board (ARM)?
   - Cài đặt Toolchain.

```bash
# Ví dụ về Cross-Compile
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
$CROSS_COMPILE-gcc main.c -o main_arm