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
la $a0, start
syscall
li $v0, 6
syscall
mov.s $f0, $f0
li $v0, 4
la $a0, shape
syscall
li $v0, 5
syscall
move $s0, $v0
lw $t1, circ
lw $t2, tri
beq $s0, $t1, circle  
beq $s0, $t2, triangle 

circle:
l.s $f8, temp2
l.s $f7, pi
mul.s $f2, $f0, $f7
mul.s $f2, $f2, $f8
mul.s $f3, $f0, $f0
mul.s $f3, $f3, $f7
li $v0, 4
la $a0, msg1
syscall
mov.s $f12, $f0
li $v0, 2
syscall
li $v0, 4
la $a0, msg2
syscall
mov.s $f12, $f2
li $v0, 2
syscall
li $v0, 4
la $a0, nl
syscall
li $v0, 4
la $a0, msg3
syscall
mov.s $f12, $f0
li $v0, 2
syscall
li $v0, 4
la $a0, msg4
syscall
mov.s $f12, $f3
li $v0, 2
syscall
j exit

triangle:
l.s $f4, temp3
l.s $f1, temp1 
mul.s $f2, $f0, $f1 
sqrt.s $f3, $f1
div.s $f3, $f3, $f4
mul.s $f5, $f0, $f0
mul.s $f6, $f3, $f5
li $v0, 4
la $a0, msg5
syscall
mov.s $f12, $f0
li $v0, 2
syscall
li $v0, 4
la $a0, msg2
syscall
mov.s $f12, $f2
li $v0, 2
syscall
li $v0, 4
la $a0, nl
syscall
li $v0, 4
la $a0, msg6
syscall
mov.s $f12, $f0
li $v0, 2
syscall
li $v0, 4
la $a0, msg1
syscall
mov.s $f12, $f6
li $v0, 2
syscall
j exit

exit:
li $v0, 10
syscall
