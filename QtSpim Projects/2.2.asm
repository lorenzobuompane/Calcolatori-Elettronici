.data
stringerror:	.asciiz "Errore"

	.text
	.globl main
	.ent main
	
main:
		li		$v0, 5
		syscall
		move	$t0, $v0
		
		li		$v0, 5
		syscall
		move	$t1, $v0
		
		li		$t2, 256
		
		bge		$t0, $t2, errore
		bge		$t1, $t2, errore
		
		xor		$t3, $t0, $t1
		nor		$t1, $t1, $t1
		and		$t0, $t0, $t1
		nor		$t0, $t0, $t0
		or		$t3, $t0, $t1
		
		li		$t4, 0xFFFFFF00		#CORRETTO DALL'ALTRO ESERCITATORE
		and		$t3, $t3, $t4
		move	$a0, $t3
		li		$v0, 1
		syscall
		
		j		done
		
errore:
		la		$a0, stringerror
		li		$v0, 4
		syscall
		
		j		done
		
done:	
		li		$v0, 10
		syscall
		
		.end main