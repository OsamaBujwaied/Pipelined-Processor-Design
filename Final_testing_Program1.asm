addi R1 R0 3
addi R2 R0 1
add R3 R1 R2
or R3 R1 R2
xor R3 R1 R2
add R3 R1 R2
nadd R3 R1 R2
seq R3 R1 R1
slt R3 R2 R1
andi R3 R1 5
candi R3 R1 5
ori R3 R1 5
xori R3 R1 5
addi R3 R1 5
naddi R3 R1 5
seqi R3 R1 5
slti R3 R1 5
sll R3 R1 1
srl R3 R1 1
sra R3 R1 1
ror R3 R1 1
bne R1 R2 L2
add R0 R0 R0
add R0 R0 R0
L2:
blt R1 R2 L3
add R0 R0 R0
add R0 R0 R0
L3:
bge R1 R2 L4
add R0 R0 R0
add R0 R0 R0
L4:
sw R1 1(R2)
lw R3 1(R2)
addi R1 R1 1
imm 100
j L5
add R0 R0 R0
L5:
jal L6
add R0 R0 R0
L6:
jalr R1 R0