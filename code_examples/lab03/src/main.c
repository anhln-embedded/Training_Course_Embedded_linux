#include <stdio.h>
#include "calculation.h"

int main() {
    printf("=== FUNCTION POINTER IN C ===\n");

    // Khai báo một con trỏ hàm tên là 'operation'
    // Con trỏ này trỏ tới bất kỳ hàm nào nhận 2 số int và trả về 1 số int
    int (*operation)(int, int);

    // 1. Trỏ con trỏ hàm vào hàm cộng (add)
    operation = add;
    printf("Phep cong (Add): 10 + 5 = %d\n", operation(10, 5));

    // 2. Thay đổi hướng trỏ của con trỏ hàm vào hàm trừ (sub)
    operation = sub;
    printf("Phep tru (Sub) : 10 - 5 = %d\n", operation(10, 5));

    return 0;
}
