.data

opa: .word 2043
opb: .word 5
res: .space 4
msg_scelta: .asciiz "Inserire un numero da 0 a 3:\n"
tab: .word somma, sottrazione, moltiplicazione, divisione

	.text
	.globl main
	.ent main
	
main: 
		la $a0, msg_scelta
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		move $t1, $v0		#scelta

		lw $t4, opa
		lw $t5, opb
		
		la $t0, tab			#indirizzo delle tabelle
		sll $t2, $t1, 2		#traduco il numero scelto in indirizzo
		add $t2, $t2, $t0	#salvo in $t2 l'indirizzo dove deve saltare
		lw $t3, ($t2)
		jr $t3
	
somma: 
		add $t6, $t4, $t5
		j done
		
sottrazione:
		sub $t6, $t4, $t5
		j done
		
moltiplicazione:
		mul $t6, $t4, $t5
		j done
		
divisione:
		div $t6, $t4, $t5
		j done		

done:	
		sw $t6, res
		li $v0, 10
		syscall