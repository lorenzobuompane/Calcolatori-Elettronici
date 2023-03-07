.data
NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 0

prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space DIM

	.text
	.globl main
	.ent main

main:
	la $a0, prezzi
	la $a1, scontati
	li $a2, NUM
	li $a3, SCONTO
	li $t0, ARROTONDA
	subu $sp, 4
	sw $t0, ($sp)
	jal calcola_sconto
	
	#move $t1, $v0
	
	lw $t0, ($sp)
	addi $sp, $sp, 4

done:
	li $v0, 10
	syscall
	.end main
	
calcola_sconto:
	li $t0, NUM			#accumulatore

	
	ciclo:
		beq $t0, 0, fine
		addi, $t0, $t0, -1
		lw $t1, ($a0)
		mul $t1, $t1, $a3
		li $t2, 100
		div $t1, $t2
		lw $t3, ($sp)
		mflo $t4
		mfhi $t5
		beq $t3, 1, uno
		beq $t5, 0, arrotondato
		addi $t4, $t4, 1
		j arrotondato
		
		uno:
			li $t6, 50
			ble $t5, $t6, arrotondato
			addi $t4, $t4, 1
			j arrotondato
			
		arrotondato:
			lw $t1, ($a0)
			sub $t2, $t1, $t4
			add $t7, $t7, $t4
			addi $a0, $a0, 4
			sw $t2, ($a1)
			addi $a1, $a1, 4
			
			j ciclo
		
	fine:	
		move $v0, $t7
		jr $ra
		