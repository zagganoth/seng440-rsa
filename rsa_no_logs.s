	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"rsa.c"
	.text
	.align	2
	.global	intMult
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intMult, %function
intMult:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mul	r3, r0, r3
	str	lr, [sp, #-4]!
	ldr	lr, .L3
	mla	r3, r2, r1, r3
	umull	r0, r1, r0, r2
	ldr	ip, [lr]
	add	r1, r3, r1
	add	ip, ip, #2
	str	ip, [lr]
	ldr	pc, [sp], #4
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	intMult, .-intMult
	.align	2
	.global	intAdd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intAdd, %function
intAdd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L7
	adds	r0, r0, r2
	ldr	ip, [lr]
	adc	r1, r1, r3
	add	ip, ip, #1
	str	ip, [lr]
	ldr	pc, [sp], #4
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	intAdd, .-intAdd
	.global	__aeabi_uldivmod
	.align	2
	.global	intDivide
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intDivide, %function
intDivide:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, .L11
	ldr	ip, [lr]
	mla	ip, ip, ip, ip
	add	ip, ip, #1
	str	ip, [lr]
	bl	__aeabi_uldivmod
	pop	{r4, pc}
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	intDivide, .-intDivide
	.align	2
	.global	doubleDivide
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	doubleDivide, %function
doubleDivide:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L14
	vdiv.f64	d0, d0, d1
	ldr	r3, [r2]
	mla	r3, r3, r3, r3
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.size	doubleDivide, .-doubleDivide
	.align	2
	.global	customLog
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	customLog, %function
customLog:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L17
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	log
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	customLog, .-customLog
	.align	2
	.global	intMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intMod, %function
intMod:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, .L21
	ldr	ip, [lr]
	lsl	ip, ip, #1
	add	ip, ip, #1
	str	ip, [lr]
	bl	__aeabi_uldivmod
	mov	r0, r2
	mov	r1, r3
	pop	{r4, pc}
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	intMod, .-intMod
	.align	2
	.global	bitwiseAnd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	bitwiseAnd, %function
bitwiseAnd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L25
	and	r0, r0, r2
	ldr	ip, [lr]
	and	r1, r1, r3
	add	ip, ip, #1
	str	ip, [lr]
	ldr	pc, [sp], #4
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	bitwiseAnd, .-bitwiseAnd
	.align	2
	.global	intLeftShift
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intLeftShift, %function
intLeftShift:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L28
	lsl	r0, r0, r1
	ldr	r3, [r2]
	lsl	r3, r3, r3
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.size	intLeftShift, .-intLeftShift
	.global	__aeabi_idivmod
	.align	2
	.global	gcd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gcd, %function
gcd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.L32:
	mov	r4, r1
	bl	__aeabi_idivmod
	cmp	r1, #0
	mov	r0, r4
	bne	.L32
	pop	{r4, pc}
	.size	gcd, .-gcd
	.global	__aeabi_d2ulz
	.align	2
	.global	exponentiateAndMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	exponentiateAndMod, %function
exponentiateAndMod:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9}
	vmov	s16, r2	@ int
	sub	sp, sp, #28
	vcvt.f64.s32	d0, s16
	mov	r10, r3
	mov	r7, r0
	mov	r6, r1
	bl	customLog
	vmov.f64	d9, d0
	vmov.f64	d0, #2.0e+0
	bl	customLog
	vdiv.f64	d7, d9, d0
	mov	r9, #0
	ldr	r5, .L49
	vmov	r0, r1, d7
	ldr	r2, [r5]
	mov	r4, #1
	mla	r2, r2, r2, r2
	add	r2, r2, #2
	str	r2, [r5]
	bl	__aeabi_d2ulz
	mov	r2, r10
	mov	r8, r9
	asr	r3, r10, #31
	strd	r2, [sp]
	adds	fp, r0, #1
	str	fp, [sp, #12]
.L36:
	ldr	r2, [sp, #12]
	ldr	r3, [r5]
	cmp	r9, r2
	blt	.L38
	mov	r1, #0
	bic	r2, fp, fp, asr #31
.L39:
	cmp	r2, #89
	ble	.L40
	cmp	r1, #0
	mov	r0, r4
	mov	r1, r8
	ldrne	r2, .L49
	strne	r3, [r2]
	add	sp, sp, #28
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L38:
	lsl	r3, r3, #1
	add	r3, r3, #5
	str	r3, [r5]
	umull	r0, r1, r7, r7
	mul	r3, r7, r6
	add	r1, r1, r3, lsl #1
	ldrd	r2, [sp]
	bl	__aeabi_uldivmod
	mov	r1, r9
	mov	r0, #1
	strd	r2, [sp, #16]
	bl	intLeftShift
	vmov	r3, s16	@ int
	tst	r0, r3
	ldr	r10, [r5]
	beq	.L37
	ldrd	r2, [sp]
	mul	r6, r4, r6
	umull	r0, r1, r4, r7
	mla	r8, r7, r8, r6
	add	r1, r8, r1
	bl	__aeabi_uldivmod
	mov	r4, r2
	mov	r8, r3
.L37:
	add	r10, r10, #4
	lsl	r10, r10, #1
	str	r10, [r5]
	add	r9, r9, #1
	ldr	r7, [sp, #16]
	ldr	r6, [sp, #20]
	b	.L36
.L40:
	lsl	r3, r3, #1
	add	r3, r3, #5
	lsl	r3, r3, r3
	add	r3, r3, #5
	add	r2, r2, #1
	lsl	r3, r3, #1
	mov	r1, #1
	b	.L39
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.size	exponentiateAndMod, .-exponentiateAndMod
	.align	2
	.global	encodeMessage
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	encodeMessage, %function
encodeMessage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	sub	r6, r0, #1
	mov	r0, #0
	mov	ip, r1
	mov	r1, r0
	ldr	r7, .L57
.L52:
	cmp	ip, #0
	pople	{r4, r5, r6, r7, r8, pc}
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	sub	r3, r2, #97
	uxtb	lr, r3
	cmp	lr, #25
	bls	.L53
	mov	r1, r2
	ldr	r0, .L57+4
	bl	printf
	mov	r0, #0
	bl	exit
.L53:
	sub	ip, ip, #1
	add	lr, r7, ip, lsl #3
	ldr	lr, [lr, #4]
	ldr	r2, [r7, ip, lsl #3]
	mul	lr, r3, lr
	asr	r5, r3, #31
	mla	lr, r2, r5, lr
	mov	r4, r3
	umull	r2, r3, r2, r3
	add	r3, lr, r3
	adds	r0, r0, r2
	adc	r1, r1, r3
	b	.L52
.L58:
	.align	2
.L57:
	.word	.LANCHOR0+8
	.word	.LC0
	.size	encodeMessage, .-encodeMessage
	.align	2
	.global	decodeMessage
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	decodeMessage, %function
decodeMessage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	add	r0, r2, #1
	mov	r7, r2
	mov	r8, r1
	bl	malloc
	mov	r5, #0
	mov	r9, r0
	ldr	r4, .L63
	add	r4, r4, r7, lsl #3
.L60:
	cmp	r5, r7
	sub	r4, r4, #8
	blt	.L61
	mov	r0, r9
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L61:
	ldr	fp, [r4]
	ldr	r10, [r4, #4]
	mov	r2, fp
	mov	r3, r10
	mov	r0, r6
	mov	r1, r8
	bl	__aeabi_uldivmod
	add	r2, r0, #97
	uxtb	r2, r2
	strb	r2, [r9, r5]
	sub	r2, r2, #97
	mul	r10, r2, r10
	asr	r1, r2, #31
	mla	r10, fp, r1, r10
	umull	r2, r3, r2, fp
	add	r3, r10, r3
	subs	r6, r6, r2
	sbc	r8, r8, r3
	add	r5, r5, #1
	b	.L60
.L64:
	.align	2
.L63:
	.word	.LANCHOR0+8
	.size	decodeMessage, .-decodeMessage
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrle	r0, .L82
	ble	.L81
	ldr	r4, [r1, #4]
	mov	r0, r4
	bl	strlen
	cmp	r0, #5
	mov	r7, r0
	bls	.L68
	ldr	r0, .L82+4
.L81:
	bl	puts
	mov	r6, #1
.L65:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L68:
	mov	r1, r0
	mov	r0, r4
	bl	encodeMessage
	strd	r0, [sp]
	mov	r0, #0
	bl	time
	bl	srand
	mov	r4, #0
	ldr	r10, .L82+8
.L69:
	bl	rand
	ldr	r1, [r10, #396]
	bl	__aeabi_idivmod
	add	r1, r10, r1, lsl #2
	ldr	r6, [r1, #96]
	bl	rand
	ldr	r1, [r10, #396]
	bl	__aeabi_idivmod
	ldrd	r8, [sp]
	add	r1, r10, r1, lsl #2
	ldr	r1, [r1, #96]
	mul	r5, r1, r6
	asr	r3, r5, #31
	cmp	r3, r9
	cmpeq	r5, r8
	movcc	r3, #1
	movcs	r3, #0
	cmp	r6, r1
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L69
	mov	fp, #2
	sub	r6, r6, #1
	sub	r3, r1, #1
	mul	r8, r3, r6
.L71:
	mov	r9, r8
	mov	r0, fp
.L72:
	mov	r1, r9
	bl	__aeabi_idivmod
	subs	r6, r1, #0
	mov	r0, r9
	bne	.L75
	cmp	r9, #1
	bne	.L73
	ands	r9, fp, #1
	beq	.L73
.L74:
	mov	r0, r9
	mov	r1, fp
	bl	__aeabi_idivmod
	adds	r1, r1, #0
	movne	r1, #1
	cmp	r8, r4
	orreq	r1, r1, #1
	cmp	r1, #0
	add	r9, r9, r8
	bne	.L74
	cmp	fp, r5
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, r0, lsr #31
	mov	r4, r0
	bne	.L69
	bl	rand
	add	r1, r4, r4, lsl #1
	asr	r1, r1, #1
	bl	__aeabi_idivmod
	mov	r3, r5
	mov	r10, r1
	ldrd	r0, [sp]
	mov	r2, fp
	bl	exponentiateAndMod
	mov	r8, r0
	mov	r9, r1
	mov	r3, r5
	mov	r2, r4
	bl	exponentiateAndMod
	mov	r2, r7
	bl	decodeMessage
	bl	free
	mov	r3, r5
	mov	r2, r10
	mov	r0, r8
	mov	r1, r9
	bl	exponentiateAndMod
	mov	r2, r7
	bl	decodeMessage
	bl	free
	b	.L65
.L73:
	add	fp, fp, #1
	b	.L71
.L75:
	mov	r9, r6
	b	.L72
.L83:
	.align	2
.L82:
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0
	.size	main, .-main
	.global	number_of_primes
	.global	primes
	.global	powersOf10
	.global	temp
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	temp, %object
	.size	temp, 4
temp:
	.word	5
	.space	4
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
	.type	number_of_primes, %object
	.size	number_of_primes, 4
number_of_primes:
	.word	75
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"Invalid character provided: %c (please only provide"
	.ascii	" a message containing the letters a-j\012\000"
.LC1:
	.ascii	"Missing message, please include message as argument"
	.ascii	"\000"
.LC2:
	.ascii	"This program only supports up to a 5 character mess"
	.ascii	"age. Please try again with a shorter message\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
