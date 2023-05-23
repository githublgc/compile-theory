.arch armv5t
 @ text section code
 .text
 .align 2
 .section   .rodata
 .align 2

 _str0:
   .ascii "i love nankai!\n"
   .align 2
 
 .global main
 main:
 ldr   r0,_bridge
 
 bl printf 
 mov r0, #0
pop {fp, pc} @ return 0

 _bridge:
 
 .word _str0
 

 
	
