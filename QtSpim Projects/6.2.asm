.data
asterisco: .asciiz "*"
acapo: .asciiz "\n"
dim: .asciiz "Inserire numero della dimensione:\n"

	.text
	.globl main
	.ent main
	
main:
		la $a0, dim
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		move $t2, $v0
		move $a0, $t2
		jal stampaTriangolo
		move $a0, $t2
		jal stampaQuadrato
		
		li $v0, 10
		syscall
		.end main

stampaTriangolo:
		li $t0, 0
		move $t3, $a0
		
	rigaT:
		addi $t0, $t0, 1
		li $t1, 0
		add $t1, $t1, $t0
		
		colonnaT:
			addi $t1, $t1, -1
			la $a0, asterisco
			li $v0, 4
			syscall
			bne $t1, 0, colonnaT
			la $a0, acapo
			li $v0, 4
			syscall
			blt $t0, $t3, rigaT
			la $a0, acapo
			li $v0, 4
			syscall
			jr $ra
		
stampaQuadrato:
		li $t0, 0
		move $t3, $a0
		
	rigaQ:
		addi $t0, $t0, 1
		li $t1, 0
		
		colonnaQ:
			addi $t1, $t1, 1
			la $a0, asterisco
			li $v0, 4
			syscall
			bne $t1, $t3, colonnaQ
			la $a0, acapo
			li $v0, 4
			syscall
			blt $t0, $t3, rigaQ
			jr $ra