/* @filename: mm.S
 *
 * This file is to clear the memory section
 */
#include <mm/mm.h>

.globl memzero
memzero:
    str xzr, [x0], #8
    subs x1, x1, #8
    b.gt memzero
    ret
