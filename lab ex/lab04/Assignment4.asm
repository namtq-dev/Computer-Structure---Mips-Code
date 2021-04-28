.text
li $s1, -214748364
li $s2, 10
start:
li $t0,0 # No overflow is set as default status
addu $s3,$s1,$s2 # s3 = s1 + s2
xor $t1,$s1,$s2 # Check if $s1 and $s2 have the same sign?
bltz $t1,EXIT # If not, exit
xor $t1,$s1,$s3 # Check if sum and $s1 and $s2 have the same sign? 
bltz $t1,OVERFLOW # If not, the addition is overflow
EXIT:
li $v0, 10
syscall
OVERFLOW:
li $t0,1 # The result overflows
