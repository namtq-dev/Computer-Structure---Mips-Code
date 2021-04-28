.data
array: .word 0:30   
size: .asciiz "Enter size of array: "
num: .asciiz "Enter number: "
output: .asciiz "\nSorted array: "
space: .asciiz " "
line:	.asciiz	"\n"

.text
main:
#Input size of the array
li $v0,4
la $a0,size                       
syscall
li $v0,5
syscall
move $s1, $v0		#$s1 = size of array = n+1                 
sub $s1,$s1,1                       

#Input number
la $s0, array		#$s0 = address(A[0])
li $t0,0		#$t0 = i = 0
addnum:
li $v0,4
la $a0,num                     
syscall
li $v0,5        
syscall
move $t3,$v0                        
sll $t1,$t0,2   	                 
add $t1,$s0,$t1		#$t1 = address(A[i])
sw $t3,0($t1)         	#$t3 = A[i]       
addi $t0,$t0,1       	#i = i+1            
slt $t1,$s1,$t0      	#i < n?      
beq $t1,$zero,addnum  	#if i < n, continue input number        

#Begin sorting                    
jal insertion_sort                           

#Print output
la $t0,array                        
li $t1,0                            
print:
lw $a0,0($t0)                       
li $v0,1
syscall
li $v0,4
la $a0,space
syscall
addi $t0,$t0,4                      
addi $t1,$t1,1                      
slt $t2,$s1,$t1                     
beq $t2,$zero,print                 

#exit
li $v0,10                           
syscall

insertion_sort:
	la	$t0, array		# $t0 = address(A[0])
	addi	$t1,$s1,1		# $t1 = size of array
	li	$t2, 1			# loop counter
sort_xloop:
	la	$t0, array			# load array to $t0.
	bge	$t2, $t1, sort_xloop_end	# while (t2 < $t1).
	move	$t3, $t2			# copy $t2 to $t3.
sort_iloop:
	la	$t0, array			# load array to $t0.
	mul	$t5, $t3, 4			# multiply $t3 with 4, and store in $t5
	add	$t0, $t0, $t5			# add the array address with $t5, which is the index multiplied with 4.
	ble	$t3, $zero, sort_iloop_end	# while (t3 > 0).
	lw	$t7, 0($t0)			# load array[$t3] to $t7.
	lw	$t6, -4($t0)			# load array[$t3 - 1] to $t6.
	bge	$t7, $t6, sort_iloop_end	# while (array[$t3] < array[$t3 - 1]).
	lw	$t4, 0($t0)
	sw	$t6, 0($t0)
	sw	$t4, -4($t0)
	subi	$t3, $t3, 1
	j	sort_iloop		# jump back to the beginning of the sort_iloop.
sort_iloop_end:
	addi	$t2, $t2, 1		# increment loop runner by 1.
	j	sort_xloop		# jump back to the beginning of the sort_xloop.
sort_xloop_end:
	li	$v0, 4			# 4 = print_string syscall.
	la	$a0, output		# load sorted_array_string to argument register $a0.
	syscall				# issue a system call.
	li	$v0, 4			# 4 = print_string syscall.
	la	$a0, line		# load line to argument register $a0.
	syscall				# issue a system call.
	jr	$ra			# call print routine.



