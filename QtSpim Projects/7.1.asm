.data

	.text
	.globl main
	.ent main

main:
	li $t0, 15
	addi $sp, $sp, -4
	sw $t0, ($sp)
	
	li $t1, 16
	addi $sp, $sp, -4
	sw $t1, ($sp)
	
	li $t2, 17
	addi $sp, $sp, -4
	sw $t2, ($sp)
	
	li $t3, 18
	addi $sp, $sp, -4
	sw $t3, ($sp)
	
	
	li $s0, 223
	addi $sp, $sp, -4
	sw $s0, ($sp)
	
	li $s1, 224
	li $s2, 225
	li $s3, 226
	
	jal somma
	
	lw $t4, ($sp)
	lw $t3, 20($sp)
	lw $t2, 24($sp)
	lw $t1, 28($sp)
	lw $t0, 32($sp)
	

done:
	li $v0, 10
	syscall
	.end main
	
somma:
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	
	addi $sp, $sp, -4
	sw $s1, ($sp)
	
	addi $sp, $sp, -4
	sw $s2, ($sp)
	
	addi $sp, $sp, -4
	sw $s3 ($sp)
	
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	
	lw $t2, 28($sp)
	lw $s2, 12($sp)
	
	add $v0, $t2, $s2
	
	addi $sp, $sp, -4
	sw $v0, ($sp)
	
	lw $s3, 4($sp)
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	
	jr $ra
	
	
	
	
	