#include <stdio.h>
#include <sys/utsname.h>

int main(void) {
    struct utsname sys_info;
    
    printf("=================================\n");
    printf("Hello from ARM Embedded Linux!\n");
    printf("=================================\n\n");
    
    // Get system information
    if (uname(&sys_info) == 0) {
        printf("System Information:\n");
        printf("  OS Name    : %s\n", sys_info.sysname);
        printf("  Node Name  : %s\n", sys_info.nodename);
        printf("  Release    : %s\n", sys_info.release);
        printf("  Version    : %s\n", sys_info.version);
        printf("  Machine    : %s\n", sys_info.machine);
    } else {
        printf("Failed to get system information\n");
    }
    
    printf("\n✅ Lab 01 completed successfully!\n");
    
    return 0;
}
