.data
stringa: .asciiz "Inserire numero: \n"

	.text
	.globl main
	.ent main

main:
	la $a0, stringa
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	jal sequenzaDiCollatz
	
	move $a0, $v0
	li $v0, 1
	syscall

done:
	li $v0, 10
	syscall
	.end main
	
sequenzaDiCollatz:
	li $t2, 1		#contatore
	ciclo:
		beq $a0, 1, fineCollatz
		addi $sp, $sp, -4	#salvo il registro $ra nello stack
		sw $ra, ($sp)
		addi $t2, $t2, 1
		jal calcolaSuccessivo
		lw $ra, ($sp)
		addi $sp, $sp, 4
		move $a0, $v0	
		j ciclo
	
	fineCollatz:
		move $v0, $t2
		jr $ra
	
calcolaSuccessivo:
	li $t1, 2
	div $a0, $t1
	mfhi $t0
	beq $t0, 0, pari
	beq $t0, 1, dispari
	pari:
		mflo $v0
		j ret
	dispari:
		mul $v0, $a0, 3
		addi $v0, $v0, 1
		j ret
	ret:	
		jr $ra	