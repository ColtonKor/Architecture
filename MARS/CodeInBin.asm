.data
Choice: .word 3
Zero: .word 2

.text

main:

	lw $a2, Zero
	lw $s2, Choice
	beq $a2, $s2, Lip
	
	Lip:
	    li $v0, 1
	    la $a0, Choice
	
	
	
	