.data
DIM=4
Vett:	.space	20
Min:	.space	4
mIn:	.asciiz	"Inserire numeri:\n"
mOut:	.asciiz	"Valore minimo:\n"

	.text
	.globl main
	.ent main
	
main:
		la		$t0, Vett
		li		$t1, 0				#CONTATORE
		
		la		$a0, mIn
		li		$v0, 4
		syscall
		
for:	
		li		$v0, 5
		syscall
		sw		$v0, ($t0)
		beq		$t1, DIM, azz
		addi	$t1, $t1, 1
		addi	$t0, $t0, 4
		j		for

azz:
		li		$t1, 0				#Azzero CONTATORE	(primo numero letto fuori dal ciclo)
		la		$t0, Vett			#Azzero INDIRIZZO
		lw		$t2, ($t0)
		
val_min:
		beq		$t1, DIM, done
		addi	$t0, $t0, 4
		addi	$t1, $t1, 1
		lw		$t3, ($t0)			#Cella successiva
		blt		$t2, $t3, val_min
		lw		$t2, ($t0)
		j		val_min
		
done:
		la		$a0, mOut
		li		$v0, 4
		syscall
		
		sw		$t2, Min
		
		li		$v0, 1
		lw		$a0, Min
		syscall
		
		li		$v0, 10
		syscall
		
		.end main
		
		
		