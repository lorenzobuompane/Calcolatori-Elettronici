.data

msg_err:	.asciiz	"\nil carattere inserito non e' un numero\n"
msg_inv:	.asciiz "inserito carattere a capo, fine\n"

	.text
	.globl main
	.ent main
	
main:	
		
read:	li	$v0, 12
		syscall
		beq	$v0, '\n', done
		blt	$v0, 48, error
		bgt	$v0, 57, error
		j 	read
	
error:	la	$a0, msg_err
		li	$v0, 4
		syscall
		j 	read
		
done:	la	$a0, msg_inv
		li	$v0, 4
		syscall
		li 	$v0, 10
		syscall
		
	.end main