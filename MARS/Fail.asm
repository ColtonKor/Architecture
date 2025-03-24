.data
	msg1: .asciiz "Please Enter a Number: "
	msg2: .asciiz "The Factorial is "
	msg3: .asciiz "\n"
.text

main:
	li $v0, 4            # print the prompt string
    	la $a0, msg1
    	syscall

   	 li $v0, 5            # read an integer from the user
    	syscall
    	move $a0, $v0        # move the input value to the first argument register
    	addi $a0, $a0, 1
    	
	j free
    	jal fact             # call the factorial function
    	move $t0, $v0        # save the result in a temporary register

    	li $v0, 4            # print the result string
    	la $a0, msg2
   	syscall
   	
   	li $v0, 1            # print the result value
    	la $a0, ($t0)
    	syscall

    	li $v0, 4            # print a newline character
    	la $a0, msg3
    	syscall

    	li $v0, 10           # exit the program
    	syscall
free:
    addi $sp, $sp, -4
    sw $ra, 0($sp)       
    sw $a0, 4($sp)       
    li $t0, 1            
    li $t1, 1 

fact:
    beq $t1, $a0, exit
    mul $t0, $t0, $t1     
    addi $t1, $t1, 1      
    j fact   


exit:
    move $s0, $t0 
    lw $a0, 4($sp)       # restore the argument
    lw $ra, 0($sp)       # restore the return address
    addi $sp, $sp, 4     # release the stack space
    jr $ra  
	
