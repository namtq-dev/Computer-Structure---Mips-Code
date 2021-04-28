#Laboratory Exercise 9, Sample Code 3
.text
li $s0,5		#$s0 = 5
li $s1,6		#s1 = 6
push: addi $sp,$sp,-8 	#t?o 2 ng?n b? nh? trong stack
 sw $s0,4($sp) 		#l?u $s0 vào stack
 sw $s1,0($sp) 		#l?u $s1 vào stack
work: nop
 nop 
 nop
pop: lw $s0,0($sp) 	#l?y giá tr? t? stack l?u vào $s0
 lw $s1,4($sp) 		#l?y giá tr? t? stack l?u vào $s1
 addi $sp,$sp,8 	#tr? con tr? stack v? v? trí ban ??u
 
 
 
 