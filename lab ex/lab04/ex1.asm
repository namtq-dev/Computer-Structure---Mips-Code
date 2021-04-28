#Laboratory Exercise 4, Sample Code 1
.text
li $s1, 55 # s1 = -2147483648
li $s2, 68 # s2 = -1
start:
li $t0,0 # G�n gi� tr? ki?m tra tr�n s? t0 = 0 
# t0 = 0 kh�ng x?y ra tr�n s?; t0 = 1 x?y ra tr�n s?
addu $s3,$s1,$s2 # s3 = s1 + s2
xor $t1,$s1,$s2 # Ki?m tra gi� tr? c?a $s1 v� $s2 c� c�ng d?u hay kh�ng
# N?u c�ng d?u th� MSB c?a t1 l� 0 => gi� tr? c?a $t1 l� s? d??ng
# N?u kh�c d?u th� MSB c?a t1 l� 1 => gi� tr? c?a $t1 l� s? �m
bltz $t1,EXIT # N?u t1 < 0 => kh�ng c�ng d?u, k?t th�c ch??ng tr�nh
slt $t2,$s3,$s1 # N?u $s3 < $s1 th� g�n t2 = 1, ng??c l?i th� t2 = 0
bltz $s1,NEGATIVE # Ki?m tra d?u c?a s1. N?u s1 l� s? �m th� s2 c?ng l� s? �m, chuy?n ??n NEGATIVE 
beq $t2,$zero,EXIT # s1 v� s2 l� s? d??ng
 # N?u t2 != 0 th� $s3 < $s1 => k?t qu? tr�n s?
 # N?u t2 = 0 th� $s3 > $s1 => k?t qu? kh�ng tr�n s?
j OVERFLOW
NEGATIVE:
bne $t2,$zero,EXIT 
 # N?u t2 != 0 th� $s3 < $s1 => k?t qu? kh�ng tr�n s?
 # N?u t2 = 0 th� $s3 > $s1 => k?t qu? tr�n s?
OVERFLOW:
li $t0,1 # K?t qu? tr�n s?
EXIT:
