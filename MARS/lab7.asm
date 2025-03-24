.data
	msg1: .asciiz "Enter F: "
	msg2: .asciiz "In celsius that is "
	nl: .asciiz "\n"
.text
main: #int main() {
#    float fahrenheit; $f1
#    printf("Enter F: ");
	la $a0, msg1
	li $v0, 4
	syscall

#    scanf("%f", &fahrenheit);
	li $v0, 6
	syscall

# calcCelsius takes in fahrenheit $f0
# and returns celsius on $f12
#    printf("In celsius that is %f", calcCelsius(fahrenheit));

	addi $sp, $sp, -4
	swc1 $f12, ($sp)
	jal calcCelsius
	
	la $a0, msg2
	li $v0, 4
	syscall

	li $v0, 2
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	j main

exit: #    return 0;
	li $v0, 10  #exit code for MARS
	syscall
#}

calcCelsius: #float calcCelsius(float f) {
# f is passed in on $f0; return on $f12
	addi $sp, $sp, -12
	swc1 $f1, 8($sp)
	swc1 $f2, 4($sp)
	swc1 $f3, 0($sp)



#    float offset = 32; $f1
	li $t0, 32
	mtc1 $t0, $f1
	cvt.s.w $f1, $f1

#    float mul = 5; $f2
	li $t0, 5
	mtc1 $t0, $f2
	cvt.s.w $f2, $f2

#    mul = mul/9;
	li $t0, 9
	mtc1 $t0, $f3
	cvt.s.w $f3, $f3
	div.s $f2, $f2, $f3
    
#    return (f-offset)*mul;
	sub.s $f0, $f0, $f1
	mul.s $f12, $f0, $f2 
	
return:
	swc1 $f1, 8($sp)
	swc1 $f2, 4($sp)
	swc1 $f3, 0($sp)
	addi $sp, $sp, 12

	jr $ra
#}
