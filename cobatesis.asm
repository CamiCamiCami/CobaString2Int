.data
input: .asciiz "9232"

.text
.globl main
main: 
      lw $t0, input
      and $t2, $t2, $zero
      and $t7, $t7, $zero
      and $t6, $t6, $zero
      and $t5, $t5, $zero
                      
word2bcd:
	beq  $t7, 0x00000004, clearw2b
	and $t1, $t1, $zero
	andi $t1, $t0, 0x000000ff
	srl  $t0, $t0, 8
	andi $t1, $t1, 0x0000000f
	sll $t2, $t2, 4
	add $t2, $t2, $t1
	addi $t7, $t7, 0x00000001
	j word2bcd
	
clearw2b:
	andi $t0, $t2, 0xffffffff
	and $t2, $t2, $zero
	and $t1, $t1, $zero
	and $t7, $t7, $zero
	
bcd2bin:
	beq $t6, 16, exit
	j check8s
	return:
	and $t7, $t7, $zero
	andi $t1, $t0, 0x00000001
	sll $t1, $t1, 15
	srl $t5, $t5, 1
	add $t5, $t1, $t5
	
	and $t1, $t1, $zero
	srl $t0, $t0, 0x00000001
	addi, $t6, $t6, 0x00000001
	j bcd2bin

check8s:
	beq $t7, 0x00000004, return
	and $t1, $t0, 0x0000000f
	andi $t2, $t1, 0x00000008
	bgtz $t2, minus3
	j combine
	
	
minus3:
	addi $t1, $t1, 0xfffffffd
	j combine
	
combine:
	srl $t0, $t0, 4
	sll $t1, $t1, 12
	add $t0, $t0, $t1

clear_repeat:
	and $t1, $t1, $zero
	and $t2, $t2, $zero
	addi $t7, $t7, 0x00000001
	j check8s
	
exit:
	
      
