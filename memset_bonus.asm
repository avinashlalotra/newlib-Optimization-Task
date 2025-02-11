.section .text
.global memset_bonus

memset_bonus: # a0 = ptr, a1 = value, a2 = size
    beqz a2, end      # If n == 0, return
    mv t1, a0         # Copy ptr to t1

    # Create 32-bit pattern
    slli s4, a1, 8
    or s4, s4, a1
    slli s4, s4, 16
    or s4, s4, a1

    # Misalignment handling
    andi s3, t1, 3    # Check alignment (t1 % 4)
    beqz s3, word_loop # If already aligned, jump to word loop

align_loop:
    sb a1, 0(t1)      # Store one byte
    addi t1, t1, 1    # Increment pointer
    addi a2, a2, -1   # Decrement count
    andi s3, t1, 3    # Check alignment
    bnez s3, align_loop # Repeat until aligned
    beqz a2, end      # If size is exhausted, return

# Word store loop
word_loop:
    srli s1, a2, 2    # Number of full words (n / 4)
    andi s2, a2, 3    # Remaining bytes (n % 4)
    beqz s1, byte_loop # If no words to write, jump to byte loop

word_store:
    sw s4, 0(t1)      # Store 4 bytes
    addi t1, t1, 4    # Increment pointer
    addi s1, s1, -1   # Decrement word count
    bnez s1, word_store # Repeat until all words are stored

# Byte copy loop (for remaining bytes)
byte_loop:
    beqz s2, end      # If no remaining bytes, return

byte_store:
    sb a1, 0(t1)      # Store one byte
    addi t1, t1, 1    # Increment pointer
    addi s2, s2, -1   # Decrement count
    bnez s2, byte_store # Repeat until all bytes are stored

end:
    ret

