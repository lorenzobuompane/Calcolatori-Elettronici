.data

msg_err:	.asciiz	"\nIl carattere inserito non e' un numero\n"
msg_inv:	.asciiz "\nIl numero inserito e': "
msg_over:	.asciiz "OVERFLOW"

	.text
	.globl main
	.ent main

main:	li	$t2, 0		#accumulatore
		li	$t3, 10		#n° 10

read:	li	$v0, 12
		syscall
		
ctrl:	beq	$v0, '\n', done
		blt	$v0, 48, error
		bgt	$v0, 57, error
		move	$t1, $v0			#AFFIUNGERE IL - '0' PERCHè AQCUISISCO COME CARATTERE E NON COME NUMERO
		mulu	$t2, $t2, $t3
		bne		$HI, 0, over_err
		add		$t2, $t2, $t1
		#CONTROLLO SULL'ADDIZIONE
		
		j 	read

char_err:	la	$a0, msg_err
			li	$v0, 4
			syscall
			j 	done
	
over_err:	la	$a0, msg_over
			li	$v0, 4
			syscall
			j 	done
			
print:	la		$a0, msg_inv
		li		$v0, 4
		syscall
		move	$v0, $t0
		li		$v0, 1
		syscall

done:	li 		$v0, 10
		syscall
		
	.end main