.data
info1: .asciiz "Enter a power of 2 (e.g. 2, 4, 6, 8...): "
info2: .asciiz "Your number: "
.text
li $s0, 15
li $t1, 2
li $t3, 0 # count = 0
# Print message
li $v0,4
la $a0,info1
syscall
# Input number from keyboard
li $v0,5
syscall
move $t0, $v0 # Store the number in $t0
# Print number
li $v0,4
la $a0,info2
syscall
li $v0,1
move $a0,$t0
syscall
# Multiply
div $t2, $t0, $t1
check:
addi $t3, $t3, 1 # count = count + 1
bne $t2, 1, loop
sllv $s1,$s0, $t3 # Store result in $s1
#Exit
li $v0,10
syscall
loop:
div $t2, $t2, $t1
j check

