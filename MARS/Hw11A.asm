.data
Sent: .asciiz "Enter a string: "
newline: .asciiz "\n"
string: .space 100
.text

main:
    li $v0, 4
    la $a0, Sent
    syscall
    li $v0, 8
    la $a0, string
    li $a1, 100
    syscall
    li $t0, 0
    la $t1, string
    
Loop:
    lb $t2, ($t1)
    beq $t2, $zero, Done 
    blt $t2, 48, Inc 
    bgt $t2, 57, Inc 
    sub $t2, $t2, 48   
    lb $t3, 1($t1)
    blt $t3, 48, Add
    bgt $t3, 57, Add
    sub $t3, $t3, 48  
    addi $t1, $t1, 1
   
Double:
    blt $t3, 0, Add 
    bgt $t3, 9, Add
    mul $t2, $t2, 10  
    add $t2, $t2, $t3 
    addi $t1, $t1, 1  
    lb $t3, ($t1)    
    sub $t3, $t3, 48  
    j Double
        
Print:
    li $v0, 1
    la $a0, ($t0)
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    add $t0, $zero, $zero
    j Inc

Add:
    add $t0, $t0, $t2
    j Print
    
Inc:
    addi $t1, $t1, 1
    j Loop
          
Done:    
    li $v0, 10
    syscall