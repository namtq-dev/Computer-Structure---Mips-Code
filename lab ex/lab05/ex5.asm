.data
input:	.space	21 		# String input
output:	.space	21 		# Reverse string
Message: .asciiz "Nhap xau (khong nhieu hon 20 ky tu): "
.text
main:
li $v0, 4
la $a0, Message
syscall
input_string:
li	$v0, 8			
la	$a0, input 		# a0 = Address(input[0])
li	$a1, 21			# Maximum 20 character
syscall
	
jal	get_strlen		# JAL to get_strlen function
add	$a0, $zero, $v0	
li	$v0, 1			# Print the length of string input, including the NULL character
syscall

addi	$t1, $a0, -1		# t1 = length of the string input without the NULL character
la	$t2, input		# t2 = Address(input[0])

	
reverse:
li	$t0, 0			# t0 = 0 => i = 0
li	$t3, 0			# t3 = 0
	
reverse_loop:
add	$t3, $t2, $t0		# t3 = t2 + t0 = Address(input[0] + i)
lb	$t4, 0($t3)		# t4 = input[i]
beqz	$t4, exit		# if t4 = NULL, exit loop
sb 	$t4, output($t1)	# input[i] = output[length-i]
subi	$t1, $t1, 1		# t1 = t1 -1 => length = length - 1
addi	$t0, $t0, 1		# t0 = t0 + 1 => i = i + 1
j	reverse_loop		
	
exit:
li	$v0, 4			
la	$a0, output		# Print the reverse string
syscall
		
li	$v0, 10			# exit()
syscall

get_strlen:
li	$t0, 0 			# i = 0
li	$v0, 0 			# v0 = length = 0	
check_char:
add	$t2, $a0, $t0 		# t2 = a0 + t0 = Address(input[0] + i)
lb	$t1, 0($t2) 		# t1 = input[i]
beqz	$t1, strlen_exit 	# if t1 = NULL, exit loop
addi 	$v0, $v0, 1 		# v0 = v0 + 1 => length = length + 1
addiu	$t0, $t0, 1 		# t0 = t0 + 1 => i = i + 1
j	check_char		
strlen_exit:
jr $ra				# continue