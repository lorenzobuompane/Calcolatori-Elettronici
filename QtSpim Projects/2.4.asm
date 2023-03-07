.data
v1:	.word 10
v2:	.word 30 
v3:	.word 20
space: .asciiz " "
	.text
	.globl main
	.ent main
	
main:
		lw	$t0, v1
		lw	$t1, v2
		lw	$t2, v3
		
		blt	$t0, $t1, swap1
		move	$t3, $t0
		move	$t0, $t1
		move	$t1, $t3
swap1:
		blt	$t0, $t2, swap2
		move	$t3, $t0
		move	$t0, $t2
		move	$t2, $t3
swap2:
		blt	$t1, $t2, done
		move	$t3, $t2
		move	$t2, $t1
		move	$t1, $t3
done:
		move	$a0, $t0
		li		$v0, 1
		syscall
		la		$a0, space
		li		$v0, 4
		syscall
		move	$a0, $t1
		li		$v0, 1
		syscall
		la		$a0, space
		li		$v0, 4
		syscall
		move	$a0, $t2
		li		$v0, 1
		syscall
		
		li		$v0, 10
		syscall
		.end main
