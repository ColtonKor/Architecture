.data
start: .asciiz "Enter a number: "
posi: .asciiz "Your number is positive"
nege: .asciiz "Your number is negative"
.text

main:
    li $v0, 4   
    la $a0, start #Prints asking for user input
    syscall
    li $v0, 5  
    syscall #User inputs an integer
    move $a0, $v0
    jal isPositive #Calls is positive function
    beq $t0, 1 , negative #If value of isPositive is 1 it goes to negative
    j positive #otherwise it goes to positive

isPositive:
    slti $t0, $a0, 0 #if value is less than 0 it returns 1 otherwise it returns 0
    jr $ra          

negative:
    li $v0, 4
    la $a0, nege #Prints saying the number is a negative
    syscall
    j end
    
positive:
    li $v0, 4 
    la $a0, posi #Prints saying the number is a negative
    syscall
    j end
    
end:
    li $v0, 10 #Ends program   
    syscall
