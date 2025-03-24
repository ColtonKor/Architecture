.data
array: .space 40
start: .asciiz "Enter 10 Numbers: "
ave: .asciiz "Average{"
ran: .asciiz "\nRange{"
equal: .asciiz "} = "
comma: .asciiz ","
size: .word 10
.text

main:
  lw $t1, size 
  la $a1, array     
  jal load
  li $v0, 4
  la $a0, ave
  syscall
  la $a1, array
  jal average
  jal print
  li $v0, 4
  la $a0, equal
  syscall
  li $v0, 2
  syscall
  li $v0, 4
  la $a0, ran
  syscall
  la $a1, array
  lw $t1, size
  jal print
  li $v0, 4
  la $a0, equal
  syscall
  la $a1, array
  lw $s1, ($a1) 
  lw $s2, ($a1)
  lw $t3, size
  jal range
  sub $s6, $s1, $s2
  li $v0, 1
  la $a0, ($s6)
  syscall
  j exit
  
load:
  li $v0, 4     
  la $a0, start    
  syscall    
  li $v0, 5          
  syscall        
  sw $v0, ($a1)    
  add $s0, $s0, $v0
  addi $a1, $a1, 4
  addi $t1, $t1, -1  
  bnez $t1, load   
  jr $ra


average:
lw $t1, size
mtc1 $t1, $f2
cvt.s.w $f5, $f2
mtc1 $s0, $f3
cvt.s.w $f4, $f3
div.s $f12, $f4, $f5   
jr $ra



range:
    lw $t4, ($a1)
    bgt $t4, $s1, max
    blt $t4, $s2, min
    addi $a1, $a1, 4
    addi $t3, $t3, -1
    bnez $t3, range
    jr $ra
    
min:
    move $s2, $t4
    j range

max:
    move $s1, $t4
    j range               
    
    
print:
  li $v0, 1         
  lw $a0, ($a1)     
  syscall          
  li $v0, 4
  la $a0, comma
  syscall
  addi $a1,$a1,4    
  addi $t1,$t1,-1   
  bnez $t1, print   
  jr $ra
    
exit:
    li $v0, 10
    syscall               
