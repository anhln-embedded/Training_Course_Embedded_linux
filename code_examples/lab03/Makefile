# 1. Khai báo biến
# Cho phép truyền CROSS_COMPILE từ bên ngoài vào, mặc định là rỗng (Native)
CC = $(CROSS_COMPILE)gcc

# CFLAGS: Các cờ biên dịch (-I chỉ định đường dẫn tìm file .h, -Wall bật cảnh báo)
CFLAGS = -I./include -Wall

# 2. Quản lý File
# wildcard: Tự động quét và lấy tất cả các file .c trong thư mục src/
SRCS = $(wildcard src/*.c)

# Thay thế đuôi .c của SRCS thành đuôi .o
OBJS = $(SRCS:.c=.o)

# Tên file thực thi đầu ra
TARGET = my_calculator

# 3. Các quy tắc (Rules)
all: $(TARGET)

# Liên kết (Linking) các file .o thành file thực thi
$(TARGET): $(OBJS)
	$(CC) -o $@ $^
	@echo "Build complete: $@"

# Biên dịch (Compilation) từng file .c thành .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Dọn dẹp
clean:
	rm -f src/*.o $(TARGET)
	@echo "Cleaned generated files!"
