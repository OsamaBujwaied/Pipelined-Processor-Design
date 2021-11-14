################## Selection Sort ###################

addi $t7, $zero, 2000	#Load address 	

loopi:
	addi $t6, $t7, 1	#Move address of +1 
	loopj:
		lw	$t1, 0($t7)
		lw	$t2, 0($t6)
		bgt	$t2, $t1, skipRotate
		addi	$t3, $t1,0
		addi	$t1, $t2,0
		addi 	$t2, $t3,0
		skipRotate
		addi 	$t6, $t6, 1
		j loopj
		
	addi 	$t7, $t7, 1	
	j loopi
	
	
	
	
	