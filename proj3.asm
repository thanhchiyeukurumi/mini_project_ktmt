#mini project 
#project 3
.data
in:    		    .asciiz "Enter a number (0 to 999999999): "
# khai bao cac xau
hundred:           .asciiz "hundred "
million:           .asciiz "million "
thousand:          .asciiz "thousand "
zero:              .asciiz "zero "

one:               .asciiz "one "
two:               .asciiz "two "
three:             .asciiz "three "
four:              .asciiz "four "
five:              .asciiz "five "
six:               .asciiz "six "
seven:             .asciiz "seven "
eight:             .asciiz "eight "
nine:              .asciiz "nine "

ten:               .asciiz "ten "
eleven:            .asciiz "eleven "
twelve:            .asciiz "twelve "
thirteen:          .asciiz "thirteen "
fourteen:          .asciiz "fourteen "
fifteen:           .asciiz "fifteen "
sixteen:           .asciiz "sixteen "
seventeen:         .asciiz "seventeen "
eighteen:          .asciiz "eighteen "
nineteen:          .asciiz "nineteen "

twenty:            .asciiz "twenty "
thirty:            .asciiz "thirty "
forty:             .asciiz "forty "
fifty:             .asciiz "fifty "
sixty:             .asciiz "sixty "
seventy:           .asciiz "seventy "
eighty:            .asciiz "eighty "
ninety:            .asciiz "ninety "
.text
main:
# mes-input
    	li $v0,51
    	la $a0,in
    	syscall
    	move $t0,$a0 			# so dang xet t0
   	bne $t0,0,countinue		# xet t0=0
   	li $v0,4
	la $a0,zero
	syscall				# truong hop t0=0
	j end				# nhay den end
# dem chu so cua so
countinue:				# tiep tuc voi t0 khac 0
	addi $t1,$t0,0			# gan t1 = t0
	andi $t2,$t2,0			# bien xet so cac chu so
	addi $t3,$0,10 			# 10(danh cho div)
loop_count:
	blt   $t1,1,end_loop_count	# t1<1 dung vong lap
	addi $t2,$t2,1			# t2++
	div  $t1,$t3			# phep chia
	mflo $t1			# chuyen thuong vao t1
	j loop_count			# tiep tuc vong lap
end_loop_count:
	ori $t1,$t2,0 			# so chu so cua t0 la t1
reset:					# reset cac bien ve 0
	andi $t2,$t2,0
	andi $t3,$t3,0

func:	
	blt $t1,3,cont
	addi $t8,$t8,1			# truong hop t0 co nhieu hon 3 chu so
cont:	
	blt $t1,4,hundred_func		# t1 it hon 4 chu so	
	blt $t1,7,thousand_func		# t1 it hon 7 chu so
	blt $t1,10,million_func		# t1 it hon 10 chu so

# main
loop_main:
# xet hang tram
_100:
	blt $t6,1,_x0			# t6=0 -> xet t5
	# code
	bne $t6,9,m800			# t6 khac 9, xet t6 voi 8
	li $v0,4
	la $a0,nine
	syscall
	j _100_end
m800:
	bne $t6,8,m700
	li $v0,4
	la $a0,eight
	syscall
	j _100_end
m700:
	bne $t6,7,m600
	li $v0,4
	la $a0,seven
	syscall
	j _100_end
m600:
	bne $t6,6,m500
	li $v0,4
	la $a0,six
	syscall
	j _100_end
m500:
	bne $t6,5,m400
	li $v0,4
	la $a0,five
	syscall
	j _100_end
m400:
	bne $t6,4,m300
	li $v0,4
	la $a0,four
	syscall
	j _100_end
m300:
	bne $t6,3,m200
	li $v0,4
	la $a0,three
	syscall
	j _100_end
m200:
	bne $t6,2,m100
	li $v0,4
	la $a0,two
	syscall
	j _100_end
m100:
	li $v0,4
	la $a0,one
	syscall
	j _100_end
# them chu "hundred" khi xet xong t6
_100_end: 
	li $v0,4
	la $a0,hundred
	syscall
##########
# xet hang chuc voi x khac 1
_x0:
	blt $t5,2,_10			# t5<2 -> xet t5 voi 1
	move $t6,$t5			# gan t6 bang t5
	# code
	bne $t6,9,m80
	li $v0,4
	la $a0,ninety
	syscall
	j _x0_end
m80:
	bne $t6,8,m70
	li $v0,4
	la $a0,eighty
	syscall
	j _x0_end
m70:
	bne $t6,7,m60
	li $v0,4
	la $a0,seventy
	syscall
	j _x0_end
m60:
	bne $t6,6,m50
	li $v0,4
	la $a0,sixty
	syscall
	j _x0_end
m50:
	bne $t6,5,m40
	li $v0,4
	la $a0,fifty
	syscall
	j _x0_end
m40:
	bne $t6,4,m30
	li $v0,4
	la $a0,forty
	syscall
	j _x0_end
m30:
	bne $t6,3,m20
	li $v0,4
	la $a0,thirty
	syscall
	j _x0_end
m20:
	li $v0,4
	la $a0,twenty
	syscall
	j _x0_end
# khong co truong hop m10
_x0_end: 
# end x0 tu dong xet den t4 (_1)
##########
_1:
# xet hang don vi
	move $t6,$t4		# gan t6 = 4
	# code
	bne $t6,9,m8		# xet t6 voi 9
	li $v0,4
	la $a0,nine
	syscall
	j _x_end
m8:
	bne $t6,8,m7
	li $v0,4
	la $a0,eight
	syscall
	j _x_end
m7:
	bne $t6,7,m6
	li $v0,4
	la $a0,seven
	syscall
	j _x_end
m6:
	bne $t6,6,m5
	li $v0,4
	la $a0,six
	syscall
	j _x_end
m5:
	bne $t6,5,m4
	li $v0,4
	la $a0,five
	syscall
	j _x_end
m4:
	bne $t6,4,m3
	li $v0,4
	la $a0,four
	syscall
	j _x_end
m3:
	bne $t6,3,m2
	li $v0,4
	la $a0,three
	syscall
	j _x_end
m2:
	bne $t6,2,m1
	li $v0,4
	la $a0,two
	syscall
	j _x_end
m1:
	bne $t6,1,_x_end
	li $v0,4
	la $a0,one
	syscall
	j _x_end
_x_end:
j end_million 			# nhay den end_million
##########
_10:
# voi t5t4 co dang 1x
	blt $t5,1,_1		# t5=0 -> xet t6 (hang doi vi)
	move $t6,$t4		# gan t6 bang t4
	# code
	bne $t6,9,m18
	li $v0,4
	la $a0,nineteen
	syscall
	j _10_end
m18:
	bne $t6,8,m17
	li $v0,4
	la $a0,eighteen
	syscall
	j _10_end
m17:
	bne $t6,7,m16
	li $v0,4
	la $a0,seventeen
	syscall
	j _10_end
m16:
	bne $t6,6,m15
	li $v0,4
	la $a0,sixteen
	syscall
	j _10_end
m15:
	bne $t6,5,m14
	li $v0,4
	la $a0,fifteen
	syscall
	j _10_end
m14:
	bne $t6,4,m13
	li $v0,4
	la $a0,fourteen
	syscall
	j _10_end
m13:
	bne $t6,3,m12
	li $v0,4
	la $a0,three
	syscall
	j _10_end
m12:
	bne $t6,2,m11
	li $v0,4
	la $a0,twelve
	syscall
	j _10_end
m11:
	bne $t6,1,m10
	li $v0,4
	la $a0,eleven
	syscall
	j _10_end
m10:
	li $v0,4
	la $a0,ten
	syscall
	j _10_end
_10_end:
# ket thuc hang trieu
end_million:
	blt $t0,1000000,end_thousand	# neu sai, chuyen xuong hang nghin
	li $v0,4
	la $a0,million
	syscall
	j thousand_func			# tiep tuc xet den hang nghin
# ket thuc hang nghin
end_thousand:
	blt $t0,1000,end_hundred	# neu sai, chuyen xuong hang tram
	li $v0,4
	la $a0,thousand
	syscall
	j hundred_func			# tiep tuc xet den hang tram
#ket thuc hang tram
end_hundred:
	bne $t0,0,hundred_func		# t0 khac 0, van tiep tuc xet
	j end				# nhay den viec ket thuc chuong trinh
####################
million_func:
	li $t3,1000000
	div $t0,$t3
	mflo $t4			# lay 3 chu so dau
	mflo $t9			# gan thuong vao t9
	jal digit			# nhay den chuong trinh con
	nop
	j loop_main			# quay lai ham main
thousand_func:
	li $t3,1000
	mul $t9,$t9,1000000		
	sub $t0,$t0,$t9			# t0 luc nay con 6 chu so
	div $t0,$t3			
	mflo $t4			# lay 3 chu so dau
	mflo $t9			# gan thuong vao t9
	jal digit			# nhay den chuong trinh con
	nop				
	j loop_main			# quay lai ham main
hundred_func:
	mul $t9,$t9,1000
	sub $t0,$t0,$t9			# t0 luc nay chi con co 3 chu so
	move $t4,$t0			# lay 3 chu so dau
	andi $t0,$t0,0			# t0=0
	jal digit			# nhay den chuong trinh con
	nop
	j loop_main			# quay lai ham main
####################
digit:
# ham lay so co dang abc gan vao t6,t5,t4
	div $t6,$t4,100			# t6 bang chu so dau tien
	mfhi $t4			# la du gan vao t4
	div $t5,$t4,10			# t5 bang chu so thu 2
	mfhi $t4			# t4 la chu so thu 3
	jr $ra				# out
end:
# ket thuc chuong trinh
	li $v0,10
	syscall
