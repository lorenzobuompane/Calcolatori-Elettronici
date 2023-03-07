.data
res:	.space 4
day:	.byte 231		#utilizzare gli unsigned su 32 bit 
hour:	.byte 16
minute:	.byte 47

	.text
	.globl main
	.ent main

main:
		lbu $t0, day
		mul $t1, $t0, 24
		lbu $t0, hour
		addu $t1, $t0, $t1
		mul $t1, $t1, 60
		lbu $t0, minute
		addu $t1, $t1, $t0
		sw $t1, res
		li $v0, 10
		syscall
		.end main