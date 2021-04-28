.data
     getA:    .asciiz "Please enter the first number(multiplicand): "
     getB:    .asciiz "Please enter the second number(multiplier): "
     space:    .asciiz " "
     promptStart:    .asciiz "This program multiplies two numbers. "
     mipMult:   .asciiz "The product, using MIPs mult is: "
     endLine: .asciiz "\n"
.text
main:
    li  $v0,4           
    la  $a0,promptStart 
    syscall            


    li  $v0,4           
    la  $a0,endLine     
    syscall            

    #prompt for multiplicand
    li  $v0,4          
    la  $a0,getA        
    syscall             

    #acquire multiplicand
    li  $v0,5          
    syscall             
    move    $s0,$v0     
    move    $s5,$s0    

    #prompt for multiplier
    li  $v0,4           
    la  $a0,getB        
    syscall             

    #acquire multiplier
    li  $v0,5          
    syscall            
    move    $s1,$v0    

    move    $s6,$s1     # copy 

    multu    $s5, $s6
    mfhi    $t0
    mflo    $t1

    li  $v0,4        
    la  $a0,mipMult    
    syscall

    # print out the result (This is obviously not correct, I need some help)
	move $t2, $t0
	jal print_binary
	move $t2, $t1
	jal print_binary

         # $t2 should hold the number to print in binary
	print_binary:
     li $t3, 32
     li $v0, 1
print_bit:
     subiu $t3, $t3, 1
     srlv $a0, $t2, $t3
     andi $a0, $a0, 1
     syscall
     bgtz $t3, print_bit
     jr $ra         

    # print the line feed
    li  $v0,4           
    la  $a0,endLine     
    syscall             


    li  $v0,10          
    syscall             # exit program