.data
input: .asciiz "69687"
text_exception: .asciiz "Valor fuera de limites: El string de entrada puede tener 8 caracters como maximo y debe ser finalizado por un terminador (null char)"

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
         
str2bcd:
	and $t1, $t1, $zero
	lb  $t1, input($t9)
	beqz $t1, set_len_const
	beq $t9, 8, illegall_input_exception
	
	add $t9, $t9, 1
	and $t1, $t1, 0x0000000f
	sll $t2, $t2, 4
	add $t2, $t2, $t1
	j str2bcd
	
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
	andi $t1, $t0, 1
	sllv $t1, $t1, $k1
	srl $t5, $t5, 1
	add $t5, $t1, $t5
	and $t1, $t1, $zero
	srl $t0, $t0, 1
	
	j check8s
	return:
	and $t7, $t7, $zero
	
	addi, $t6, $t6, 1
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
	
	and $t1, $t1, $zero
	and $t2, $t2, $zero
	addi $t7, $t7, 1
	j check8s

illegall_input_exception:
	addi $v0, $zero, 4
	la $a0, text_exception
	syscall 
	j exit	
exit:
	add $v0, $zero, 10
	syscall
      
