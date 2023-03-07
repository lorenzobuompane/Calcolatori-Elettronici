.data
vett: .word 1, 2, 4, 3, 2
DIM = 5
	.text
	.globl main
	.ent main
	
main:
	la $a0, vett
	li $a1, DIM
	
	jal massimo
	
	move $a0, $v0
	li $v0, 1
	syscall	
	
done:
	li $v0, 10
	syscall
	.end main
	
massimo:
	lw $v0, ($a0)	#carico valore
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	
	ciclo:
		lw $t0, ($a0)
		bgt $t0, $v0, switch
			cambiato:
			addi $a0, $a0, 4
			addi $a1, $a1, -1
			bne $a1, 0, ciclo
			jr $ra
		
		switch:
			move $v0, $t0
			j cambiato