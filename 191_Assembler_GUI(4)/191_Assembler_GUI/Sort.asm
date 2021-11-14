addi R7, R0, 8				#Load address i 	
addi R5, R0, 4 				#Number of index

loopi:
	addi R6, R7, 1			#load address j = i+1
	addi R4, R5, -1
	loopj:
		lw	R1, 0(R7)		#load i
		lw	R2, 0(R6)		#load j

		blt	R1, R2, skip:		#Compare i and j values. If i greater than j rotate   
		sw R2, 0(R7)
		sw R1, 0(R6)
		j update
		skip:
		sw	R1, 0(R7)		#save i
		sw	R2, 0(R6)		#save j
		update:
		addi 	R6, R6, 1		# j++
		addi 	R4, R4, -1			
		blt  	R0, R4, loopj
	addi 	R7, R7, 1			#i++
	addi 	R5, R5, -1			
	blt  	R0, R5, loopi
