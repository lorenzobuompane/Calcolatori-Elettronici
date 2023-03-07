.data
vett: .space 80

	.text
	.globl main
	.ent main
	
main:	
		la $t0, vett
		li $t1, 1		
		sw $t1, ($t0)	#primo elemento del vettore
		
		addi $t0, $t0, 4
		sw $t1, ($t0)	#secondo elemento del vettore
		
		li $t6, 2		#indice
		
ciclo:
		beq $t6, 20, done 
		
		lw $t2, ($t0)
		addi $t3, $t0, -4	#-2
		lw $t4, ($t3)
		
		add $t5, $t2, $t4
		addi $t0, $t0, 4
		sw $t5, ($t0)
		
		addi $t6, $t6, 1
		j ciclo
		
done:	li $v0, 10
		syscall
		
		.end main