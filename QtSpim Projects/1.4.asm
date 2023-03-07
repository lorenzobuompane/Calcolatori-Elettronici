.data
var:	.word 0x3FFFFFF0
	.text
	.globl main
	.ent main
	
main:
		lw		$t0, var
		sll		$t1, $t0, 1
		move	$a0, $t1
		li		$v0, 1
		syscall
		
		addiu	$t2, $t1, 40
		move	$a0, $t2
		li		$v0, 1
		syscall
		
		li		$t3, 40
		addu	$t4, $t1, $t3
		move	$a0, $t4
		li		$v0, 1
		syscall						#NON è POSSIBILE SCRIVERE UN RISULTATO NUMERICO
		
		li		$v0, 10
		syscall
		.end main