main: 	addi $a0, $zero, 14	# n = 10
      	jal div2		# chama a funcao div2(a)
        add $s0, $zero, $v0	# resul = div2(n)
        j exit
div2: 	addi $sp, $sp, -8	# ajusta a pilha
      	sw $a0, 4($sp)		# salva na pilha a
      	sw $ra, 0($sp)		# salva o endereco de retorno
      	addi $t0, $zero, 2	# $t0 = 2
      	slt $t1, $a0, $t0 	#a0<t0?1:0
      	beq $t1, $zero, ifis2
		add $v0, $zero, $zero  	# return 0
		addi $sp, $sp, 8 	# restaura pilha
		jr $ra, 		# return
ifis2:	bne $a0, $t0, return
		addi $v0, $zero, 1  	# return 1
		addi $sp, $sp, 8 	# restaura pilha
		jr $ra, 		# return
return:	addi $a0, $a0, -2 	# a=a-2
		jal div2		# chama a div2(a-2)
		lw $ra, 0($sp) 		# recupera $ra
		lw $a0, 4($sp) 		# recupera $a0
		addi $sp, $sp, 8 	# restaura $sp
		addi $v0, $v0, 1	# return 1+div2(a-2)
		jr $ra
exit:
