.data
A: .word -2, 6, -1, 3, -2
.text
main: 
la $a0,A 			#$a0 l?u ??a ch? c?a A[0]
li $a1,5			#$a1 l� chi?u d�i c?a m?ng, $a1 = 5
j mspfx
nop
continue:
li $v0,1
add $a0,$v1,$zero
syscall
end_of_main:
li $v0,10
syscall
mspfx: addi $v0,$zero,0 	#chi?u d�i c?a m?ng prefix ban ??u l� $v0 = 0
addi $v1,$zero,0 		#t?ng l?n nh?t c?a m?ng prefix ban ??u l� $v1 = 0
addi $t0,$zero,0 		#ch? m?c i ban ??u l� $t0 = 0
addi $t1,$zero,0 		#t?ng c?a m?ng prefix hi?n t?i l� $t1 = 0 
loop: add $t2,$t0,$t0 		
add $t2,$t2,$t2 		
add $t3,$t2,$a0 		#$t3 l?u ??a ch? c?a A[i]
lw $t4,0($t3) 			#$t4 l?u gi� tr? c?a A[i]

add $t1,$t1,$t4 		#t?ng prefix m?i = t?ng prefix hi?n t?i + A[i]
slt $t5,$v1,$t1 		#n?u t?ng l?n nh?t hi?n t?i < t?ng prefix m?i
bne $t5,$zero,mdfy 		#th� thay ??i gi� tr? t?ng l?n nh?t t�m ???c
j test 				
mdfy: addi $v0,$t0,1 		#m?ng prefix m?i c� chi?u d�i l� i+1
addi $v1,$t1,0 			#t?ng l?n nh?t = t?ng prefix hi?n t?i
test: addi $t0,$t0,1 		#i = i+1
slt $t5,$t0,$a1 		#n?u i < chi?u d�i t?i ?a c?a m?ng
bne $t5,$zero,loop 		#ti?p t?c t�nh t?ng c?a prefix ti?p theo
done: j continue
mspfx_end: