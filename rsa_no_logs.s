	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"rsa_no_logs.c"
	.text
	.global	__aeabi_uldivmod
	.align	2
	.global	intMult
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intMult, %function
intMult:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #16
	strd	r0, [fp, #-20]
	strd	r2, [fp, #-28]
	ldrd	r0, [fp, #-20]
	ldrd	r2, [fp, #-28]
	adds	r4, r0, r2
	adc	r5, r1, r3
	ldrd	r2, [fp, #-20]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_uldivmod
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	mul	r2, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-20]
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	umull	r2, r3, r2, r3
	add	r1, r1, r3
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	intMult, .-intMult
	.align	2
	.global	intAdd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intAdd, %function
intAdd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #16
	strd	r0, [fp, #-20]
	strd	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	mul	r2, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-20]
	mul	r3, r1, r3
	add	r3, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-28]
	umull	r0, r1, r1, r2
	add	r3, r3, r1
	mov	r1, r3
	ldrd	r2, [fp, #-20]
	bl	__aeabi_uldivmod
	ldrd	r0, [fp, #-20]
	ldrd	r2, [fp, #-28]
	adds	r4, r0, r2
	adc	r5, r1, r3
	mov	r2, r4
	mov	r3, r5
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	intAdd, .-intAdd
	.align	2
	.global	intDivide
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intDivide, %function
intDivide:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	strd	r0, [fp, #-12]
	strd	r2, [fp, #-20]
	ldrd	r2, [fp, #-20]
	ldrd	r0, [fp, #-12]
	bl	__aeabi_uldivmod
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	intDivide, .-intDivide
	.align	2
	.global	doubleDivide
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	doubleDivide, %function
doubleDivide:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	vstr.64	d0, [fp, #-12]
	vstr.64	d1, [fp, #-20]
	vldr.64	d6, [fp, #-12]
	vldr.64	d7, [fp, #-20]
	vdiv.f64	d5, d6, d7
	vmov.f64	d7, d5
	vmov.f64	d0, d7
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	doubleDivide, .-doubleDivide
	.align	2
	.global	customLog
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	customLog, %function
customLog:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	vstr.64	d0, [fp, #-12]
	vldr.64	d0, [fp, #-12]
	bl	log
	vmov.f64	d7, d0
	vmov.f64	d0, d7
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	customLog, .-customLog
	.align	2
	.global	intMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intMod, %function
intMod:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	strd	r0, [fp, #-12]
	strd	r2, [fp, #-20]
	ldrd	r0, [fp, #-12]
	ldrd	r2, [fp, #-20]
	bl	__aeabi_uldivmod
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	intMod, .-intMod
	.align	2
	.global	bitwiseAnd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	bitwiseAnd, %function
bitwiseAnd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #16
	strd	r0, [fp, #-20]
	strd	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	mul	r2, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-20]
	mul	r3, r1, r3
	add	r3, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-28]
	umull	r0, r1, r1, r2
	add	r3, r3, r1
	mov	r1, r3
	ldrd	r2, [fp, #-20]
	bl	__aeabi_uldivmod
	ldrd	r0, [fp, #-20]
	ldrd	r2, [fp, #-28]
	and	r4, r0, r2
	and	r5, r1, r3
	mov	r2, r4
	mov	r3, r5
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	bitwiseAnd, .-bitwiseAnd
	.align	2
	.global	intLeftShift
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intLeftShift, %function
intLeftShift:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsl	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	intLeftShift, .-intLeftShift
	.global	powersOf10
	.data
	.align	3
	.type	powersOf10, %object
	.size	powersOf10, 88
powersOf10:
	.word	1
	.word	0
	.word	26
	.word	0
	.word	676
	.word	0
	.word	17576
	.word	0
	.word	456976
	.word	0
	.word	11881376
	.word	0
	.word	308915776
	.word	0
	.word	-558124416
	.word	1
	.word	-1626332928
	.word	48
	.word	665016832
	.word	1264
	.word	110568448
	.word	32868
	.global	primes
	.align	2
	.type	primes, %object
	.size	primes, 300
primes:
	.word	1571
	.word	3461
	.word	6131
	.word	9103
	.word	9013
	.word	2399
	.word	6977
	.word	3217
	.word	5081
	.word	6173
	.word	3461
	.word	4987
	.word	1031
	.word	1091
	.word	5689
	.word	8837
	.word	7297
	.word	1619
	.word	5573
	.word	5147
	.word	1499
	.word	9127
	.word	5147
	.word	4001
	.word	3319
	.word	9173
	.word	7043
	.word	6053
	.word	7351
	.word	8861
	.word	9601
	.word	1511
	.word	7057
	.word	5807
	.word	2309
	.word	2179
	.word	1019
	.word	8089
	.word	1951
	.word	5087
	.word	5623
	.word	3449
	.word	9371
	.word	4159
	.word	9311
	.word	8447
	.word	6599
	.word	5099
	.word	9749
	.word	8443
	.word	6143
	.word	2503
	.word	7589
	.word	2053
	.word	3851
	.word	2647
	.word	1657
	.word	7349
	.word	8123
	.word	4987
	.word	1213
	.word	1699
	.word	5387
	.word	3229
	.word	8377
	.word	8963
	.word	3257
	.word	7247
	.word	5081
	.word	9689
	.word	5839
	.word	3209
	.word	5839
	.word	3517
	.word	8501
	.global	number_of_primes
	.align	2
	.type	number_of_primes, %object
	.size	number_of_primes, 4
number_of_primes:
	.word	75
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	gcd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gcd, %function
gcd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
.L20:
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L18
	ldr	r3, [fp, #-20]
	b	.L21
.L18:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	b	.L20
.L21:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	gcd, .-gcd
	.global	__aeabi_d2ulz
	.align	2
	.global	exponentiateAndMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	exponentiateAndMod, %function
exponentiateAndMod:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	vpush.64	{d8}
	add	fp, sp, #20
	sub	sp, sp, #56
	strd	r0, [fp, #-68]
	str	r2, [fp, #-72]
	str	r3, [fp, #-76]
	mov	r2, #1
	mov	r3, #0
	strd	r2, [fp, #-28]
	ldrd	r2, [fp, #-68]
	strd	r2, [fp, #-44]
	ldrd	r2, [fp, #-68]
	strd	r2, [fp, #-52]
	ldr	r3, [fp, #-72]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmov.f64	d0, d7
	bl	customLog
	vmov.f64	d8, d0
	vmov.f64	d0, #2.0e+0
	bl	customLog
	vmov.f64	d7, d0
	vmov.f64	d1, d7
	vmov.f64	d0, d8
	bl	doubleDivide
	vmov	r2, r3, d0
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2ulz
	mov	r2, #1
	mov	r3, #0
	bl	intAdd
	mov	r2, r0
	mov	r3, r1
	mov	r3, r2
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L23
.L26:
	ldrd	r2, [fp, #-44]
	ldrd	r0, [fp, #-44]
	bl	intMult
	ldr	r3, [fp, #-76]
	mov	r2, r3
	asr	r3, r2, #31
	bl	intMod
	strd	r0, [fp, #-52]
	ldr	r3, [fp, #-72]
	mov	r4, r3
	asr	r5, r4, #31
	ldr	r1, [fp, #-32]
	mov	r0, #1
	bl	intLeftShift
	mov	r3, r0
	mov	r2, r3
	asr	r3, r2, #31
	mov	r0, r4
	mov	r1, r5
	bl	bitwiseAnd
	mov	r2, r0
	mov	r3, r1
	orrs	r3, r2, r3
	beq	.L24
	ldrd	r2, [fp, #-44]
	ldrd	r0, [fp, #-28]
	bl	intMult
	ldr	r3, [fp, #-76]
	mov	r2, r3
	asr	r3, r2, #31
	bl	intMod
	strd	r0, [fp, #-28]
	b	.L25
.L24:
	mov	r2, #1
	mov	r3, #0
	mov	r0, #1
	mov	r1, #0
	bl	intMult
	mov	r2, #1
	mov	r3, #0
	bl	intMod
.L25:
	ldrd	r2, [fp, #-52]
	strd	r2, [fp, #-44]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	asr	r1, r0, #31
	mov	r2, #1
	mov	r3, #0
	bl	intAdd
	mov	r2, r0
	mov	r3, r1
	mov	r3, r2
	str	r3, [fp, #-32]
.L23:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L26
	b	.L27
.L28:
	mov	r2, #1
	mov	r3, #0
	mov	r0, #1
	mov	r1, #0
	bl	intMult
	mov	r2, #1
	mov	r3, #0
	bl	intMod
	mov	r1, #1
	mov	r0, #1
	bl	intLeftShift
	mov	r3, r0
	mov	r2, r3
	asr	r3, r2, #31
	mov	r0, #1
	mov	r1, #0
	bl	bitwiseAnd
	mov	r2, #1
	mov	r3, #0
	mov	r0, #1
	mov	r1, #0
	bl	intMult
	mov	r2, #1
	mov	r3, #0
	bl	intMod
	ldr	r3, [fp, #-32]
	mov	r0, r3
	asr	r1, r0, #31
	mov	r2, #1
	mov	r3, #0
	bl	intAdd
	mov	r2, r0
	mov	r3, r1
	mov	r3, r2
	str	r3, [fp, #-32]
.L27:
	ldr	r3, [fp, #-32]
	cmp	r3, #89
	ble	.L28
	ldrd	r2, [fp, #-28]
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #20
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, fp, pc}
	.size	exponentiateAndMod, .-exponentiateAndMod
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Invalid character provided: %c (please only provide"
	.ascii	" a message containing the letters a-j\012\000"
	.text
	.align	2
	.global	encodeMessage
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	encodeMessage, %function
encodeMessage:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-28]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L31
.L34:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #122
	bhi	.L32
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #96
	bhi	.L33
.L32:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	mov	r0, #0
	bl	exit
.L33:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #97
	mov	r0, r3
	asr	r1, r0, #31
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	movw	r3, #:lower16:powersOf10
	movt	r3, #:upper16:powersOf10
	lsl	r2, r2, #3
	add	r3, r3, r2
	ldrd	r2, [r3]
	mul	lr, r2, r1
	mul	ip, r0, r3
	add	ip, lr, ip
	umull	r2, r3, r0, r2
	add	r1, ip, r3
	mov	r3, r1
	ldrd	r0, [fp, #-28]
	adds	r4, r0, r2
	adc	r5, r1, r3
	strd	r4, [fp, #-28]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L31:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L34
	ldrd	r2, [fp, #-28]
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	encodeMessage, .-encodeMessage
	.align	2
	.global	decodeMessage
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	decodeMessage, %function
decodeMessage:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	strd	r0, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L37
.L38:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	sub	r2, r3, #1
	movw	r3, #:lower16:powersOf10
	movt	r3, #:upper16:powersOf10
	lsl	r2, r2, #3
	add	r3, r3, r2
	ldrd	r2, [r3]
	ldrd	r0, [fp, #-28]
	bl	__aeabi_uldivmod
	mov	r2, r0
	mov	r3, r1
	uxtb	r2, r2
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	add	r2, r2, #97
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #97
	mov	r0, r3
	asr	r1, r0, #31
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	sub	r2, r3, #1
	movw	r3, #:lower16:powersOf10
	movt	r3, #:upper16:powersOf10
	lsl	r2, r2, #3
	add	r3, r3, r2
	ldrd	r2, [r3]
	mul	lr, r2, r1
	mul	ip, r0, r3
	add	ip, lr, ip
	umull	r2, r3, r0, r2
	add	r1, ip, r3
	mov	r3, r1
	ldrd	r0, [fp, #-28]
	subs	r4, r0, r2
	sbc	r5, r1, r3
	strd	r4, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L37:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L38
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	decodeMessage, .-decodeMessage
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Missing message, please include message as argument"
	.ascii	"\000"
	.align	2
.LC2:
	.ascii	"This program only supports up to a 5 character mess"
	.ascii	"age. Please try again with a shorter message\000"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	ldr	r3, [fp, #-80]
	cmp	r3, #1
	bgt	.L41
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	mov	r3, #1
	b	.L42
.L41:
	ldr	r3, [fp, #-84]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #5
	ble	.L43
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r3, #1
	b	.L42
.L43:
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	encodeMessage
	strd	r0, [fp, #-36]
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #2
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L44
.L45:
	bl	rand
	mov	r2, r0
	movw	r3, #:lower16:number_of_primes
	movt	r3, #:upper16:number_of_primes
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	movw	r3, #:lower16:primes
	movt	r3, #:upper16:primes
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-40]
	bl	rand
	mov	r2, r0
	movw	r3, #:lower16:number_of_primes
	movt	r3, #:upper16:number_of_primes
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	movw	r3, #:lower16:primes
	movt	r3, #:upper16:primes
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-44]
	mul	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, r3
	asr	r3, r2, #31
	ldrd	r0, [fp, #-36]
	cmp	r1, r3
	cmpeq	r0, r2
	bhi	.L45
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	beq	.L45
	ldr	r3, [fp, #-40]
	sub	r3, r3, #1
	ldr	r2, [fp, #-44]
	sub	r2, r2, #1
	mul	r3, r2, r3
	str	r3, [fp, #-48]
	mov	r3, #2
	str	r3, [fp, #-12]
	b	.L46
.L47:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L46:
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-12]
	bl	gcd
	mov	r3, r0
	cmp	r3, #1
	bne	.L47
	ldr	r3, [fp, #-12]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L47
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L48
.L49:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L48:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	mul	r3, r2, r3
	add	r3, r3, #1
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	cmp	r3, #0
	bne	.L49
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	beq	.L49
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	mul	r3, r2, r3
	add	r3, r3, #1
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-16]
.L44:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L45
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L45
	bl	rand
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldrd	r0, [fp, #-36]
	bl	exponentiateAndMod
	strd	r0, [fp, #-60]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldrd	r0, [fp, #-60]
	bl	exponentiateAndMod
	strd	r0, [fp, #-68]
	ldr	r2, [fp, #-28]
	ldrd	r0, [fp, #-68]
	bl	decodeMessage
	str	r0, [fp, #-72]
	ldr	r0, [fp, #-72]
	bl	free
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-52]
	ldrd	r0, [fp, #-60]
	bl	exponentiateAndMod
	strd	r0, [fp, #-68]
	ldr	r2, [fp, #-28]
	ldrd	r0, [fp, #-68]
	bl	decodeMessage
	str	r0, [fp, #-72]
	ldr	r0, [fp, #-72]
	bl	free
	mov	r3, #0
.L42:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
