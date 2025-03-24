.data
    input: .space 100    
    output: .space 100    
    prompt: .asciiz  "Enter a string: "

.text
main:

    li $v0, 4           
    la $a0, prompt     
    syscall


    li $v0, 8          
    la $a0, input       
    li $a1, 100         
    syscall


    la $t0, input       
    la $t1, output  
        
loop:
    lb $t2, ($t0)     
    beq $t2, $zero end  
    addi $t0, $t0, 1    
    blt $t2, 65, loop 
    bgt $t2, 90, loop 
    sb $t2, ($t1)       
    addi $t1, $t1, 1   
    j loop

end:
    li $v0, 4           
    la $a0, output      
    syscall


    li $v0, 10         
    syscall