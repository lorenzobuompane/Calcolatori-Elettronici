.data

		.text
		.globl main
		.ent main
main:	
		li	$t0, 10
		li	$s0, 0xab		
		
		
		li $v0, 10
		syscall
		
		.end main