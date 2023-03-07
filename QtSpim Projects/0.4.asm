.data
wVett:	.word	5, 7, 3, 4
wResult:	.space	4
	
		.text
		.globl main
		.ent main

main:	
		
		li 		$t1, 0				#ACCUMULATORE
		la 		$t0, wVett			#INDIRIZZO Vettore
		lw 		$t2, ($t0)			#1
		add		$t1, $t1, $t2
		addi 	$t0, $t0, 4			#2
		lw		$t2, ($t0)
		add		$t1, $t1, $t2 
		addi	$t0, $t0, 4			#3
		lw		$t2, ($t0)
		add		$t1, $t1, $t2 
		addi	$t0, $t0, 4			#4
		lw		$t2, ($t0)
		add		$t1, $t1, $t2
		sw		$t1, wResult
		
		li		$v0, 10
		syscall
		
		.end main