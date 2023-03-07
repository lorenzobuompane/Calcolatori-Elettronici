.data
num:	.half 1979

		.text
		.globl main
		.ent main
		
main:
		lh 		$t0, num
		li 		$t1, 1
		and		$t3, $0, $0    		# azzero risultato
		and		$t4, $0, $0   		# azzero indice
ciclo:  
		and		$t2, $t0, $t1
		beq		$t2, 0, next
		addi	$t3, $t3, 1
next:   	
		sll 	$t1, $t1, 1
		addi 	$t4, $t4, 1
		bne 	$t4, 16, ciclo          
		
		move 	$a0, $t3      		# stampa risultato
		li 		$v0, 1
		syscall
		
		li 		$v0, 10
		syscall
		.end main