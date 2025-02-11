#include <stdio.h>
#include <string.h>

extern void *memset(void *ptr, int x, size_t n);  

void test_memset() {
    // Test 1: Test with a small array
    char buffer[10];
    memset(buffer, 'A', 10);
    
    // Print the buffer and check if it's filled with 'A'
    printf("Buffer after memset (10 bytes):\n");
    for (int i = 0; i < 10; i++) {
        printf("%c ", buffer[i]);
    }
    printf("\n");

    // Test 2: Test with a larger array
    char buffer2[50];
    memset(buffer2, 'B', 50);

    // Print the buffer and check if it's filled with 'B'
    printf("Buffer2 after memset (50 bytes):\n");
    for (int i = 0; i < 50; i++) {
        printf("%c", buffer2[i]);
    }
    printf("\n");

    // Test 3: Test with 0 bytes (edge case)
    char buffer3[20];
    memset(buffer3, 'C', 0);

    // Print the buffer and check if it's untouched
    printf("Buffer3 after memset (0 bytes):\n");
    for (int i = 0; i < 20; i++) {
        printf("%c ", buffer3[i]);
    }
    printf("\n");

    // Test 4: Test with a large value of n
    char buffer4[1000];
    memset(buffer4, 'D', 1000);

    // Check the first 10 bytes to verify
    printf("Buffer4 after memset (1000 bytes):\n");
    for (int i = 0; i < 10; i++) {
        printf("%c ", buffer4[i]);
    }
    printf("\n");
}

int main() {
    test_memset();  // Run the tests
    return 0;
}
