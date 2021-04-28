.data
array: .word 20,13,-256,5,29,18,-35,180 # array = {20,13,-256,5,29,18,-35,180}
length: .word 8 # the length of the array is 8
.text
main:
li $s1,0 # i = 0
la $s2, array # $s2 store the address of A[0] 
lw $s3, length # n = 8
li $s4,0 # max = 0
jal loop # call loop
li $v0,10 # exit program

max:
add $s4,$t2,$zero # max = t2
j continue # continue with the loop

loop: 
add $t0,$s1,$s1 # t0 = 2*s1
add $t0,$t0,$t0 # t0 = 4*s1
add $t0,$t0,$s2 # t0 store the addres of A[i]
lw $t1,0($t0) # load value of A[i] to $t1
abs $t2,$t1 # t2 = |t1|
bge $t2,$s4,max # if t2 > s4, goto max
continue:
addi $s1,$s1,1 # i = i+1
blt $s1,$s3,loop # if i < n, loop back

