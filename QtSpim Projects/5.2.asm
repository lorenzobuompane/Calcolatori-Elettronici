.data
msg_ins:	.asciiz "Inserire caratteri:\n"
msg_Pal:	.asciiz "PALINDROMA\n"
msg_noPal:	.asciiz "NON PALINDROMA\n"

	.text
	.globl main
	.ent main
	
main:
	li $t1, 0			#nElementi++
	li $v0, 4			#messaggio inserimento elementi
	la $a0, msg_ins
	syscall

lettura:	
	li $v0, 12			#lettura elemento
	syscall
	beq $v0, '\n', countDiv2	#all'invio inizia la verifica
	subu $sp, $sp, 4	#creo lo spazio nello stack
	sw $v0, ($sp)		#scrivo
	addi $t1, $t1, 1	#nElementi++
	j lettura
	
countDiv2:
	srl $t2, $t1, 1		#counter (nElementi/2)

verifica:
	lw $t0, ($sp)		#leggo primo del confronto
	addi $t5, $t1, -1	#
	sll $t3, $t5, 2		#calcolo offset
	addu $sp, $sp, $t3
	lw $t4, ($sp)
	beq $t2, 0, Pal
	bne $t0, $t4, noPal
	addi $t2, $t2, -1
	addi $t1, $t1, -2
	j verifica
	
noPal:
	la $a0, msg_noPal
	li $v0, 4
	syscall
	j done

Pal:
	la $a0, msg_Pal
	li $v0, 4
	syscall
	j done
	
done:
	li $v0, 10
	syscall
	.end main
	