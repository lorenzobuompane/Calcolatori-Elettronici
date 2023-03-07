.data
vettrig: .word 12, 56, 1, -5
vettcol: .word -51, 11, 0, 4

NUM_ELEM = 4
DIM = 4 * NUM_ELEM

matrice: .space DIM * NUM_ELEM

	.text
	.globl main
	.ent main

main:
	li $t0, 0			#offset matrice
	li $t1, 0			#contatore riga

ciclorig:
	lw $t3, vettrig($t1)
	li $t2, 0			#contatore colonne

ciclocol:
	lw $t4, vettcol($t2)
	mult $t3, $t4
	mflo $t4
	mfhi $t5
	
	sw $t4, matrice($t0)
	addi $t0, $t0, 4
	addi $t2, $t2, 4
	blt $t2, DIM, ciclocol
	addi $t1, $t1, 4
	blt $t1, DIM, ciclorig
	j done

done:
	li $v0, 10
	syscall
	.end main