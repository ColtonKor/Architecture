.data
size:   .word 10
prompt: .asciiz "Enter Array values: "
avgMsg: .asciiz "Average = "
rangeMsg: .asciiz "Range = "
newline: .asciiz "\n"
array:  .space 40

.text
.globl main

main:
    # Initialize variables
    li $t0, 0          # i = 0
    la $a0, prompt     # Print prompt
    li $v0, 4
    syscall

    # Read array values
read_loop:
    beq $t0, 10, calculate_average   # Exit loop if i == size
    la $a0, array       # Address of array
    add $a0, $a0, $t0   # Calculate array element address
    li $v0, 5           # Read integer
    syscall
    sw $v0, 0($a0)      # Store input value in array
    addi $t0, $t0, 1    # Increment i
    j read_loop

calculate_average:
    # Calculate average
    l.s $f0, 0($a0)     # Initialize sum
    li $t1, 0           # Initialize i
    li $t2, 0           # Initialize sum
average_loop:
    beq $t1, 10, calculate_range  # Exit loop if i == size
    la $t3, array       # Address of array
    add $t3, $t3, $t1   # Calculate array element address
    lw $t4, 0($t3)      # Load array element
    add $t2, $t2, $t4   # Add array element to sum
    addi $t1, $t1, 1    # Increment i
    j average_loop

calculate_range:
    # Calculate range
    lw $t5, array       # Load first element as min and max
    move $t6, $t5       # Move value to t6 as max
    li $t1, 0           # Initialize i
range_loop:
    beq $t1, 10, print_results   # Exit loop if i == size
    la $t3, array       # Address of array
    add $t3, $t3, $t1   # Calculate array element address
    lw $t4, 0($t3)      # Load array element
    blt $t4, $t5, update_min    # Compare with min
    bgt $t4, $t6, update_max    # Compare with max
    addi $t1, $t1, 1    # Increment i
    j range_loop

update_min:
    move $t5, $t4       # Update min
    j range_loop

update_max:
    move $t6, $t4       # Update max
    j range_loop

print_results:
    # Print average
    la $a0, avgMsg
    li $v0, 4
    syscall
    mov.s $f1, $f0      # Copy average to $f1
    li $v0, 2           # Print float
    syscall
    la $a0, newline
    li $v0, 4
    syscall

    # Print range
    la $a0, rangeMsg
    li $v0, 4
    syscall
    sub $v0, $t6, $t5   # Calculate range
    move $a0, $v0       # Move range to $a0
    li $v0, 1           # Print integer
    syscall

    # Exit program
    li $v0, 10
    syscall