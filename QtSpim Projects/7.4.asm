.data
A1:	.word 1
A2: .word 2
B1: .word 3
B2: .word 4

	.text
	.globl main
	.ent main

main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	
	lw $a0, A1
	lw $a1, A2
	lw $a2, B1
	lw $a3, B2
	
	jal determinante
	
done:
	move $a0, $v0
	li $v0, 1
	syscall
	
	lw $ra, ($sp)
	addu $sp, 4
	jr $ra
	
determinante:
	mul $a0, $a0, $a3
	mul $a1, $a1, $a2
	sub $v0, $a0, $a1
	
	jr $ra