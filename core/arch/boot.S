/* @filename: boot.S
 *
 * This file is the entry point of ammaOS
 */
#include <mm/mm.h>

/* code is linked in .text.boot sections */
.section ".text.boot"

/* entry point, see ENTRY in linker.ld */
.globl _start
_start:
	mrs x0, mpidr_el1
	and x0, x0, #0xFF
	cbz x0, master
	b   proc_hang

/* infinite loop */
proc_hang:
	b   proc_hang

/* initialize section .bss */
master:
	adr x0, bss_begin
	adr x1, bss_end
	sub x1, x1, x0
	bl  memzero

	/* set the stack pointer point to 4MB memory */
	mov sp, #LOW_MEMORY

	/* jump to kernel_main */
	bl kernel_main

	/* if return then infinite loop */
	b  proc_hang
