	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"rsa_no_logs.c"
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
	@ link register save eliminated.
	mul	r3, r0, r3
	push	{r4, r5}
	umull	r4, r5, r0, r2
	mla	r2, r2, r1, r3
	add	r5, r2, r5
	mov	r0, r4
	mov	r1, r5
	pop	{r4, r5}
	bx	lr
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
	@ link register save eliminated.
	adds	r0, r0, r2
	adc	r1, r1, r3
	bx	lr
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
	bl	__aeabi_uldivmod
	pop	{r4, pc}
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
	vdiv.f64	d0, d0, d1
	bx	lr
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
	b	log
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
	bl	__aeabi_uldivmod
	mov	r0, r2
	mov	r1, r3
	pop	{r4, pc}
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
	@ link register save eliminated.
	and	r0, r0, r2
	and	r1, r1, r3
	bx	lr
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
	lsl	r0, r0, r1
	bx	lr
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
	mov	r4, r1
.L14:
	mov	r1, r4
	bl	__aeabi_idivmod
	cmp	r1, #0
	mov	r0, r4
	popeq	{r4, pc}
	mov	r4, r1
	b	.L14
	.size	gcd, .-gcd
	.global	__aeabi_d2ulz
	.align	2
	.global	exponentiateAndMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	exponentiateAndMod, %function
exponentiateAndMod:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	vmov	s15, r2	@ int
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vcvt.f64.s32	d0, s15
	sub	sp, sp, #20
	str	r2, [sp, #12]
	mov	r4, r0
	mov	r8, r1
	mov	r9, r3
	bl	log
	vldr.64	d7, .L28
	vdiv.f64	d7, d0, d7
	vmov	r0, r1, d7
	bl	__aeabi_d2ulz
	adds	fp, r0, #1
	cmp	fp, #0
	ble	.L22
	mov	r7, #0
	mov	r2, r9
	mov	r5, #1
	mov	r6, r7
	asr	r3, r9, #31
	strd	r2, [sp]
.L21:
	mul	r3, r4, r8
	umull	r0, r1, r4, r4
	add	r1, r1, r3, lsl #1
	ldrd	r2, [sp]
	bl	__aeabi_uldivmod
	mov	r1, #1
	mov	r9, r3
	ldr	r3, [sp, #12]
	mov	r10, r2
	ands	r3, r3, r1, lsl r7
	add	r7, r7, r1
	beq	.L20
	ldrd	r2, [sp]
	mul	r8, r5, r8
	umull	r0, r1, r5, r4
	mla	r6, r4, r6, r8
	add	r1, r6, r1
	bl	__aeabi_uldivmod
	mov	r5, r2
	mov	r6, r3
.L20:
	cmp	r7, fp
	mov	r4, r10
	mov	r8, r9
	bne	.L21
	mov	r0, r5
	mov	r1, r6
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L22:
	mov	r5, #1
	mov	r6, #0
	mov	r0, r5
	mov	r1, r6
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L29:
	.align	3
.L28:
	.word	-17155601
	.word	1072049730
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
	subs	lr, r1, #0
	ble	.L37
	ldrb	r1, [r0]	@ zero_extendqisi2
	sub	r3, r1, #97
	uxtb	r2, r3
	cmp	r2, #25
	bhi	.L32
	movw	ip, #:lower16:.LANCHOR0
	sub	r2, lr, #1
	movt	ip, #:upper16:.LANCHOR0
	add	r1, ip, r2, lsl #3
	ldr	r1, [r1, #4]
	cmp	r2, #0
	mul	r1, r3, r1
	ldr	r2, [ip, r2, lsl #3]
	asr	r5, r3, #31
	mla	r1, r2, r5, r1
	mov	r4, r3
	umull	r2, r3, r2, r3
	add	r3, r1, r3
	beq	.L30
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #2
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #3
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #4
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #5
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #5]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #6
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #6]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #7
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #7]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #8
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #8]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #9
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #9]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L32
	sub	r8, lr, #10
	add	r1, ip, r8, lsl #3
	ldr	r1, [r1, #4]
	ldr	r5, [ip, r8, lsl #3]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L30
	ldrb	r1, [r0, #10]	@ zero_extendqisi2
	sub	r5, r1, #97
	uxtb	r4, r5
	cmp	r4, #25
	bhi	.L32
	sub	lr, lr, #11
	add	r1, ip, lr, lsl #3
	ldr	r1, [r1, #4]
	ldr	r4, [ip, lr, lsl #3]
	mul	r1, r5, r1
	asr	r7, r5, #31
	mla	r1, r4, r7, r1
	mov	r6, r5
	umull	r4, r5, r4, r5
	add	r5, r1, r5
	adds	r2, r2, r4
	adc	r3, r3, r5
	cmp	lr, #0
	ldrbne	r1, [r0, #11]	@ zero_extendqisi2
	beq	.L30
.L32:
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	mov	r0, #0
	bl	exit
.L37:
	mov	r2, #0
	mov	r3, #0
.L30:
	mov	r0, r2
	mov	r1, r3
	pop	{r4, r5, r6, r7, r8, pc}
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
	mov	r8, r2
	mov	r4, r0
	add	r0, r2, #1
	mov	r5, r1
	bl	malloc
	cmp	r8, #0
	mov	r7, r0
	ble	.L70
	movw	r6, #:lower16:.LANCHOR0
	sub	r3, r8, #1
	movt	r6, #:upper16:.LANCHOR0
	add	r2, r6, r3, lsl #3
	ldr	r9, [r6, r3, lsl #3]
	ldr	r10, [r2, #4]
	mov	r0, r4
	mov	r3, r10
	mov	r2, r9
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	ip, r0, #97
	mul	r1, ip, r10
	asr	r3, ip, #31
	mla	r1, r9, r3, r1
	umull	r2, r3, ip, r9
	subs	r4, r4, r2
	add	r3, r1, r3
	sbc	r5, r5, r3
	cmp	r8, #1
	strb	r0, [r7]
	beq	.L70
	sub	r3, r8, #2
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #2
	strb	r0, [r7, #1]
	beq	.L70
	sub	r3, r8, #3
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #3
	strb	r0, [r7, #2]
	beq	.L70
	sub	r3, r8, #4
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #4
	strb	r0, [r7, #3]
	beq	.L70
	sub	r3, r8, #5
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #5
	strb	r0, [r7, #4]
	beq	.L70
	sub	r3, r8, #6
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #6
	strb	r0, [r7, #5]
	beq	.L70
	sub	r3, r8, #7
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #7
	strb	r0, [r7, #6]
	beq	.L70
	sub	r3, r8, #8
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #8
	strb	r0, [r7, #7]
	beq	.L70
	sub	r3, r8, #9
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	r0, r0
	sub	r1, r0, #97
	mul	r9, r1, r9
	asr	r3, r1, #31
	mla	r9, r10, r3, r9
	umull	r10, fp, r1, r10
	subs	r4, r4, r10
	add	fp, r9, fp
	sbc	r5, r5, fp
	cmp	r8, #9
	strb	r0, [r7, #8]
	beq	.L70
	sub	r3, r8, #10
	add	r2, r6, r3, lsl #3
	ldr	r10, [r6, r3, lsl #3]
	ldr	r9, [r2, #4]
	mov	r0, r4
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	uxtb	ip, r0
	sub	r2, ip, #97
	mul	r9, r2, r9
	asr	r1, r2, #31
	mla	r9, r10, r1, r9
	umull	r2, r3, r2, r10
	subs	r0, r4, r2
	add	r3, r9, r3
	sbc	r1, r5, r3
	cmp	r8, #10
	strb	ip, [r7, #9]
	beq	.L70
	add	r3, r6, r8, lsl #3
	ldrd	r2, [r3, #-88]
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	strb	r0, [r7, #10]
.L70:
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	decodeMessage, .-decodeMessage
	.global	__aeabi_idiv
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #1
	sub	sp, sp, #20
	ble	.L121
	ldr	r4, [r1, #4]
	mov	r0, r4
	bl	strlen
	cmp	r0, #5
	str	r0, [sp, #12]
	bhi	.L122
	mov	r0, r4
	ldr	r1, [sp, #12]
	bl	encodeMessage
	strd	r0, [sp]
	mov	r0, #0
	bl	time
	movw	r5, #:lower16:.LANCHOR0
	bl	srand
	mov	fp, #0
	movt	r5, #:upper16:.LANCHOR0
.L107:
	bl	rand
	ldr	r1, [r5, #388]
	bl	__aeabi_idivmod
	add	r1, r5, r1, lsl #2
	ldr	r4, [r1, #88]
	bl	rand
	ldr	r1, [r5, #388]
	bl	__aeabi_idivmod
	ldrd	r8, [sp]
	add	r1, r5, r1, lsl #2
	ldr	r2, [r1, #88]
	mul	r6, r2, r4
	asr	r1, r6, #31
	cmp	r1, r9
	cmpeq	r6, r8
	movcc	r3, #1
	movcs	r3, #0
	cmp	r4, r2
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L107
	mov	r10, #2
	sub	r4, r4, #1
	sub	r2, r2, #1
	mul	r8, r2, r4
.L108:
	mov	r7, r8
	mov	r0, r10
	b	.L109
.L113:
	mov	r7, r1
.L109:
	mov	r1, r7
	bl	__aeabi_idivmod
	cmp	r1, #0
	mov	r0, r7
	bne	.L113
	cmp	r7, #1
	beq	.L123
.L110:
	add	r10, r10, #1
	b	.L108
.L123:
	tst	r10, #1
	beq	.L110
	sub	fp, r8, fp
	clz	fp, fp
	mov	r4, r1
	lsr	fp, fp, #5
	add	r7, r8, #1
.L111:
	mov	r0, r7
	mov	r1, r10
	bl	__aeabi_idivmod
	cmp	r1, #0
	moveq	r1, fp
	movne	r1, #1
	cmp	r1, #0
	mov	r9, r7
	add	r7, r7, r8
	bne	.L111
	mov	r0, r9
	mov	r1, r10
	bl	__aeabi_idiv
	cmp	r10, r6
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, r0, lsr #31
	mov	fp, r0
	bne	.L107
	bl	rand
	add	r1, fp, fp, lsl #1
	asr	r1, r1, #1
	bl	__aeabi_idivmod
	mov	r3, r6
	mov	r5, r1
	ldrd	r0, [sp]
	mov	r2, r10
	bl	exponentiateAndMod
	mov	r8, r0
	mov	r9, r1
	mov	r3, r6
	mov	r2, fp
	bl	exponentiateAndMod
	ldr	r7, [sp, #12]
	mov	r2, r7
	bl	decodeMessage
	bl	free
	mov	r3, r6
	mov	r2, r5
	mov	r0, r8
	mov	r1, r9
	bl	exponentiateAndMod
	mov	r2, r7
	bl	decodeMessage
	bl	free
.L103:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L122:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r4, #1
	b	.L103
.L121:
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	mov	r4, #1
	b	.L103
	.size	main, .-main
	.global	number_of_primes
	.global	primes
	.global	powersOf10
	.data
	.align	3
	.set	.LANCHOR0,. + 0
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Invalid character provided: %c (please only provide"
	.ascii	" a message containing the letters a-j\012\000"
	.space	2
.LC1:
	.ascii	"Missing message, please include message as argument"
	.ascii	"\000"
.LC2:
	.ascii	"This program only supports up to a 5 character mess"
	.ascii	"age. Please try again with a shorter message\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
