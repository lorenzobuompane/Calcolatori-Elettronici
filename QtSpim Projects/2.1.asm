.data
pari:		.asciiz "pari"
dispari:	.asciiz "dispari"
	.text
	.globl main
	.ent main
	
main:
		li		$v0, 5
		syscall
		andi	$t0, $v0, 1
		
		la		$a0, pari
		
		beq		$t0, $zero, salto
		la		$a0, dispari
		
salto:	li		$v0, 4
		syscall
		
		li		$v0, 10
		syscall
		.end main