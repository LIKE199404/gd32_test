    .syntax unified
    .cpu cortex-m4
    .fpu softvfp
    .thumb

    .global g_pfnVectors
    .extern InitData

    .section .text.ReseHandler
    .weak ReseHandler
    .type ReseHandler,%function
ReseHandler:
    bl InitData
    bl SystemInit
    bl __libc_init_array
    bl main
    bx lr

    .section .text.HardFaultHandler
    .type HardFaultHandler,%function
HardFaultHandler:
    TST LR,#4
    ITE EQ
    MRSEQ R0,MSP
    MRSNE R0,PSP
    B IrqHandFaultHandler

    .section .isr_vector,"a",%progbits
    .type ResetVector,%object
ResetVector:
    .word .g_estack
    
NMHandler:
    .word _NMHandler


    