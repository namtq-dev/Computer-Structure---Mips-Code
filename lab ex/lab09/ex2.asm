#Laboratory Exercise 9, Sample Code 2
.text
main: 
#nh?p 3 s? nguyên c?n so sánh giá tr? l?n nh?t 
 li $a0,123		#a0 = 123
 li $a1,16		#a1 = 16
 li $a2,150		#a2 = 98 
 jal max 		#g?i hàm tìm max
 move $s0, $v0		#giá tr? max tìm ???c l?u ? $s0
 nop 
endmain: 
li $v0,10
syscall
#---------------------------------------------------------------------
#Hàm max: tìm s? nguyên có giá tr? l?n nh?t trong 3 s?
#Tham s? vào: s? nguyên 1 $a0
#Tham s? vào: s? nguyên 2 $a1
#Tham s? vào: s? nguyên 3 $a2
#Giá tr? l?n nh?t tìm ???c l?u vào $v0
#---------------------------------------------------------------------
max: add $v0,$a0,$zero 	#Gán giá tr? l?n nh?t ban ??u v0 = a0
 sub $t0,$a1,$v0 	#So sánh a1 v?i v0
 bltz $t0,okay 		#n?u a1 - v0 < 0 => a1 < v0, gi? nguyên giá tr? max v0 = a0
 nop
 add $v0,$a1,$zero 	#ng??c l?i thì a1 > v0, gán giá tr? l?n nh?t v0 = a1
okay: sub $t0,$a2,$v0 	#So sánh a2 v?i v0
 bltz $t0,done 		#n?u a2 - v0 => a2 < v0, gi? nguyên giá tr? max v0
 nop
 add $v0,$a2,$zero 	#ng??c l?i thì a1 > v0, gán giá tr? l?n nh?t v0 = a2
done: jr $ra 		#quay l?i hàm main

