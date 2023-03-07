.data
A1:	.word 1
A2: .word 2
A3: .word 3
B1: .word 4
B2: .word 5
B3: .word 6
C1: .word 7
C2: .word 8
C3: .word 9

	.text
	.globl main
	.ent main

main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	
	lw $a0, B2
	lw $a1, B3
	lw $a2, C2
	lw $a3, C3
	
	subu $sp, $sp, 4
	lw $t0, A1
	sw $t0, ($sp)
	
	subu $sp, $sp, 4
	lw $t0, A2
	sw $t0, ($sp)
	
	subu $sp, $sp, 4
	lw $t0, A3
	sw $t0, ($sp)
	
	subu $sp, $sp, 4
	lw $t0, B1
	sw $t0, ($sp)
	
	subu $sp, $sp, 4
	lw $t0, C1
	sw $t0, ($sp)
	
	jal determinante3x3
	
done:
	move $a0, $v0
	li $v0, 1
	syscall
	
	addu $sp, 24
	lw $ra, ($sp)
	jr $ra
	
determinante3x3:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	
	lw $t0, 20($sp)
	lw $t1, 8($sp)
	lw $t2, 4($sp)
	
	move $t3, $a0
	move $t4, $a1
	move $t5, $a2
	move $t6, $a3
	
	jal determinante2x2
	mul $t0, $t0, $v0
	
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	move $a2, $t5
	move $a3, $t6
	jal determinante2x2
	mul $t1, $t1, $v0
	
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	move $a2, $t3
	move $a3, $t4
	jal determinante2x2
	mul $t2, $t2, $v0
	
	add $t0, $t0, $t2
	sub $t0, $t0, $t1
	
	move $v0, $t0	
	
	lw $ra, ($sp)
	jr $ra
	
determinante2x2:
	mul $a0, $a0, $a3
	mul $a1, $a1, $a2
	sub $v0, $a0, $a1
	
	jr $ra