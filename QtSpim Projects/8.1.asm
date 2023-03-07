.data
X: .byte 1
Y: .byte 40
OraIngresso: .byte 12, 47		# 22,50	
OraUscita: .byte 18, 14			# 01,00
								#non sono 3 ore 10 minuti
								#ma 2 ore 10 minuti
	.text
	.globl main
	.ent main

main:
	la $a0, OraIngresso
	la $a1, OraUscita
	lbu $a2, X
	lbu $a3, Y
	
	jal costoParcheggio	
	
	
	move $t0, $v0
	
done:
	li $v0, 10
	syscall
	.end main
	
costoParcheggio:
	OffsetOre:
		lbu $t0, 0($a0)
		lbu $t1, 0($a1)
	
	calcoloOre:
		sub $t3, $t2, $t1
		mul $t3, $t3, 60
	
	OffsetMinuti:
		lbu $t0, 1($a0)
		lbu $t1, 1($a1)
	
	calcoloMinutiTotali:
		sub $t4, $t2, $t1
		add $t3, $t3, $t4	#minuti totali	

	divu $t3, $a3
	mflo $t1				#numero periodi
	mfhi $t2				#resto = inizio periodo successivo
	beq $t2, 0, calcolo
	addi $t1, $t1, 1
	j calcolo
	
	calcolo:
	mul $v0, $t1, $a2
	jr $ra
	
	
	
	
	
	
	
	
	