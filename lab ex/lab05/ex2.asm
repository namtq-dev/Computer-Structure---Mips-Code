.data
message1: .asciiz "The sum of "
message2: .asciiz " and "
message3: .asciiz " is "
.text
li $s0, 200 # s0 = 200
li $s1, 300 # s1 = 300
add $t0, $s0, $s1 # t0 = s0 + s1 = 500

li $v0, 4 # Print string
la $a0, message1 # The string to be printed: "The sum of "
syscall
li $v0, 1 # Print integer
la $a0, 0($s0) # The integer to be printed: s0 = 200
syscall
li $v0, 4 # Print string
la $a0, message2 # The string to be printed: " and "
syscall
li $v0, 1 # Print integer
la $a0, 0($s1) # The integer to be printed: s1 = 300
syscall
li $v0, 4 # Print string
la $a0, message3 # The string to be printed: " is "
syscall
li $v0, 1 # Print integer
la $a0, 0($t0) # The integer to be printed: t0 = s0 + s1
syscall
