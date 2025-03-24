.data
Choice: .word 3
Zero: .word 0
First: .word 1
Second: .word 2


msg1: .asciiz "\nEnter your choice: "
msg2: .asciiz "\nGood choice "
msg3: .asciiz "\nBad choice "
msg4: .asciiz "\nUnknown choice"


.text

main:
	

    	Loop:
    		li $v0, 4
		la $a0, msg1
		syscall
	
		li $v0, 5
    		syscall
    		move $s0, $v0
    		lw $s1, Zero
    		lw $s2, First
    		lw $s3, Second
    	
    		beq $s0, $zero, exit
    	
    		beq $s0, $s2, GC
    		beq $s0, $s3, BC
    		bne $s0, $s2, Temp
	
    	
    	
    	GC:
    		li $v0, 4
    		la $a0, msg2
    		syscall
    		j Loop
    	
    	
    	BC:
    		li $v0, 4
    		la $a0, msg3
    		syscall
    		j Loop
    	
    	Temp:
    		bne $s0, $s3, UC
    	
    	UC:
    		li $v0, 4
    		la $a0, msg4
    		syscall
    		j Loop
    	
    	exit:
    		li $v0, 10
    		syscall
    	