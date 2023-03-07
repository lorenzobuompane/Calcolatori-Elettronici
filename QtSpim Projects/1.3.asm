.data
op1:	.byte 150
op2:	.byte 100
	
	.text
	.globl main
	.ent main
	
main:
		lbu	$t0, op1					#devo usare load byte unsigned perchè con solo load byte mi va mettere il segno quindi i numeri rappresentabili vanno da -126 a 126 (non so se il numero è quello esatto)
		lb	$t1, op2
		add	$a0, $t0, $t1
		
		li	$v0, 1
		syscall
		
		
		li $v0, 10
		syscall
		.end main