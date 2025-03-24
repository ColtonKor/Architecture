# Colton Korhummel -- 3/23/2023# Your Name -- MM/DD/YYYY 
# hw7ex2.asm--  
# ******************** Homework 7 Exercise 2 ******************** # 
# This program will collect the following user information and 
# display it back to the user in this format. 
# Each string will allow for 32 characters: 
# First Name: yourfirstname 
# Last Name: yourlastname 
# Date of Birth: 1/1/1911 #
# ******************** User Profile ******************** # 


.data   				# GLOBAL VARIABLES go in the data segment     
			sym1: .asciiz " "
			sym2: .asciiz "/"			
			fn: .word 32 
			ln: .word 32
			Month: .word 32 
			Day: .word 32
			Year: .word 32
			Buffer: .space 
			Temp1: .asciiz "What is your first name? "
			Temp2: .asciiz "What is your last name? "
			Temp3: .asciiz "What is your Birth Month? "
			Temp4: .asciiz "What is your Birth Day? "
			Temp5: .asciiz "What is your Birth Year? "
.text   				# All instructions go in the text segment 



# ***Begin the Main Program*** 

main:   
# Collect the user’s first name 
li $v0, 4
la $a0, Temp1 
syscall

li $v0, 8
la $a0, buffer

li $t0, 32
sw $t0, fn

# Collect the user’s last name
li $v0, 4
la $a0, Temp2
syscall

li $v0, 8
li $a1, 32
syscall
la $v0, ln
li $t1, 32
sw $t1, ln

# Collect the month number of the user’s birthday
li $v0, 4
la $a0, Temp3
syscall
	

li $v0, 8
li $a1, 32
syscall
la $v0, Month
li $t2, 32
sw $t2, Month

# Collect the day number of the user’s birthday
li $v0, 4
la $a0, Temp4
syscall
	
li $v0, 8
li $a1, 32
syscall
la $v0, Day
li $t3, 32
sw $t3, Day
# Collect the year number of the user’s birthday
li $v0, 4
la $a0, Temp5
syscall
	
li $v0, 8
li $a1, 32
syscall
la $v0, Year
li $t4, 32
sw $t4, Year

# Print out the user’s first name
lw $t0, fn
li $v0, 4
la $a0, fn
syscall
li $v0, 4
la $a0, sym1
syscall
# Print out the user’s last name
lw $t1, ln
li $v0, 4
la $a0, ln
syscall
li $v0, 4
la $a0, sym1
syscall
# Print out the user’s birthday
lw $t2, Month
li $v0, 4
la $a0, Month
syscall
li $v0, 4
la $a0, sym2
syscall
lw $t3, Day
li $v0, 4
la $a0, Day
syscall
li $v0, 4
la $a0, sym2
syscall
lw $t4, Year
li $v0, 4
la $a0, Year
syscall
# ** terminate program **  
li $v0, 10     
syscall 
# ***End the Main Program*** 
