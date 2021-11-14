add 	R7, R7, -12 	
sw   	$ra, 8(R7) 	
sw 	$a0, 0(R7) 	
sw 	$a1, 4(R7) 	

	addi 	R0, R0,0		#i=0
	addi	R1, $a1, -1	#j=n-1
	
	add 	R2, R0, R1	#pivot = i+j 
	srl	R2, R2, 1	#(pivot/2)*4
	sll	R2, R2, 2	#(pivot/2)*4
	add	R2, R2, $a0
	
	lw	R2, 0(R2)	#pivot = array[(i+j)/2];
	
	############## while (i <= j) ########
	while:
		bge	R0,R1,skipWhile
		
		##while (array[i] < pivot)##
		whileLess:
			sll  	R3, R0, 2
			add	R3, $a0, R3
			lw	R4, 0(R3)
			bge	R4, R2, skipLess
			addi	R0, R0, 1
			
			j	whileLess	
		skipLess:	
		
		##while (array[j] > pivot)##
		whileMore:
			sll  	R3, R1, 2
			add	R3, $a0, R3
			lw	R4, 0(R3)
			blt	R4, R2, skipMore
			addi	R1, R1, -1
			
			j	whileMore
		skipMore:
		
		###### if (i <= j) ########
		bge 	R0, R1, skipIf
			
			sll  	R3, R0, 2
			add	R3, $a0, R3
			lw	R5, 0(R3)
			
			sll	R4, R1, 2
			add	R4, $a0, R4
			lw	R6, 0(R4)
			
			sw	$r6,0(R3)
			sw	$r5,0(R4)
			
			addi	$r0, R0, 1
			addi	$r1, R1, -1
		skipIf:
		
		j while
	skipWhile:
	
	######## if (j > 0)  #######
	blt	$t1,$0, skipSortJ
		lw 	$a0, 0($sp) 		
		addi	$a1, R1,1
		jal	sort
	skipSortJ:
	
	######## if (i < n-1) ######
	lw 	$a0, 0($sp) 	
	lw 	$a1, 4($sp) 	
	addi	R6, $a1,-1	
	bge	R0, R6 skipSortI
		sll	R6, R0, 2
		add	$a0, $a0, R6
		sub	$a1, $a1, R0
		jal	sort
	skipSortI:
