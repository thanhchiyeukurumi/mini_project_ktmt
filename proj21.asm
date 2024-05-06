#mini project 
#project 21
.data
mes: .asciiz "Input: "
mes2: .asciiz "digitDegree(n): "
in: .space 200
.text	
# input dialog string
	li $v0,54
	la $a0,mes
	la $a1,in			
	la $a2,200
	syscall
	
# dat cac bien chuan bi xet bang 0
	li $t4,0		# xet so lan xet lan dau tien	
	li $t5,0		# tong ca chu so sau lan xet dau tien 
	la $a1,in		# dia chi cua "in" luu vao a1
	li $t0,0		# bien vong lap
	li $t7,'\n'
# vong lap dau tien 
loop1:
	add $t1,$a1,$t0		# t1 = dia chi "in"
	lb $t2,0($t1)		# load byte
	beq $t2,$0,end_loop1	# neu gap thu tu ket thuc -> dung
	li $t3,'0'		# gan de chuan bi cho phep tru
	sub $t6,$t2,$t3 	# t6 = gia tri cua t2 hien tai (theo so)
	add $t5,$t5,$t6		# tong = tong + t6
	addi $t0,$t0,1		# tang bien vong lap
	addi $t4,$t4,1		# so lan chay vong lap
	j loop1			# loop
end_loop1:	
	subi $t4,$t4,1		# so lan chay vong lap loop1 chinh thuc
	beq $t4,1,end1		# neu chi co 1 lan chay -> end1
# do thua 1 lan + '\n' - '0' nen phai thuc hien 2 cau lenh duoi
	add $t5,$t5,$t3		
	sub $t5,$t5,$t7
	move $t0,$t5		# t0 la tong sau lan cong dau tien
	li $t1,1		# so lan chay vong lap da la 1
# vong lap (tu lan thu 2)
loop:
	blt $t0,10,end_loop	# t0<10 -> ket thuc vong lap
	addi $t1,$t1,1		# digitDegree + 1
	jal sum			# nhay den ham sum
	nop
	j loop			# loop
end_loop:
	j end			# nhay den end
# ham tinh tong cac chu so
sum:
	blt $t0,1,end_sum	# t0<1 ket thuc ham
	div $t0,$t0,10		# chia 10, lay phan thuong gan vao t0
	mfhi $t3		# gan du vao t3
	add $t2,$t2,$t3		# tong t2 = t2 + t3
	j sum			# loop
end_sum: 
	move $t0,$t2		# t0 bang tong moi t2
	andi $t2,$t2,0		# dat t2 bang 0
	jr $ra			# out
# ket thuc chuong trinh
end:
	li $v0,56
	la $a0,mes2
	move $a1,$t1
	syscall			# syscall
	li $v0,10		# ket thuc
	syscall
#trong truong hop day chi co 1 so
end1:	
	li $v0,56
	la $a0,mes2
	li $a1,0		# digitDegree = 0
	syscall			# syscall
	li $v0,10		# ket thuc
	syscall
	
