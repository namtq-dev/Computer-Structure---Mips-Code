#Laboratory Exercise 9, Sample Code 2
.text
main: 
#nh?p 3 s? nguy�n c?n so s�nh gi� tr? l?n nh?t 
 li $a0,123		#a0 = 123
 li $a1,16		#a1 = 16
 li $a2,150		#a2 = 98 
 jal max 		#g?i h�m t�m max
 move $s0, $v0		#gi� tr? max t�m ???c l?u ? $s0
 nop 
endmain: 
li $v0,10
syscall
#---------------------------------------------------------------------
#H�m max: t�m s? nguy�n c� gi� tr? l?n nh?t trong 3 s?
#Tham s? v�o: s? nguy�n 1 $a0
#Tham s? v�o: s? nguy�n 2 $a1
#Tham s? v�o: s? nguy�n 3 $a2
#Gi� tr? l?n nh?t t�m ???c l?u v�o $v0
#---------------------------------------------------------------------
max: add $v0,$a0,$zero 	#G�n gi� tr? l?n nh?t ban ??u v0 = a0
 sub $t0,$a1,$v0 	#So s�nh a1 v?i v0
 bltz $t0,okay 		#n?u a1 - v0 < 0 => a1 < v0, gi? nguy�n gi� tr? max v0 = a0
 nop
 add $v0,$a1,$zero 	#ng??c l?i th� a1 > v0, g�n gi� tr? l?n nh?t v0 = a1
okay: sub $t0,$a2,$v0 	#So s�nh a2 v?i v0
 bltz $t0,done 		#n?u a2 - v0 => a2 < v0, gi? nguy�n gi� tr? max v0
 nop
 add $v0,$a2,$zero 	#ng??c l?i th� a1 > v0, g�n gi� tr? l?n nh?t v0 = a2
done: jr $ra 		#quay l?i h�m main

