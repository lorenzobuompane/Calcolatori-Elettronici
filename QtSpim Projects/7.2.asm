.data

	.text
	.globl main
	.ent main

main:
	li $a0, 6
	jal calcolaSuccessivo
	

done:
	li $v0, 10
	syscall
	.end main
	
calcolaSuccessivo:
	li $t1, 2
	div $a0, $t1
	mfhi $t0
	beq $t0, 0, pari
	beq $t0, 1, dispari
		pari:
			div $a0, $t1
			mflo $v0
			j stampa
		dispari:
			mul $v0, $a0, 3
			addi $v0, $v0, 1
			j stampa
stampa:
	move $a0, $v0
	li $v0, 1
	syscall
	move $v0, $a0
	
	jr $ra