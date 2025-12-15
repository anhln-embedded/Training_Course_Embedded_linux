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

# BÀI 17: LẬP TRÌNH MẠNG SOCKET
## TCP/IP Socket Programming

---

# 🎯 Mục tiêu bài học

1. **Mô hình Client-Server:** Ai phục vụ, ai yêu cầu?
2. **TCP vs UDP:** Tin cậy vs Tốc độ.
3. **Socket Flow:** `socket` -> `bind` -> `listen` -> `accept`.
4. **Thực hành:** Viết IoT Gateway gửi dữ liệu cảm biến lên PC.

---

# 1. Socket là gì?

Là "ổ cắm" kết nối mạng. Một socket được định danh bởi cặp: `IP Address : Port Number`.

**Ví dụ:** `192.168.1.10:8080`
* **Server:** Mở port, lắng nghe (Listen).
* **Client:** Chủ động kết nối (Connect).

---

# 2. Quy trình TCP Server

1. `socket()`: Tạo socket.
2. `bind()`: Gắn vào cổng (VD: 8080).
3. `listen()`: Chuyển sang chế độ đợi.
4. `accept()`: **Chặn (Block)** cho đến khi có khách (Client) kết nối. Trả về một `client_fd` mới.
5. `read()/write()`: Giao tiếp qua `client_fd`.
6. `close()`: Ngắt kết nối.

---

# 3. Quy trình TCP Client

1. `socket()`: Tạo socket.
2. `connect()`: Kết nối đến IP và Port của Server.
3. `read()/write()`: Gửi/Nhận dữ liệu.
4. `close()`: Nghỉ chơi.

---

# 🛠️ PHẦN THỰC HÀNH (LAB 17)

### Remote Control LED qua Mạng LAN

---

# Yêu cầu

1. **Server (Chạy trên Board):**
   * Lắng nghe Port 8888.
   * Nếu nhận chuỗi "ON" $\to$ Bật LED (ghi vào sysfs).
   * Nếu nhận chuỗi "OFF" $\to$ Tắt LED.
   * Gửi phản hồi "OK" về Client.
2. **Client (Chạy trên PC hoặc điện thoại dùng Netcat):**
   * Gửi lệnh điều khiển.
   * *Test nhanh:* `echo "ON" | nc 192.168.1.xx 8888`

---

# Q & A

## Hẹn gặp lại ở Bài 18: Giao tiếp Phần cứng!
