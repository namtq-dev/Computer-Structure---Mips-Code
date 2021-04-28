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
la	$t0, array			# $t0 = address(A[0])
addi	$t1,$s1,1			# $t1 = size of array
li	$t2, 1				# loop counter, start from i = 1
loop1:
la	$t0, array			# $t0 = address(A[0])
bge	$t2, $t1, loop1_end		# if i >= size, finish loop
move	$t3, $t2			
loop2:
la	$t0, array			# $t0 = address(A[0])
mul	$t5, $t3, 4			
add	$t0, $t0, $t5			# $t0 = address(A[i])
ble	$t3, $zero, loop2_end		
lw	$t7, 0($t0)			# $t7 = A[i]
lw	$t6, -4($t0)			# $t6 = A[i-1]
bge	$t7, $t6, loop2_end		# if A[i] < A[i - 1]
lw	$t4, 0($t0)			# swap
sw	$t6, 0($t0)
sw	$t4, -4($t0)
subi	$t3, $t3, 1
j	loop2				# continue loop
loop2_end:
addi	$t2, $t2, 1			# increase loop counter
j	loop1				
loop1_end:
li	$v0, 4		
la	$a0, output		
syscall				
li	$v0, 4			
la	$a0, line		
syscall				
jr	$ra				# return



