#Laboratory Assignment 2
.text
# Load the test value for these function
li $s0, 0x12345678 
# Extract the MSB of $s0
andi $t0, $s0, 0xff000000
# Clear the LSB of $s0
andi $t1, $s0, 0xffffff00 
# Set the LSB of $s0
ori $t2, $s0, 0x000000ff 
# Exchange the MSB of $s0 with LSB
andi $t3, $s0, 0x000000ff # Extract the LSB of $s0 
srl $t4, $t0, 24 # Turn the MSB of $s0 to the LSB
add $s0, $t1, $t4
andi $s0, $s0, 0x00ffffff #Clear the MSB of $s0
sll $t4, $t3, 24 # Turn the LSB of $s0 to the MSB
add $s0, $s0, $t4
# Clear register s0
andi $s0,$s0,0x0


