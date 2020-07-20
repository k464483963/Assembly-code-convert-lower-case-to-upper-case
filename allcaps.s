/*
 * Filename: allcaps.s
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Date:07/18/2020
 * Sources of help: tutors
 */

/*
* <Full C Header>
*
* Registers used:
* <register> - <use> -- <description of what the value represents>
* r0 - arg 1 -- store the character from r4(mesg) and keep track of 
*		while loop index.
* r4 - local var  -- store the mesg string.
*  Stack variables:
* <name> - <fp offset> -- <description of what the value represents> * example:
* sum-[fp-8]--holdsthesumofvalues
*/


@tell the assembler what the hardward is
	.arch    armv6
	.cpu     cortex-a53
	.syntax  unified

@List external functions call and #defines and "magic" numbers
	.extern  putchar 
	.equ     FP_OFFSET, 8

@read-only data segment
	.section .rodata
mesg:  	.asciz	 "Hello World!\n"

@Text segment
	.text
	.type	 main, %function
	.global  main
	
main:	
	push     {r4,fp,lr}
	add      fp,sp, FP_OFFSET
	ldr      r4, =mesg

	LDRB     r0, [r4]

   l0:  
	CMP      r0,0x0
	BEQ      l1
	CMP      r0, 97
	BGE      else
	bl       putchar
	ADD      r4,r4,1
	LDRB     r0,[r4]
	b        l0

   else: 
	sub      r0,r0,32
	bl       putchar
	ADD      r4,r4,1
	LDRB     r0,[r4]
	b 	 l0

   l1:	
	mov 	 r0,0
	sub	 sp,fp,FP_OFFSET
	pop	 {r4,fp,lr}
	bx  	 lr

.end
	
	
	
