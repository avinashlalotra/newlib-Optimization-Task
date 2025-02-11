.section .text
.global memset
memset: # a0=ptr, a1=x, a2=n
    mv t1, a0             # t1 = pointer
    beqz a2, end          # Early exit if size=0

    # Expand byte x to 32-bit

    slli t2, a1, 8    
    or t2, t2, a1         
    slli t3, t2, 16    
    or t2, t2, t3         

    srli t3, a2, 2        # t3 = units (n / 4)
    andi a2, a2, 3         # a2 = bytes (n % 4)

word_loop:
    beqz t3, byte_loop    # Skip if no units left
    sw t2, 0(t1)          # Store 4-byte pattern
    addi t1, t1, 4        # Increment pointer by 4
    addi t3, t3, -1       # Decrement unit counter
    j word_loop

byte_loop:
    beqz a2, end          # Exit if no bytes left
    sb a1, 0(t1)          # Store remaining bytes
    addi t1, t1, 1
    addi a2, a2, -1
    j byte_loop

end:
    ret
