#Laboratory Exercise 9, Sample Code 4
.data
Message: .asciiz "Ket qua tinh giai thua la: "
.text
main: jal WARP
print: add $a1, $v0, $zero # $a0 l?u k?t qu? c?a N!
 li $v0, 56
 la $a0, Message
 syscall
quit: li $v0, 10 #k?t th�c ch??ng tr�nh
 syscall 
endmain:
#---------------------------------------------------------------------
#H�m WARP: g�n gi� tr? v� g?i h�m FACT 
#---------------------------------------------------------------------
WARP: sw $fp,-4($sp) #l?u frame pointer hi?n t?i (1)
 addi $fp,$sp,0 #frame pointer m?i ch? t?i ??nh c?a stack (2)
 addi $sp,$sp,-8 #t?o 2 ng?n nh? m?i trong stack (3)
 sw $ra,0($sp) #l?u ??a ch? tr? v? h�m main (4)
 li $a0,3 #N = 3 => t�nh 3!
 jal FACT #g?i h�m fact
 nop 
 lw $ra,0($sp) #kh�i ph?c gi� tr? tr? v? h�m main(5)
 addi $sp,$fp,0 #x�a ng?n nh? stack sau khi s? d?ng xong (6)
 lw $fp,-4($sp) #kh�i ph?c frame pointer  (7)
 jr $ra #quay v? h�m main
wrap_end:
#---------------------------------------------------------------------
#H�m FACT: t�nh N!
#??u v�o $a0 ch?a s? nguy�n N
#gi� tr? tr? v? l?u v�o $v0
#---------------------------------------------------------------------
FACT: sw $fp,-4($sp) 	#l?u frame pointer hi?n t?i
 addi $fp,$sp,0 	#frame pointer m?i ch? t?i ??nh c?a stack 
 addi $sp,$sp,-12 	#t?o 3 ng?n nh? m?i trong stack ?? l?u gi� tr? $fp,$ra,$a0 
 sw $ra,4($sp) 		#l?u ??a ch? tr? v?
 sw $a0,0($sp) 		#l?u gi� tr? $a0 hi?n t?i

 slti $t0,$a0,2 	#n?u N > 2
 beq $t0,$zero,recursive #g?i h�m recursive
 nop
 li $v0,1 		#ng??c l?i th� N!=1
 j done			#g?i h�m done
 nop
recursive: 
 addi $a0,$a0,-1 	#N = N - 1
 jal FACT 		#ti?p t?c v�ng l?p
 nop 
 lw $v1,0($sp) 		#l?y ra gi� tr? a0
 mult $v1,$v0 		#t�nh N! * (N+1)
 mflo $v0		#l?u gi� tr? t�m ???c ra $v0
done: 
 lw $ra,4($sp) 		#kh�i ph?c ??a ch? tr? v?
 lw $a0,0($sp) 		#kh�i ph?c gi� tr? a0 tr??c ?�
 addi $sp,$fp,0 	#kh�i ph?c stack pointer
 lw $fp,-4($sp) 	#kh�i ph?c frame pointer
 jr $ra 		#tr? v?
fact_end:

