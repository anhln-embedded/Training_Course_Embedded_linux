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

# BÀI 30: BẢO VỆ ĐỒ ÁN & ĐỊNH HƯỚNG NGHỀ NGHIỆP
## Graduation Defense & Career Path

---

# 🎯 Nội dung buổi cuối

1. **Bảo vệ:** Các nhóm trình bày sản phẩm (Demo + Slide).
2. **Đánh giá:** Chấm điểm dựa trên tiêu chí (Độ khó, Hoàn thiện, Hiểu biết).
3. **Chia sẻ:** Định hướng nghề nghiệp Embedded Linux.
4. **Tổng kết:** Trao chứng nhận (nếu có) và chia tay.

---

# 1. Cấu trúc bài thuyết trình (5-7 phút)

1. **Giới thiệu:** Tên đề tài, thành viên.
2. **Vấn đề & Giải pháp:** Tại sao làm cái này? Nó giải quyết gì?
3. **Kiến trúc hệ thống:** Show sơ đồ khối (HW & SW).
4. **Kỹ thuật nổi bật:** * Driver xử lý ngắt như thế nào? * App dùng đa luồng ra sao? * Khó khăn nhất gặp phải và cách giải quyết?
5. **DEMO:** Quay video hoặc chạy trực tiếp.

---

# 2. Định hướng nghề nghiệp (Career Path)

Thế giới Embedded Linux rất rộng, bạn có thể chọn chuyên sâu:

* **BSP Engineer (Board Support Package):** * Chuyên Porting U-Boot, Kernel cho chip mới. * Làm việc tại: FPT, Viettel, các hãng Chip (Renesas, NXP). * *Yêu cầu:* Giỏi C, hiểu sâu Hardware, Datasheet.

* **Embedded Linux Application Dev:** * Viết App (Qt/C++, Python) chạy trên Linux. * Làm việc tại: Các công ty làm sản phẩm (Camera, AI Box, Y tế). * *Yêu cầu:* Giỏi C++, Multithreading, Network, Graphics.

* **System/DevOps:** * Chuyên Build System (Yocto/Buildroot), CI/CD, OTA Update.

---

# 3. Lời khuyên cho người mới (Fresher)

1. **Đừng sợ tiếng Anh:** Tài liệu xịn toàn tiếng Anh.
2. **Đọc Code:** Hãy đọc code của Kernel (thư mục `drivers/staging` là nơi code dễ đọc nhất).
3. **Đóng góp:** Thử gửi một patch nhỏ cho cộng đồng Open Source.
4. **Kiên nhẫn:** Embedded Linux cần thời gian "thấm", không nhanh như Web/App được.

---

# CHÚC MỪNG CÁC BẠN ĐÃ TỐT NGHIỆP!

## Hành trình mới chỉ bắt đầu...

> *"Stay Hungry, Stay Foolish"*
> Hẹn gặp lại các đồng nghiệp tương lai!
