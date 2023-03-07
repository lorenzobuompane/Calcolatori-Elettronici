.data	
wVar:	.word	3			#di solito metto w davanti a una variabile WORD mentre b se è BYTE

		.text
		.globl main
		.ent main
		
main:

		li 	$t0, 10
		sw 	$t0, wVar
		
		li	$v0, 10
		syscall
		
		.end main
		
		