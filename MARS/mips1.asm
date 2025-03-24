.data
array: .space 40     # Allocate 100 bytes for the array

.text

main:
    li $v0, 5           # System call code 5 for reading an integer
    li $t0, 0           # Counter for array index
    la $t1, array       # Load address of the array into $t1

loop:
    beq $t0, 10, exit   # If the counter equals 10, exit the loop
    
    move $a0, $t0       # Pass the counter value as an argument
    syscall             # Read an integer from the user
    
    sw $v0, array($t1)       # Store the user input in the array
    
    addi $t0, $t0, 1    # Increment the counter
    addi $t1, $t1, 4    # Move to the next element in the array

    j loop
 
sum:    
  lw $t1, array($t0)  # Load the number from array 
  addu $t2, $t2, $t1 # Compute the sum
  addi $t0,$t0,4    
  addi $t3,$t3,1      
  j sum
  


average:
#la  $a0, msg2
li  $v0, 4
syscall
div $t5, $t2, $s0   #average is taken out using the sum calculated above
#move $a0, $t5       #value moved to a0 register to be printed
li $v0, 1
la $a0, ($t5)
syscall 
j exit

exit:
    jr $ra