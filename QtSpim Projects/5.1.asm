.data
num:	.word 3141592653
	.text
	.globl main
	.ent main
	
main:
	lw $t0, num
	li $t1, 10
	li $t3, 0			#accumulatore
	
	j ciclo
	
ciclo:
	divu $t0, $t1
	mfhi $t2			#resto
	mflo $t0			#quoziente
	beq $t2, 0, print
	
		#stack push
	subu $sp, $sp, 4
	sw $t2, ($sp)
	
	addi $t3, $t3, 1	#accumulatore++
		
	j ciclo

print:
	beq $t3, 0, done
	
		#stack pop
	lw $t0, ($sp)
	addu $sp, $sp, 4
	
	addi $t3, $t3, -1	#accumulatore--
	
	addi $a0, $t0, '0'
	li $v0, 11
	syscall
	
	j print
		
done:
	li $v0, 10
	syscall
		
	.end main