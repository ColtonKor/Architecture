.data
Animal_prompt: .asciiz "Please enter an animal: "
Name_prompt: .asciiz "Please enter it's name: "
age_prompt: .asciiz "Please enter an Age: "
home_prompt: .asciiz "Please enter its building type: "
story1: .asciiz "Once upon a time, there was a " 
story2: .asciiz "his name was "
story3: .asciiz ", he loved to explore his neighborhood. He has been doing it for "
story4: .asciiz " years, but today he saw a new building which was a "
story5: .asciiz " and he decided to move in. The end.\n"
endline: .asciiz "\n"

Type: .space 32
age: .space 32
name: .space 32
home: .space 32

.text
main:
    # Type of animal
    li $v0, 4
    la $a0, Animal_prompt
    syscall
    
    # Read in Type of animal
    li $v0, 8
    la $a0, Type
    li $a1, 32
    syscall
    
    # Animals name
    li $v0, 4
    la $a0, Name_prompt
    syscall
    
    # Read in Animal name
    li $v0, 8
    la $a0, name
    li $a1, 32
    syscall
    
    # What age
    li $v0, 4
    la $a0, age_prompt
    syscall
    
    # Read in age
    li $v0, 5
    syscall
    move $t0, $v0
    
    # The animals home
    li $v0, 4
    la $a0, home_prompt
    syscall
    
    # Read in building
    li $v0, 8
    la $a0, home
    li $a1, 32
    syscall
    
    li $v0, 4
    la $a0, endline
    syscall
    
    # Print story with user inputs
    li $v0, 4
    la $a0, story1
    syscall
    li $v0, 4
    la $a0, Type
    syscall
    li $v0, 4
    la $a0, story2
    syscall
    li $v0, 4
    la $a0, name
    syscall
    li $v0, 4
    la $a0, story3
    syscall
    move $a1, $t0
    li $v0, 1
    la $a0, ($a1)
    syscall
    li $v0, 4
    la $a0, story4
    syscall
    li $v0, 4
    la $a0, home
    syscall
    li $v0, 4
    la $a0, story5
    syscall
    
    # Exit program
    li $v0, 10
    syscall