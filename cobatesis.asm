.data
input: .asciiz "1048575"
debug: .word 0x12345678
debug_len: .word 0x00000008

.text
.globl main
main: 
	and $t0, $t0, $zero
	and $t1, $t1, $zero
	and $t2, $t2, $zero
	and $t3, $t3, $zero
	and $t4, $t4, $zero
	and $t5, $t5, $zero
	and $t6, $t6, $zero
	and $t7, $t7, $zero
	and $t8, $t8, $zero
	and $t9, $t9, $zero
         
word2bcd:
	and $t1, $t1, $zero
	lb  $t1, input($t9)
	beqz $t1, set_len_const
	
	add $t9, $t9, 1
	and $t1, $t1, 0x0000000f
	sll $t2, $t2, 4
	add $t2, $t2, $t1
	j word2bcd
	
set_len_const:
	add $t8, $t9, -1
	mul $t8, $t8, 4
	mul $k0, $t9, 4
	add $k1, $k0, -1
	
clear_cont:
	andi $t0, $t2, -1
	add $t8, $t9, -1
	mul $k0, $t9, 4
	mul $t8, $t8, 4
	and $t2, $t2, $zero
	and $t1, $t1, $zero
	and $t7, $t7, $zero
	
bcd2bin:
	beq $t6, $k0, exit
	
	andi $t1, $t0, 0x00000001
	sllv $t1, $t1, $k1
	srl $t5, $t5, 1
	add $t5, $t1, $t5
	and $t1, $t1, $zero
	srl $t0, $t0, 0x00000001
	
	j check8s
	return:
	and $t7, $t7, $zero
	
	addi, $t6, $t6, 0x00000001
	j bcd2bin

check8s:
	beq $t7, $t9, return
	and $t1, $t0, 0x0000000f
	blt $t1, 8, after
		addi $t1, $t1, -3
	after:
	srl $t0, $t0, 4
	sllv $t1, $t1, $t8
	add $t0, $t0, $t1

clear_repeat:
	and $t1, $t1, $zero
	and $t2, $t2, $zero
	addi $t7, $t7, 0x00000001
	j check8s
	
exit:
	
      
