.data
start: .asciiz "Enter a number: "
posi: .asciiz "Your number is positive"
nege: .asciiz "Your number is negative"
.text

main:
    li $v0, 4   
    la $a0, start
    syscall
    li $v0, 5  
    syscall
    move $a0, $v0
    jal isPositive
    beq $t0, 1 , negative
    j positive

isPositive:
    slti $t0, $a0, 0 
    jr $ra          

negative:
    li $v0, 4
    la $a0, nege
    syscall
    j end
    
positive:
    li $v0, 4 
    la $a0, posi
    syscall
    j end
    
end:
    li $v0, 10   
    syscall
