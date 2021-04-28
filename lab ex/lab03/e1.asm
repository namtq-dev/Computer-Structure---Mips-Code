#Laboratory 3, Sample Code 2
.data
array: .word 0,0,10,5,0,18,-35 # array = {0,0,10,5,0,18,-35}
sum: .word 0 # sum = 0
length: .word 7 # m?ng có 7 ph?n t?
.text
li $s1,0 # i = 0
la $s2, array # l?u ??a ch? c?a ph?n t? A[0] vào $s2
lw $s3, length # n = 7
li $s4,1 # step = 1
loop: 
add $t1,$s1,$s1 # t1 = 2*s1
add $t1,$t1,$t1 # t1 = 4*s1
add $t1,$t1,$s2 # t1 l?u ??a ch? c?a ph?n t? m?ng A[i]
lw $t0,0($t1) # gán giá tr? c?a A[i] vào $t0
add $s5,$s5,$t0 # sum = sum+A[i]
add $s1,$s1,$s4 # i = i+step
beq $t0,$zero,loop # n?u A[i] == 0, ti?p t?c vòng l?p
