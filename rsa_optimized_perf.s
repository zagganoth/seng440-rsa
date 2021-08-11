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
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [sp, #4]
	mul	lr, r0, r3
	cmp	ip, #0
	ldr	ip, [sp, #8]
	vmovne.f32	s14, #2.2e+1
	vldrne.32	s15, [ip]
	vaddne.f32	s15, s15, s14
	vstrne.32	s15, [ip]
	movw	ip, #:lower16:.LANCHOR0
	mla	lr, r2, r1, lr
	movt	ip, #:upper16:.LANCHOR0
	umull	r0, r1, r0, r2
	ldr	r3, [ip]
	add	r1, lr, r1
	add	r3, r3, #2
	str	r3, [ip]
	ldr	pc, [sp], #4
	.size	intMult, .-intMult
	.align	2
	.global	intAdd
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intAdd, %function
intAdd:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [sp, #4]
	cmp	ip, #0
	ldr	ip, [sp, #8]
	vmovne.f32	s14, #2.2e+1
	vldrne.32	s15, [ip]
	vaddne.f32	s15, s15, s14
	vstrne.32	s15, [ip]
	movw	ip, #:lower16:.LANCHOR0
	movt	ip, #:upper16:.LANCHOR0
	ldr	lr, [ip]
	adds	r0, r0, r2
	add	r2, lr, #1
	adc	r1, r1, r3
	str	r2, [ip]
	ldr	pc, [sp], #4
	.size	intAdd, .-intAdd
	.global	__aeabi_uldivmod
	.align	2
	.global	intDivide
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intDivide, %function
intDivide:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	ip, [sp, #16]
	mov	r5, r1
	ldr	r1, [sp, #20]
	cmp	ip, #0
	vldrne.32	s15, [r1]
	vmovne.f32	s14, #2.2e+1
	movw	lr, #:lower16:.LANCHOR0
	vaddne.f32	s15, s15, s14
	movt	lr, #:upper16:.LANCHOR0
	vstrne.32	s15, [r1]
	ldr	r1, [lr]
	mov	r4, r0
	mla	r1, r1, r1, r1
	add	ip, r1, #1
	str	ip, [lr]
	mov	r1, r5
	bl	__aeabi_uldivmod
	pop	{r4, r5, r6, pc}
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
	cmp	r0, #0
	vldrne.32	s15, [r1]
	vmovne.f32	s14, #2.2e+1
	movw	r2, #:lower16:.LANCHOR0
	vaddne.f32	s15, s15, s14
	movt	r2, #:upper16:.LANCHOR0
	ldr	r3, [r2]
	vstrne.32	s15, [r1]
	mla	r3, r3, r3, r3
	add	r3, r3, #1
	vdiv.f64	d0, d0, d1
	str	r3, [r2]
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
	cmp	r0, #0
	vldrne.32	s15, [r1]
	vmovne.f32	s14, #2.2e+1
	movw	r3, #:lower16:.LANCHOR0
	vaddne.f32	s15, s15, s14
	movt	r3, #:upper16:.LANCHOR0
	ldr	r2, [r3]
	vstrne.32	s15, [r1]
	add	r2, r2, #1
	str	r2, [r3]
	b	log
	.size	customLog, .-customLog
	.align	2
	.global	intMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	intMod, %function
intMod:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, [sp, #8]
	movw	lr, #:lower16:.LANCHOR0
	cmp	ip, #0
	ldr	ip, [sp, #12]
	vmovne.f32	s14, #2.2e+1
	vldrne.32	s15, [ip]
	vaddne.f32	s15, s15, s14
	movt	lr, #:upper16:.LANCHOR0
	vstrne.32	s15, [ip]
	ldr	ip, [lr]
	lsl	ip, ip, #1
	add	ip, ip, #1
	str	ip, [lr]
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
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [sp, #4]
	and	r0, r0, r2
	cmp	ip, #0
	ldr	ip, [sp, #8]
	vmovne.f32	s14, #2.2e+1
	vldrne.32	s15, [ip]
	vaddne.f32	s15, s15, s14
	vstrne.32	s15, [ip]
	movw	ip, #:lower16:.LANCHOR0
	movt	ip, #:upper16:.LANCHOR0
	ldr	lr, [ip]
	and	r1, r1, r3
	add	r2, lr, #1
	str	r2, [ip]
	ldr	pc, [sp], #4
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
	cmp	r2, #0
	vldrne.32	s15, [r3]
	vmovne.f32	s14, #2.2e+1
	movw	r2, #:lower16:.LANCHOR0
	vaddne.f32	s15, s15, s14
	movt	r2, #:upper16:.LANCHOR0
	vstrne.32	s15, [r3]
	ldr	r3, [r2]
	lsl	r0, r0, r1
	lsl	r3, r3, r3
	add	r3, r3, #1
	str	r3, [r2]
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
.L48:
	mov	r1, r4
	bl	__aeabi_idivmod
	cmp	r1, #0
	mov	r0, r4
	popeq	{r4, pc}
	mov	r4, r1
	b	.L48
	.size	gcd, .-gcd
	.global	__aeabi_d2ulz
	.align	2
	.global	exponentiateAndMod
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	exponentiateAndMod, %function
exponentiateAndMod:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	fp, #:lower16:.LANCHOR1
	vpush.64	{d8}
	vmov	s15, ip	@ int
	movt	fp, #:upper16:.LANCHOR1
	sub	sp, sp, #36
	str	r2, [sp, #16]
	ldr	r2, [fp]
	vcvt.f64.s32	d0, s15
	cmp	r2, #0
	vldrne.32	s15, [fp, #4]
	vmovne.f32	s14, #2.2e+1
	movw	r5, #:lower16:.LANCHOR0
	vaddne.f32	s15, s15, s14
	movt	r5, #:upper16:.LANCHOR0
	mov	r10, r3
	ldr	r3, [r5]
	vstrne.32	s15, [fp, #4]
	add	r3, r3, #1
	mov	r4, r0
	mov	r6, r1
	str	r5, [sp, #20]
	str	r3, [r5]
	bl	log
	ldr	r7, [fp]
	cmp	r7, #0
	beq	.L54
	vldr.64	d7, .L84
	vdiv.f64	d7, d0, d7
	vmov.f32	s17, #2.2e+1
	vldr.32	s16, [fp, #4]
	vmov	r0, r1, d7
	bl	__aeabi_d2ulz
	vadd.f32	s16, s16, s17
	adds	r3, r0, #1
	cmp	r3, #0
	mov	r8, r3
	vadd.f32	s16, s16, s17
	str	r3, [sp, #24]
	movle	r3, #0
	ldr	r9, [r5]
	vadd.f32	s16, s16, s17
	add	r9, r9, #1
	mla	r9, r9, r9, r9
	strle	r3, [sp, #4]
	add	r9, r9, #2
	movle	r5, #1
	movle	r8, r3
	ble	.L56
	mov	r2, r10
	mov	r7, #0
	asr	r3, r10, #31
	mov	r5, #1
	mov	r10, r9
	str	r7, [sp, #4]
	strd	r2, [sp, #8]
	mov	r9, r8
	str	fp, [sp, #28]
	b	.L70
.L82:
	ldr	r3, [sp, #4]
	umull	r0, r1, r4, r5
	mul	r3, r4, r3
	mla	r6, r5, r6, r3
	ldrd	r2, [sp, #8]
	add	r1, r6, r1
	bl	__aeabi_uldivmod
	add	r7, r7, #1
	add	r10, r10, #5
	cmp	r7, r9
	vadd.f32	s16, s16, s17
	mov	r5, r2
	str	r3, [sp, #4]
	lsl	r10, r10, #1
	beq	.L80
.L61:
	mov	r4, fp
	mov	r6, r8
.L70:
	vadd.f32	s16, s16, s17
	vadd.f32	s16, s16, s17
	vadd.f32	s16, s16, s17
	vadd.f32	s16, s16, s17
	mul	r3, r4, r6
	umull	r0, r1, r4, r4
	add	r1, r1, r3, lsl #1
	ldrd	r2, [sp, #8]
	bl	__aeabi_uldivmod
	mov	r1, #1
	vadd.f32	s16, s16, s17
	lsl	r10, r10, #1
	mov	r8, r3
	ldr	r3, [sp, #16]
	add	r10, r10, #5
	lsl	r10, r10, r10
	ands	r3, r3, r1, lsl r7
	mov	fp, r2
	add	r3, r10, #5
	vadd.f32	s16, s16, s17
	bne	.L82
	add	r7, r7, #1
	cmp	r7, r9
	vadd.f32	s16, s16, s17
	lsl	r10, r3, #1
	bne	.L61
.L80:
	ldr	r3, [sp, #24]
	ldr	fp, [sp, #28]
	cmp	r3, #89
	ldr	r3, [sp, #20]
	mov	r8, r9
	str	r10, [r3]
	mov	r9, r10
	vstr.32	s16, [fp, #4]
	bgt	.L52
.L56:
	vmov.f32	s15, #2.2e+1
.L66:
	vadd.f32	s16, s16, s15
	vadd.f32	s16, s16, s15
	vadd.f32	s16, s16, s15
	vadd.f32	s16, s16, s15
	vadd.f32	s16, s16, s15
	vadd.f32	s16, s16, s15
	lsl	r3, r9, #1
	add	r3, r3, #5
	lsl	r3, r3, r3
	add	r8, r8, #1
	add	r9, r3, #5
	cmp	r8, #90
	vadd.f32	s16, s16, s15
	lsl	r9, r9, #1
	bne	.L66
	vstr.32	s16, [fp, #4]
	ldr	r3, [sp, #20]
	str	r9, [r3]
.L52:
	mov	r0, r5
	ldr	r1, [sp, #4]
	add	sp, sp, #36
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L54:
	vldr.64	d7, .L84
	vdiv.f64	d7, d0, d7
	ldr	r3, [sp, #20]
	vmov	r0, r1, d7
	ldr	r9, [r3]
	bl	__aeabi_d2ulz
	add	r9, r9, #1
	mla	r9, r9, r9, r9
	adds	r3, r0, #1
	cmp	r3, #0
	add	r9, r9, #2
	str	r3, [sp, #24]
	mov	r8, r3
	ble	.L71
	mov	r2, r10
	asr	r3, r10, #31
	mov	r5, #1
	mov	r10, r9
	strd	r2, [sp, #8]
	str	r7, [sp, #4]
	mov	r9, r8
	b	.L69
.L83:
	ldr	r3, [sp, #4]
	umull	r0, r1, r4, r5
	mul	r3, r4, r3
	mla	r6, r5, r6, r3
	ldrd	r2, [sp, #8]
	add	r1, r6, r1
	bl	__aeabi_uldivmod
	add	r7, r7, #1
	add	r10, r10, #5
	cmp	r9, r7
	mov	r5, r2
	str	r3, [sp, #4]
	lsl	r10, r10, #1
	beq	.L81
.L58:
	mov	r4, fp
	mov	r6, r8
.L69:
	mul	r3, r4, r6
	umull	r0, r1, r4, r4
	add	r1, r1, r3, lsl #1
	ldrd	r2, [sp, #8]
	bl	__aeabi_uldivmod
	mov	r1, #1
	lsl	r10, r10, #1
	mov	r8, r3
	ldr	r3, [sp, #16]
	add	r10, r10, #5
	lsl	r10, r10, r10
	ands	r3, r3, r1, lsl r7
	mov	fp, r2
	add	r3, r10, #5
	bne	.L83
	add	r7, r7, #1
	cmp	r7, r9
	lsl	r10, r3, #1
	bne	.L58
.L81:
	ldr	r3, [sp, #24]
	mov	r8, r9
	cmp	r3, #89
	ldr	r3, [sp, #20]
	mov	r9, r10
	str	r10, [r3]
	bgt	.L52
.L64:
	lsl	r3, r9, #1
	add	r3, r3, #5
	lsl	r3, r3, r3
	add	r8, r8, #1
	add	r9, r3, #5
	cmp	r8, #90
	lsl	r9, r9, #1
	bne	.L64
	ldr	r3, [sp, #20]
	str	r9, [r3]
	b	.L52
.L71:
	mov	r8, r7
	mov	r5, #1
	str	r7, [sp, #4]
	b	.L64
.L85:
	.align	3
.L84:
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
	ble	.L93
	ldrb	r1, [r0]	@ zero_extendqisi2
	sub	r3, r1, #97
	uxtb	r2, r3
	cmp	r2, #25
	bhi	.L88
	movw	ip, #:lower16:.LANCHOR0
	sub	r6, lr, #1
	movt	ip, #:upper16:.LANCHOR0
	add	r2, ip, r6, lsl #3
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #8]
	mul	r1, r3, r1
	asr	r5, r3, #31
	mla	r1, r2, r5, r1
	mov	r4, r3
	umull	r2, r3, r2, r3
	cmp	r6, #0
	add	r3, r1, r3
	beq	.L86
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #2
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #3
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #4
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #5
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #5]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #6
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #6]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #7
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #7]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #8
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #8]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #9
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #9]	@ zero_extendqisi2
	sub	r4, r1, #97
	uxtb	r5, r4
	cmp	r5, #25
	bhi	.L88
	sub	r8, lr, #10
	add	r5, ip, r8, lsl #3
	ldr	r1, [r5, #12]
	ldr	r5, [r5, #8]
	mul	r1, r4, r1
	asr	r7, r4, #31
	mla	r1, r5, r7, r1
	mov	r6, r4
	umull	r4, r5, r5, r4
	adds	r2, r2, r4
	add	r5, r1, r5
	adc	r3, r3, r5
	cmp	r8, #0
	beq	.L86
	ldrb	r1, [r0, #10]	@ zero_extendqisi2
	sub	r5, r1, #97
	uxtb	r4, r5
	cmp	r4, #25
	bhi	.L88
	sub	lr, lr, #11
	add	ip, ip, lr, lsl #3
	ldr	r1, [ip, #12]
	ldr	r4, [ip, #8]
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
	beq	.L86
.L88:
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	mov	r0, #0
	bl	exit
.L93:
	mov	r2, #0
	mov	r3, #0
.L86:
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
	mov	r6, r2
	mov	r4, r0
	add	r0, r2, #1
	mov	r5, r1
	bl	malloc
	cmp	r6, #0
	mov	r8, r0
	ble	.L126
	movw	r7, #:lower16:.LANCHOR0
	sub	r3, r6, #1
	movt	r7, #:upper16:.LANCHOR0
	add	r3, r7, r3, lsl #3
	ldr	r9, [r3, #8]
	ldr	r10, [r3, #12]
	mov	r2, r9
	mov	r3, r10
	mov	r0, r4
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
	cmp	r6, #1
	strb	r0, [r8]
	beq	.L126
	sub	r3, r6, #2
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #2
	strb	r0, [r8, #1]
	beq	.L126
	sub	r3, r6, #3
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #3
	strb	r0, [r8, #2]
	beq	.L126
	sub	r3, r6, #4
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #4
	strb	r0, [r8, #3]
	beq	.L126
	sub	r3, r6, #5
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #5
	strb	r0, [r8, #4]
	beq	.L126
	sub	r3, r6, #6
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #6
	strb	r0, [r8, #5]
	beq	.L126
	sub	r3, r6, #7
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #7
	strb	r0, [r8, #6]
	beq	.L126
	sub	r3, r6, #8
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #8
	strb	r0, [r8, #7]
	beq	.L126
	sub	r3, r6, #9
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #9
	strb	r0, [r8, #8]
	beq	.L126
	sub	r3, r6, #10
	add	r3, r7, r3, lsl #3
	ldr	r10, [r3, #8]
	ldr	r9, [r3, #12]
	mov	r2, r10
	mov	r3, r9
	mov	r0, r4
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
	cmp	r6, #10
	strb	ip, [r8, #9]
	beq	.L126
	add	r6, r7, r6, lsl #3
	ldrd	r2, [r6, #-80]
	bl	__aeabi_uldivmod
	add	r0, r0, #97
	strb	r0, [r8, #10]
.L126:
	mov	r0, r8
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #1
	sub	sp, sp, #36
	ble	.L175
	ldr	r3, [r1, #4]
	mov	r0, r3
	str	r3, [sp, #28]
	bl	strlen
	cmp	r0, #4
	str	r0, [sp, #24]
	bhi	.L176
	mov	r0, #0
	bl	time
	movw	r7, #:lower16:.LANCHOR0
	bl	srand
	mov	r6, #0
	movt	r7, #:upper16:.LANCHOR0
.L167:
	bl	rand
	ldr	r1, [r7, #396]
	bl	__aeabi_idivmod
	add	r1, r7, r1, lsl #2
	ldr	r4, [r1, #96]
	mov	r5, #2
	str	r4, [sp, #16]
	bl	rand
	ldr	r1, [r7, #396]
	bl	__aeabi_idivmod
	add	r1, r7, r1, lsl #2
	ldr	fp, [r1, #96]
	sub	r3, r4, #1
	sub	r9, fp, #1
	mul	r9, r9, r3
	mul	r3, fp, r4
	str	r3, [sp, #12]
.L163:
	mov	r8, r9
	mov	r0, r5
	b	.L164
.L168:
	mov	r8, r1
.L164:
	mov	r1, r8
	bl	__aeabi_idivmod
	cmp	r1, #0
	mov	r0, r8
	bne	.L168
	cmp	r8, #1
	beq	.L177
.L165:
	add	r5, r5, #1
	b	.L163
.L177:
	tst	r5, #1
	beq	.L165
	sub	r6, r9, r6
	clz	r6, r6
	mov	r4, r1
	lsr	r6, r6, #5
	add	r8, r9, #1
.L166:
	mov	r0, r8
	mov	r1, r5
	bl	__aeabi_idivmod
	cmp	r1, #0
	moveq	r1, r6
	movne	r1, #1
	cmp	r1, #0
	mov	r10, r8
	add	r8, r8, r9
	bne	.L166
	mov	r0, r10
	mov	r1, r5
	bl	__aeabi_idiv
	ldr	r3, [sp, #12]
	lsr	r8, r0, #31
	cmp	r5, r3
	orrge	r8, r8, #1
	cmp	r8, #0
	mov	r6, r0
	bne	.L167
	mov	r9, r0
	bl	rand
	add	r1, r6, r6, lsl #1
	asr	r1, r1, #1
	bl	__aeabi_idivmod
	movw	r0, #:lower16:.LC3
	mov	r3, r5
	mov	r7, r1
	mov	r2, fp
	ldr	r1, [sp, #16]
	movt	r0, #:upper16:.LC3
	bl	printf
	movw	r0, #:lower16:.LC4
	mov	r2, r7
	mov	r1, r6
	movt	r0, #:upper16:.LC4
	bl	printf
	ldr	fp, [sp, #24]
	ldr	r0, [sp, #28]
	mov	r1, fp
	bl	encodeMessage
	movw	r6, #:lower16:.LANCHOR1
	mov	r2, r5
	ldr	r3, [sp, #12]
	bl	exponentiateAndMod
	mov	r10, #1
	mov	r2, r9
	ldr	r9, [sp, #12]
	movt	r6, #:upper16:.LANCHOR1
	mov	r3, r9
	strd	r0, [sp, #16]
	str	r10, [r6]
	bl	exponentiateAndMod
	mov	r2, fp
	str	r8, [r6]
	bl	decodeMessage
	vldr.32	s15, [r6, #4]
	mov	r5, r0
	vcvt.f64.f32	d7, s15
	movw	r0, #:lower16:.LC5
	vmov	r2, r3, d7
	str	r5, [sp]
	movt	r0, #:upper16:.LC5
	bl	printf
	mov	r3, #0
	mov	r0, r5
	str	r3, [r6, #4]	@ float
	str	r10, [r6]
	bl	free
	ldrd	r0, [sp, #16]
	mov	r3, r9
	mov	r2, r7
	bl	exponentiateAndMod
	mov	r2, fp
	str	r8, [r6]
	bl	decodeMessage
	vldr.32	s15, [r6, #4]
	mov	r5, r0
	vcvt.f64.f32	d7, s15
	movw	r0, #:lower16:.LC6
	str	r5, [sp]
	vmov	r2, r3, d7
	movt	r0, #:upper16:.LC6
	bl	printf
	mov	r0, r5
	bl	free
.L159:
	mov	r0, r4
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L176:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r4, #1
	b	.L159
.L175:
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	mov	r4, #1
	b	.L159
	.size	main, .-main
	.global	currentDrawn
	.global	calculatePower
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
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	calculatePower, %object
	.size	calculatePower, 4
calculatePower:
	.space	4
	.type	currentDrawn, %object
	.size	currentDrawn, 4
currentDrawn:
	.space	4
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
	.ascii	"This program only supports up to a 4 character mess"
	.ascii	"age. Please try again with a shorter message\000"
.LC3:
	.ascii	"\012Generated RSA values:\012P: %d Q: %d E: %d\012\000"
	.space	2
.LC4:
	.ascii	"Correct key: %d\012Incorrect Key: %d\012\000"
	.space	1
.LC5:
	.ascii	"\012Power consumption and message using correct key"
	.ascii	" D:\012%f\012%s\012\000"
	.space	1
.LC6:
	.ascii	"\012Power consumption and message using incorrect '"
	.ascii	"fake' D:\012%f\012%s\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
