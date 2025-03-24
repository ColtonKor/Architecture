.data
start: .asciiz "Enter a float: "
shape: .asciiz "Enter Shape(1 = Circle, 2 = Triangle): "
msg1: .asciiz "The circumference of the circle with radius = "
msg2: .asciiz " meters is "
msg3: .asciiz "The area of the circle with radius = "
msg4: .asciiz " square meters is "
msg5: .asciiz "The perimeter of the triangle with side = "
msg6: .asciiz "The area of the triangle with side = "
nl: .asciiz "\n"
circ: .word 1
tri: .word 2
input: .float
pi: .float 3.14
temp1: .float 3
temp2: .float 2
temp3: .float 4
.text

main:
  li $v0, 4
  la $a0, start #Asks user for size input
  syscall
  li $v0, 6
  syscall #actual size input from user
  mov.s $f0, $f0
  li $v0, 4
  la $a0, shape #string to ask for a shape
  syscall
  li $v0, 5
  syscall #user inputs a number for shape
  move $s0, $v0
  lw $t1, circ #loads circle and triangle numbers to then jump to function
  lw $t2, tri
  beq $s0, $t1, circle #if input equals 1 it goes to circle
  beq $s0, $t2, triangle #if input equals 2 it goes to triangle

circle:
  l.s $f8, temp2
  l.s $f7, pi #loads 3.14 and 2 so we can find circumference/area
  mul.s $f2, $f0, $f7 #times radius by 3.14
  mul.s $f2, $f2, $f8 #times new number 2
  mul.s $f3, $f0, $f0 #times radius by itself for area
  mul.s $f3, $f3, $f7 #times r^2 by 3.14
  li $v0, 4
  la $a0, msg1 #prints the message radius=
  syscall
  mov.s $f12, $f0 #moves the radius of circle so it can be printed
  li $v0, 2
  syscall #prints original size
  li $v0, 4
  la $a0, msg2 #prints message what the circumference =
  syscall
  mov.s $f12, $f2 #moves circumference to print
  li $v0, 2
  syscall #prints the circumference value
  li $v0, 4
  la $a0, nl #prints a new line
  syscall
  li $v0, 4
  la $a0, msg3 #says the radius = 
  syscall
  mov.s $f12, $f0 #moves the radius of circle so it can be printed
  li $v0, 2
  syscall #prints the radius
  li $v0, 4
  la $a0, msg4 #prints the message area =
  syscall
  mov.s $f12, $f3 #moves the circles area value so it can be printed
  li $v0, 2
  syscall #prints the value of the area
  j exit #exits function

triangle:
  l.s $f4, temp3
  l.s $f1, temp1 #loads 3,4 so we can use it to find area and perimeter
  mul.s $f2, $f0, $f1 #finds the perimeter by multiplying size and 3
  sqrt.s $f3, $f1 #finds the square root of 3 and puts it in f3
  div.s $f3, $f3, $f4 #divides the square root of 3 by 4
  mul.s $f5, $f0, $f0 #finds the square of size
  mul.s $f6, $f3, $f5 #times size squared and the square root of 3 divided by 4
  li $v0, 4
  la $a0, msg5 #prints perimeter with a size of
  syscall
  mov.s $f12, $f0 #moves the side size so we can print it
  li $v0, 2
  syscall #prints the size of the side
  li $v0, 4
  la $a0, msg2 #prints message for the actual perimeter
  syscall
  mov.s $f12, $f2 #moves perimeter so it can be printed
  li $v0, 2
  syscall #prints the actual perimeter
  li $v0, 4
  la $a0, nl #prints the new line
  syscall
  li $v0, 4
  la $a0, msg6 #message to showcase the input size
  syscall
  mov.s $f12, $f0 #moves the side size to be printed again
  li $v0, 2
  syscall #prints the original size
  li $v0, 4
  la $a0, msg1 #message to showcase the area
  syscall
  mov.s $f12, $f6 #moves the actual area of the triangle so it can be printed
  li $v0, 2
  syscall #prints the area of triangle 
  j exit #exits function

exit:
  li $v0, 10 #ends program
  syscall
