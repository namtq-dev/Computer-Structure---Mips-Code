.data
max_pos:	.asciiz "The largest element is stored in $s"
min_pos:	.asciiz "The smallest element is stored in $s"
inform_max:	.asciiz "Largest value is "
inform_min: 	.asciiz "Smallest value is "
.text
main:
#load test input 	
li $s0, 112
li $s1, 10
li $s2, 25
li $s3, 13
li $s4, -309
li $s5, 568
li $s6, -5
li $s7, 69
jal start 			# call start procedure

#output
li $v0, 56		
la $a0, max_pos			# print max element position
add $a1,$t8,$zero
syscall
la $a0, inform_max		# print max value
add $a1,$t0,$zero
syscall	
la $a0, min_pos			# print min element position
add $a1,$t9,$zero
syscall
la $a0, inform_min		# print min value
add $a1,$t1,$zero
syscall
exit:
li $v0, 10			# exit program
syscall

start:	
add $fp,$sp,$zero		# frame pointer point to the top
addi $sp,$sp, -32		# adjust stack pointer
sw $s1, 0($sp)			# save $s1 register
sw $s2, 4($sp)			# save $s2 register
sw $s3, 8($sp)			# save $s3 register
sw $s4, 12($sp)			# save $s4 register
sw $s5, 16($sp)			# save $s5 register
sw $s6, 20($sp)			# save $s6 register
sw $s7, 24($sp)			# save $s7 register
sw $ra, 28($sp)			# save $ra for main procedure
add $t0,$s0,$zero		# $t0 store max value, set $t0 = $s0
add $t1,$s0,$zero		# $t1 store min value, set $t1 = $s0
li $t2, 0			# $t8 store current position, set $t2 = 0 
li $t8, 0			# $t8 store max position, set $t8 = 0 
li $t9, 0			# $t9 store min position, set $t9 = 0 

loop:
lw $t3,0($sp)			# pop from stack
addi $sp,$sp,4			# adjust stack pointer
beq $sp,$fp, done		# if all interger checked, done
addi $t2,$t2,1			# increase index
sub $t4,$t0,$t3			# cal Max - $t3
bltzal $t4, set_max		# if Max < $t3, swap Max
sub $t4,$t3,$t1			# cal $t3 - Min
bltzal $t4, set_min		# if $t3 < Min, swap Min
j loop				# repeat

set_max:
add $t0,$t3,$zero		# set max value = $t3
add $t8,$t2,$zero		# set max position = $t2
jr $ra
set_min:
add $t1,$t3,$zero		# set min value = $t3
add $t9,$t2,$zero		# set min position = $t2
jr $ra

done: 
lw $ra, -4($sp)		
jr $ra 				# return main
