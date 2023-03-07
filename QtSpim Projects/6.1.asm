.data
asterisco: .asciiz "*"
acapo: .asciiz "\n"
DIM = 8
	.text
	.globl main
	.ent main
	
main:
		jal stampaTriangolo
		la $a0, acapo
		li $v0, 4
		syscall
		jal stampaQuadrato
		
		li $v0, 10
		syscall
		.end main

stampaTriangolo:
		li $t0, 0
		
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
			blt $t0, DIM, rigaT
			jr $ra
		
stampaQuadrato:
		li $t0, 0
		
	rigaQ:
		addi $t0, $t0, 1
		li $t1, 0
		
		colonnaQ:
			addi $t1, $t1, 1
			la $a0, asterisco
			li $v0, 4
			syscall
			bne $t1, DIM, colonnaQ
			la $a0, acapo
			li $v0, 4
			syscall
			blt $t0, DIM, rigaQ
			jr $ra