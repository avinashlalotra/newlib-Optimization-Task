.section .text
.global memset
memset:
    mv t1, a0             # t1 = pointer
    beqz a2, end          # Early exit if size=0

    # Align pointer to 4 bytes if needed
    andi t0, t1, 3        
    beqz t0, aligned   

align_loop:
    sb a1, 0(t1)          
    addi t1, t1, 1        
    addi a2, a2, -1       
    andi t0, t1, 3        
    bnez t0, align_loop    
    beqz a2, end         

aligned:
    slli t3, a1, 8       
    or t3, t3, a1        
    slli t4, t3, 16      
    or t3, t3, t4         

    
    srli t2, a2, 2     
    andi a2, a2, 3       

word_loop:
    beqz t2, byte_loop  
    sw t3, 0(t1)          
    addi t1, t1, 4        
    addi t2, t2, -1       
    j word_loop

byte_loop:
    beqz a2, end          
    sb a1, 0(t1)          
    addi t1, t1, 1
    addi a2, a2, -1
    j byte_loop

end:
    ret
