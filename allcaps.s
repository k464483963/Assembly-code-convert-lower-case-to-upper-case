/*
 * Filename: allcaps.s
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Date:07/18/2020
 * Sources of help: tutors
 */

/*
 *Function Name: main();
 *Function Prototype: int main();
 *Description: This function would get all the character value store in 
 *Register and convert them from lower character to upper character.
 *Parameters: None
 *Side Effects: None
 *Error Conditions: None
 *Return value: return 1 if fail, return 0 if successful.
 *
 * Registers used:
 * <register> - <use> -- <description of what the value represents>
 * r0 - arg 1 -- store the character from r4(mesg) and keep track of 
 *		while loop index.
 * r4 - local var  -- store the mesg string.
 *  Stack variables:
 * <name> - <fp offset> -- <description of what the value represents> * 
 * example:
 * sum-[fp-8]--holdsthesumofvalues
 */


@ tell the assembler what the hardward is
	.arch	armv6			@ armv6 instruction set
	.cpu    cortex-a53		@ cpu type
	.syntax  unified		@ allow modern syntax

@ List external functions call and #defines and "magic" numbers
	.extern  putchar		@ pre-defined putchar function
	.equ     FP_OFFSET, 8		@ fp offset in frame

@ read-only data segment
	.section .rodata		@ start of read-only literals
mesg:  	.asciz	 "Hello World!\n"	@ store string to mesg

@ Text segment
	.text				@ start of the text segment
	.type	 main, %function	@ define main to be a function
	.global  main			@ make main global for linking

main:	
	push     {r4,fp,lr}		@ stack frame register save
	add      fp,sp, FP_OFFSET	@ locate our frame pointer

	ldr      r4, =mesg		@ store mesg to r4 register
	LDRB     r0, [r4]		@ dereference first char in r4

l0:  
	CMP      r0,0x0			@ while loop if r0 equal 0
	BEQ      l1			@ if r0 equal 0 then jump l1
	CMP      r0, 97			@ compare r0 and 97
	BGE      else			@ if r0 great than or equal to 97
					@ jump to else statement
	bl       putchar		@ if r0 less than 97 jump to putchar
				   	@ function
	ADD      r4,r4,1		@ move r4 pointer pointing to next
					@ char
	LDRB     r0,[r4]		@ dereference value from r4 to r0
	b        l0			@ back to l0 statement

else: 		
	sub      r0,r0,32		@ subtract r0 value to 32
	bl       putchar		@ jump to putchar function
	ADD      r4,r4,1		@ move r4 pointer pointing to next
					@ char
	LDRB     r0,[r4]		@ dereference value from r4 to r0
	b 	 l0			@ back to l0 statement

l1:	
	mov 	 r0,0			@ set return to EXIT_SUCCSS
	sub	 sp,fp,FP_OFFSET	@ restore stack frame top
	pop	 {r4,fp,lr}		@ remove stack frame and restore
	bx  	 lr			@ return to calling function

.end



