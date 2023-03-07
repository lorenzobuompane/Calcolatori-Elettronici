.data
		DIM=15
wVett:	.word	2, 5, 16, 12, 34, 7, 20, 11, 31, 44, 70, 69, 2, 4, 23
wResult:	.space	4
	
		.text
		.globl main
		.ent main

main:	
		la 		$t0, wVett
		li		$t1, 0			#ACCUMULATORE
		li		$t3, DIM		#CONTATORE
		
for:	
		beq		$t3, 0, done
		lw		$t2, ($t0)		#VALORE
		add		$t1, $t1, $t2	#SOMMA
		addi	$t3, $t3, -1	#Contatore --
		addi	$t0, $t0, 4		#Indizzo successivo
		j		for
		
done:	
		sw		$t1, wResult
		
		li		$v0, 10
		syscall
		
		.end main
		
		
		
		