.data
DIM=6
anni: .word 1945, 2008, 1800, 2006, 1748, 1600
risultato: .space DIM

	.text
	.globl main
	.ent main

main:
	la $a0, anni
	la $a1, risultato
	li $a2, DIM
	
	jal bisestile

done:
	li $v0, 10
	syscall
	.end main
	
bisestile:
	li $t0, 0
	
	cicloVettore:
		beq $t0, DIM, fatto:
		addi $t0, $t0, 1
		
		lw $t1, ($a0)
		