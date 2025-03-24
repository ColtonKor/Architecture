# Colton Korhummel -- 3/23/2023 
# hw7ex2.asm--  
# ******************** Homework 7 Exercise 2 ******************** # 
# This program will collect the following user information and 
# display it back to the user in this format. 
# Each string will allow for 32 characters: 
# First Name: yourfirstname 
# Last Name: yourlastname 
# Date of Birth: 1/1/1911 #
# ******************** User Profile ******************** # 


.data
first_name: .space 32    # allocate space for first name
last_name: .space 32     # allocate space for last name
DOB: .space 32           # allocate space for date of birth


msg1: .asciiz "Enter your first name: "
msg2: .asciiz "Enter your last name: "
msg3: .asciiz "Enter your Birthday (xx/xx/xxxx): "
msg4: .asciiz "\n\nHere is your information:\n"
msg5: .asciiz "First Name: "
msg6: .asciiz "Last Name: "
msg7: .asciiz "Date of Birth: "

.text
main:
    # prompt user for first name
    li $v0, 4
    la $a0, msg1
    syscall

    # read in first name
    li $v0, 8
    la $a0, first_name
    li $a1, 32
    syscall

    # prompt user for last name
    li $v0, 4
    la $a0, msg2
    syscall

    # read in last name
    li $v0, 8
    la $a0, last_name
    li $a1, 32
    syscall

    # prompt user for Birth Month
    li $v0, 4
    la $a0, msg3
    syscall

    # read in Birth Month
    li $v0, 8
    la $a0, DOB
    li $a1, 32
    syscall

    # print user's information
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 4
    la $a0, first_name
    syscall

    li $v0, 4
    la $a0, msg6
    syscall
    li $v0, 4
    la $a0, last_name
    syscall

    li $v0, 4
    la $a0, msg7
    syscall
    
    li $v0, 4
    la $a0, DOB
    syscall
    # exit program
    li $v0, 10
    syscall