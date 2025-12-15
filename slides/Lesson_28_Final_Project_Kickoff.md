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

# BÀI 28: KHỞI ĐỘNG ĐỒ ÁN CUỐI KHÓA
## Final Project Kick-off

---

# 🎯 Mục tiêu

1. **Tổng hợp:** Kết hợp kiến thức Driver + App + System.
2. **Lên ý tưởng:** Chọn đề tài thực tế.
3. **Thiết kế:** Vẽ sơ đồ khối phần cứng và phần mềm.
4. **Lập kế hoạch:** Timeline thực hiện trong 2 tuần cuối.

---

# 1. Gợi ý đề tài (Topics)

Sinh viên chọn 1 trong 3 hướng sau:

1. **IoT Gateway (Mạng & Driver):**
   * Thu thập dữ liệu từ cảm biến (Zigbee/LoRa qua UART).
   * Lưu Database (SQLite) trên Board.
   * Gửi lên Dashboard (MQTT/HTTP).

2. **Smart Camera (Multimedia):**
   * Stream video từ USB Camera (V4L2).
   * Nhận diện chuyển động (OpenCV cơ bản).
   * Gửi cảnh báo Telegram.

3. **Music Player (Giao diện & Audio):**
   * Phát nhạc số (ALSA).
   * Điều khiển qua Web Interface (Websocket).

---

# 2. Yêu cầu kỹ thuật bắt buộc

Đồ án phải chứng minh được năng lực "Fullstack Embedded":

1. **System:** Hệ điều hành tự build (tối thiểu là Kernel + RootFS, khuyến khích dùng Buildroot).
2. **Driver:** Có ít nhất 1 Driver tự viết (GPIO, I2C hoặc Platform Driver).
3. **App:** Chương trình điều khiển đa luồng (Multithreading).
4. **Kết nối:** Có giao tiếp mạng (Socket/MQTT).

---

# 3. Quy trình thiết kế (Design Process)

**Bước 1: Hardware Block Diagram**
* Vẽ sơ đồ kết nối: Cảm biến gì? Nối chân nào? Giao thức gì?

**Bước 2: Software Architecture**
* Tầng Driver: File `/dev/xyz`.
* Tầng Middleware: Thư viện xử lý.
* Tầng Application: Main thread làm gì? Network thread làm gì?

**Bước 3: Chọn linh kiện & Mua sắm**
* Board (Pi/BBB), Module cảm biến, Dây nối, Nguồn.

---

# 🛠️ PHẦN THỰC HÀNH (LAB 28)

### Viết Proposal (Đề cương)

---

# Nội dung Proposal

Mỗi nhóm (1-2 người) nộp 1 trang A4 gồm:

1. **Tên đề tài:**
2. **Mô tả chức năng:** Sản phẩm làm được gì?
3. **Danh sách phần cứng:**
4. **Kiến trúc phần mềm dự kiến:**
   * Driver cần viết: ...
   * Thư viện cần dùng: ...
5. **Kế hoạch:** * Tuần 1: Xong phần cứng & Driver. * Tuần 2: Xong App & Web.

---

# Q & A

## Hạn nộp Proposal: 24h sau buổi học này!
