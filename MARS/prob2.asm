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
  la $a1, array #Loads the size and the array to be used in load     
  jal load
  li $v0, 4
  la $a0, ave #Prints Average{
  syscall
  la $a1, array 
  lw $t1, size #Loads array and size for Average function
  jal average
  jal print #This prints the values in array
  li $v0, 4
  la $a0, equal
  syscall
  li $v0, 2 #Prints the average of the values in array
  syscall
  li $v0, 4
  la $a0, ran #Prints Range{
  syscall
  la $a1, array
  lw $t1, size #Loads array and size for print function
  jal print
  li $v0, 4
  la $a0, equal
  syscall
  la $a1, array
  lw $s1, ($a1) 
  lw $s2, ($a1) #Loads array, size, min, and max for range function
  lw $t3, size
  jal range
  sub $s6, $s1, $s2 #subtracts lowest from highest value
  li $v0, 1
  la $a0, ($s6) #Prints the range of the array
  syscall
  j exit
  
load:
  li $v0, 4     
  la $a0, start #Asking user for input
  syscall    
  li $v0, 5          
  syscall #actual input from user
  sw $v0, ($a1)  #stores it in array
  add $s0, $s0, $v0 #adds it to a sum
  addi $a1, $a1, 4  #rises the index
  addi $t1, $t1, -1  # subtracts 1 from size so when it reaches 0 it stops
  bnez $t1, load   
  jr $ra #returns


average:
  mtc1 $t1, $f2
  cvt.s.w $f5, $f2 #turns size into a float
  mtc1 $s0, $f3
  cvt.s.w $f4, $f3 #turns sum into a float so we can get a float average
  div.s $f12, $f4, $f5 #Divides sum and size
  jr $ra #returns



range:
  lw $t4, ($a1)
  bgt $t4, $s1, max #if array value is higher than current max jump to max
  blt $t4, $s2, min #if array value is lower than current min jump to min
  addi $a1, $a1, 4
  addi $t3, $t3, -1 #updates loop condition and array index
  bnez $t3, range
  jr $ra #returns
    
min:
  move $s2, $t4 #remember lowest value
  j range #go back to range

max:
  move $s1, $t4 #remember highest value
  j range #go back to range        
    
    
print:
  li $v0, 1         
  lw $a0, ($a1) #prints value of array  
  syscall          
  li $v0, 4
  la $a0, comma #prints a ,
  syscall
  addi $a1,$a1,4 #rises index
  addi $t1,$t1,-1 # subtracts 1 from size so when it reaches 0 it stops
  bnez $t1, print   
  jr $ra #returns
    
exit:
  li $v0, 10 #ends program
  syscall     
