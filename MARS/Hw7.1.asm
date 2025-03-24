# Colton Korhummel -- 3/23/2023 
# hw7ex1.asm--  
# ******************** Homework 7 Exercise 1 ******************** # 
# Program performs the following mathematical operation: 
#  f = (g + h) - (j - 12) 
# where: g = 12, h = 3, j = 27 
# 
# --Global Variables: # * print = Print out message - "f = " 
# ******************** Math Operations ******************** # 

.data   			# GLOBAL VARIABLES go in the data segment  
   			j: .word 27
   			g: .word 12
   			h: .word 3
   			f: .word 0
   			temp1: .word 0
   			temp2: .word 0
   			print: .asciiz "f = "
.text   			# All instructions go in the text segment 


# ***Begin the Main Program*** 

main:  
# f =  $s0
lw  $s0, f

# f = (g + h) - (j - 12)

# g = 12 -> g = $t0  
lw $t0, g

# h = 3 -> h = $t1    
lw $t1, h

# j = 27 -> j = $t2    
lw $t2, j

# $t3 = (j - 12)    
lw $t3, temp1
sub $t3, $t2, 12

# $t4 =  (g + h)    
lw $t4, temp2
add $t4, $t0, $t1

# f = $t4 - $t3    
sub $s0, $t4, $t3

# print out "f = " and $s0 
li $v0, 4
la $a0, print
syscall
li $v0, 1
la $a0, ($s0)
syscall



# ** terminate program ** 
li $v0, 10     
syscall 
# ***End the Main Program***
