.data
msg: .asciiz "buoncompleanno"
	.text
	.globl main
	.ent main
	
main:
		li $t0, 'A'
		li $t1, 'a'
		sub $t1, $t0, $t1
		la $t0, msg		
		
ciclo:
		lb $a0, ($t0)
		addi $t0, $t0, 1
		beqz $a0, done
		jal shift
		
		move $a0, $v0
		la $v0, 11
		syscall
		j ciclo
		
done:
		li $v0, 10
		syscall
		.end main
		
shift:
		add $v0, $a0, $t1
		jr $ra