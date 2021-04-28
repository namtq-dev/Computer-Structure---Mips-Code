.data 
input1: .asciiz "Enter the 1st number: " 
input2: .asciiz "\nEnter the 2nd number: " 
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

# Input 2nd integer
li $v0, 4 
la $a0, input2 
syscall 
li $v0, 5 
syscall 
move $s2, $v0 		# Store 2nd integer in $s2

# Multiply
mult $s1, $s2
mfhi $s3
mflo $s4

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
li $v0, 34
la $a0, 0($s1)
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
li $v0, 34
la $a0, 0($s2)
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
syscall
# multiply result in hexa
li $v0, 34
la $a0, 0($s3)
syscall
li $v0, 34
la $a0, 0($s4)
syscall
# base 16)
li $v0, 4
la $a0, output3
syscall
Exit:
li $v0, 10 
syscall 
