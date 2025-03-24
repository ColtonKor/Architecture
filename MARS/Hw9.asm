.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "Factorial: "
nl: .asciiz "\n"

.text

main:
    li $v0, 4            
    la $a0, msg1  #printf("Enter a number: ");
    syscall

    li $v0, 5            
    syscall      #scanf("%d", &factor);
    move $a0, $v0        
    addi $a0, $a0, 1

    jal Enter            
    move $s0, $v0        

    li $v0, 4            
    la $a0, msg2
    syscall

    li $v0, 1            
    la $a0, ($t0)        #printf("Factorial: %d", sum);
    syscall

    li $v0, 4            
    la $a0, nl
    syscall

    li $v0, 10          
    syscall
    
    
    
 Enter:
    addi $sp, $sp, -4    
    sw $ra, 0($sp)      
    sw $a0, 4($sp)       
    li $t0, 1           
    li $t1, 1            

loop:
    beq $t1, $a0, exit 
    mul $t0, $t0, $t1     
    addi $t1, $t1, 1         #  for(int i = 1; i <= factor; i++){
    move $s0, $t1            #      sum *= i;
    move $s0, $t1            #  }
    j loop          

exit:
    lw $a0, 4($sp)       
    lw $ra, 0($sp)       
    addi $sp, $sp, 4     
    jr $ra               
