.data 
input1: .asciiz "Enter the 1st number: " 
input2: .asciiz "\nEnter the 2nd number: " 
hexa1: .space 8
hexa2: .space 8 
hexa3: .space 8
hexa4: .space 8
output1: .asciiz "\nThe multiplication of " 
output2: .asciiz " base 10 (or "
output3: .asciiz " base 16) "
output4: .asciiz "and "
output5: .asciiz "is "

.text 
main: 

# Input 1st integer
li $v0, 4 
la $a0, input1 
syscall 
li $v0, 5 
syscall 
move $s1, $v0 		# Store 1st integer in $s1
add $t2, $s1, $zero
la $t3, hexa1
jal Convert_hexa	# Convert 1st number to hexa
li $v0, 4
la $a0, hexa1
syscall

# Input 2nd integer
li $v0, 4 
la $a0, input2 
syscall 
li $v0, 5 
syscall 
move $s2, $v0 		# Store 2nd integer in $s2
add $t2, $s2, $zero
la $t3, hexa2
jal Convert_hexa	# Convert 2nd number to hexa
li $v0, 4
la $a0, hexa2
syscall

# Multiply
mult $s1, $s2

mfhi $s3
mfhi $t2
la $t3, hexa3
jal Convert_hexa

mflo $s4
mflo $t2
la $t3, hexa4
jal Convert_hexa

Printf:
# The multiplication of
li $v0, 4
la $a0, output1
syscall
# integer 1
li $v0, 1
add $a0, $s1, $zero
syscall
# base 10 (or
li $v0, 4
la $a0, output2
syscall
# integer 1 in hexa
li $v0, 4
la $a0, hexa1
syscall
# base 16)
li $v0, 4
la $a0, output3
# and
syscall
li $v0, 4
la $a0, output4
syscall
# integer 2
li $v0, 1
add $a0, $s2, $zero
syscall
# base 10 (or
li $v0, 4
la $a0, output2
syscall
# integer 2 in hexa
li $v0, 4
la $a0, hexa2
syscall
# base 16)
li $v0, 4
la $a0, output3
syscall
# is
li $v0, 4
la $a0, output5
syscall
# multiply result
li $v0, 1
add $a0, $s3, $zero
syscall
li $v0, 1
add $a0, $s4, $zero
syscall
# base 10 (or
li $v0, 4
la $a0, output2
# multiply result in hexa
syscall
li $v0, 4
la $a0, hexa3
syscall
li $v0, 4
la $a0, hexa4
syscall
# base 16)
li $v0, 4
la $a0, output3
syscall
Exit:
li $v0, 10 
syscall 

Convert_hexa:
li $t0, 8 		# counter 
Loop: 
beqz $t0, Exit_convert 	# branch to exit if counter is equal to zero 
rol $t2, $t2, 4 	# rotate 4 bits to the left 
and $t4, $t2, 0xf 	# extract 4 Less Significant Bits   
ble $t4, 9, ASCII 	# if <= 9, branch to ASCII
addi $t4, $t4, 55 	# if > 9, add 55 
j End 
ASCII: 
addi $t4, $t4, 48 	# add 48 to result 
End: 
sb $t4, 0($t3) 		# store hex digit into result 
addi $t3, $t3, 1 	# increment address counter 
addi $t0, $t0, -1 	# decrement loop counter 
j Loop 
Exit_convert:
jr $ra
