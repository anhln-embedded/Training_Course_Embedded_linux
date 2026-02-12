#include <stdio.h>
// Một biến toàn cục chưa khởi tạo (Sẽ nằm trong vùng nhớ BSS)
int global_uninitialized_var;

// Một biến toàn cục đã khởi tạo (Sẽ nằm trong vùng nhớ Data)
int global_initialized_var = 100;

// Một hàm tự định nghĩa
void do_something() {
    printf("Doing something important...\n");
}

int main() {
    printf("--- Embedded Linux Toolchain Demo ---\n");
    do_something();
    return 0;
}
