#Laboratory Exercise 4, Sample Code 1
.text
li $s1, 55 # s1 = -2147483648
li $s2, 68 # s2 = -1
start:
li $t0,0 # Gán giá tr? ki?m tra tràn s? t0 = 0 
# t0 = 0 không x?y ra tràn s?; t0 = 1 x?y ra tràn s?
addu $s3,$s1,$s2 # s3 = s1 + s2
xor $t1,$s1,$s2 # Ki?m tra giá tr? c?a $s1 và $s2 có cùng d?u hay không
# N?u cùng d?u thì MSB c?a t1 là 0 => giá tr? c?a $t1 là s? d??ng
# N?u khác d?u thì MSB c?a t1 là 1 => giá tr? c?a $t1 là s? âm
bltz $t1,EXIT # N?u t1 < 0 => không cùng d?u, k?t thúc ch??ng trình
slt $t2,$s3,$s1 # N?u $s3 < $s1 thì gán t2 = 1, ng??c l?i thì t2 = 0
bltz $s1,NEGATIVE # Ki?m tra d?u c?a s1. N?u s1 là s? âm thì s2 c?ng là s? âm, chuy?n ??n NEGATIVE 
beq $t2,$zero,EXIT # s1 và s2 là s? d??ng
 # N?u t2 != 0 thì $s3 < $s1 => k?t qu? tràn s?
 # N?u t2 = 0 thì $s3 > $s1 => k?t qu? không tràn s?
j OVERFLOW
NEGATIVE:
bne $t2,$zero,EXIT 
 # N?u t2 != 0 thì $s3 < $s1 => k?t qu? không tràn s?
 # N?u t2 = 0 thì $s3 > $s1 => k?t qu? tràn s?
OVERFLOW:
li $t0,1 # K?t qu? tràn s?
EXIT:
