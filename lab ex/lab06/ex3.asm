.data
array: .word 0:30   
size: .asciiz "Enter size of array: "
num: .asciiz "Enter number: "
output: .asciiz "\nSorted array: "
space: .asciiz " "

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
la $a0,array                        
addi $a1,$s1,1                      
jal bubble_sort                            

#Print output
la $a0,output
li $v0,4
syscall
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


bubble_sort:
li $t0,0			#$t0 = i = 0                          
loop1:
addi $t0,$t0,1  		#loop counter                    
bgt $t0,$a1,end               	#if i > size, finish loop
add $t1,$a1,$zero          	   
loop2:
bge $t0,$t1,loop1		            
subi $t1,$t1,1               	#$t1 = $t1 - 1    
sll $t4, $t1, 2               	
subi $t3, $t4, 4             	  
add $t4,$t4,$a0                #$t4 = address(A[i])   
add $t3,$t3,$a0                #$t3 = address(A[i-1])       
lw $t5,0($t4)			#$t5 = A[i]
lw $t6,0($t3)			#$t6 = A[i-1]
swap:
bgt $t5,$t6,loop2           	#if A[i] < A[i-1]
sw $t5,0($t3)               	#swap
sw $t6,0($t4)
j loop2				#continue loop
end:
jr $ra
