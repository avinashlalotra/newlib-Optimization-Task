
.section .text
.global memset_asm
memset_asm: # a0=ptr, a1=x, a2=n
    mv t1, a0
    beqz a2, 2f

    # Create 32-bit pattern 
    andi s2, a2, 3  # s2 = n % 4 
    srli s1, a2, 2  # s1 = n / 4  

    # Expand byte x to 32-bit
    slli s4, a1, 8
    or s4, s4, a1
    slli s4, s4, 16
    or s4, s4, a1

    beqz s1, byte   # If no words, go to byte loop

1:  # Word copy loop
    sw s4, 0(t1)
    addi t1, t1, 4
    addi s1, s1, -1
    bnez s1, 1b

byte:
    beqz s2, 2f  # If no remaining bytes, return

3:  # Byte copy loop
    sb a1, 0(t1)
    addi t1, t1, 1
    addi s2, s2, -1
    bnez s2, 3b

2:  
    ret
