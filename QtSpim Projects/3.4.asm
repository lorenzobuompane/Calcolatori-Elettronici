.data
DIM = 3

	.text
	.globl main
	.ent main
	
main:
	li $t0, DIM
	li $t1, 0		#accumulatore
	li $t2, 0
	
ciclo:
	beq $t1, $t0, done
	li $v0, 5
	syscall
	add $t2, $t2, $v0
	addi $t1, $t1, 1
	j ciclo

done:
	div $t2, $t2, $t0
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main