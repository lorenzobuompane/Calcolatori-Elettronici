.data

	.text
	.globl main
	.ent main
	
main:
	li $a0, 6
	li $a1, 3
	
	jal combina
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main
	
combina:
	move $t0, $a0
	move $t2, $a0
	sub $t4, $a0, $a1
	
	move $t1, $a1
	move $t3, $a1
	
	nominatore:
		addi $t2, $t2, -1
		beq $t2, $t4, denominatore
		multu $t0, $t2
		mflo $t0
		j nominatore
	
	denominatore:
		addi $t3, $t3, -1
		beq $t3, 0, jump
		multu $t1, $t3
		mflo $t1
		j denominatore
		
	jump:
		divu $t0, $t1
		mflo $v0
		
		jr $ra