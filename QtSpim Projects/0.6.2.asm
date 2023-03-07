.data
DIM=4

message_in:		.asciiz	"Inserisci numeri\n"
message_out:	.asciiz	"Numeri inseriti\n"
space:			.ascii	" ; "
wRes:			.space	20

		.text
		.globl main
		.ent main

main:	
		la		$a0, message_in				#salva messaggio_in in $a0
		li		$v0, 4						#$v0, 4: comando stampa stringa
		syscall
		
		la		$t0, wRes
		li		$t1, 0
		
for:	
		li		$v0, 5						#$v0, 5: comando lettura intero
		syscall								#risultato in $v0
		sw		$v0, ($t0)					#salva il risultato in $t0
		beq		$t1, DIM, print_m			#if
		addi	$t1, $t1, 1					#contatore ++
		addi	$t0, $t0, 4					#indirizzo successivo
		j		for

print_m:	
		la		$a0, message_out			#salva messaggio_out in $a0
		li		$v0, 4						#$v0, 4: comando stampa stringa
		syscall
		
		la		$t0, wRes					#indirizzo vettore
		li		$t1, 0						#azzero contatore

ciclo_print:
		li		$v0, 1						#$v0, 1: comando stampa intero
		lw		$a0, ($t0)					#$a0: registro con cosa stampare
		syscall
		
		beq		$t1, DIM, done				#if
		la		$a0, space					#stampa " ; "
		li		$v0, 4
		syscall
		
		addi	$t1, $t1, 1					#contatore ++
		addi	$t0, $t0, 4					#indirizzo successivo
		j		ciclo_print
		
done:
		nop									#funzione che non fa niente
		
		li		$v0, 10
		syscall
		
		.end main