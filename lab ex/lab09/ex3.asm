#Laboratory Exercise 9, Sample Code 3
.text
li $s0,5		#$s0 = 5
li $s1,6		#s1 = 6
push: addi $sp,$sp,-8 	#t?o 2 ng?n b? nh? trong stack
 sw $s0,4($sp) 		#l?u $s0 v�o stack
 sw $s1,0($sp) 		#l?u $s1 v�o stack
work: nop
 nop 
 nop
pop: lw $s0,0($sp) 	#l?y gi� tr? t? stack l?u v�o $s0
 lw $s1,4($sp) 		#l?y gi� tr? t? stack l?u v�o $s1
 addi $sp,$sp,8 	#tr? con tr? stack v? v? tr� ban ??u
 
 
 
 