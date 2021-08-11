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
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #8]
	cmp	lr, #0
	vldrne.32	s15, [ip]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	mul	r3, r0, r3
	ldr	lr, .L7
	mla	r3, r2, r1, r3
	umull	r0, r1, r0, r2
	vstrne.32	s15, [ip]
	ldr	ip, [lr]
	add	r1, r3, r1
	add	ip, ip, #2
	str	ip, [lr]
	ldr	pc, [sp], #4
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
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
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #8]
	cmp	lr, #0
	vldrne.32	s15, [ip]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	lr, .L15
	vstrne.32	s15, [ip]
	ldr	ip, [lr]
	adds	r0, r0, r2
	add	ip, ip, #1
	str	ip, [lr]
	adc	r1, r1, r3
	ldr	pc, [sp], #4
.L16:
	.align	2
.L15:
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
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r2
	mov	r7, r3
	ldrd	r2, [sp, #24]
	cmp	r2, #0
	vldrne.32	s15, [r3]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	mov	r5, r1
	ldr	r1, .L23
	vstrne.32	s15, [r3]
	ldr	r3, [r1]
	mov	r2, r6
	mla	r3, r3, r3, r3
	add	r3, r3, #1
	str	r3, [r1]
	mov	r3, r7
	mov	r1, r5
	mov	r4, r0
	bl	__aeabi_uldivmod
	pop	{r4, r5, r6, r7, r8, pc}
.L24:
	.align	2
.L23:
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
	cmp	r0, #0
	vldrne.32	s15, [r1]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	r2, .L30
	vstrne.32	s15, [r1]
	ldr	r3, [r2]
	vdiv.f64	d0, d0, d1
	mla	r3, r3, r3, r3
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L31:
	.align	2
.L30:
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
	cmp	r0, #0
	vldrne.32	s15, [r1]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	r2, .L37
	vstrne.32	s15, [r1]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	log
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r2
	mov	r7, r3
	ldrd	r2, [sp, #24]
	cmp	r2, #0
	vldrne.32	s15, [r3]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	mov	r5, r1
	ldr	r1, .L45
	vstrne.32	s15, [r3]
	ldr	r3, [r1]
	mov	r2, r6
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [r1]
	mov	r3, r7
	mov	r1, r5
	mov	r4, r0
	bl	__aeabi_uldivmod
	mov	r0, r2
	mov	r1, r3
	pop	{r4, r5, r6, r7, r8, pc}
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
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
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #8]
	cmp	lr, #0
	vldrne.32	s15, [ip]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	lr, .L53
	vstrne.32	s15, [ip]
	ldr	ip, [lr]
	and	r0, r0, r2
	add	ip, ip, #1
	str	ip, [lr]
	and	r1, r1, r3
	ldr	pc, [sp], #4
.L54:
	.align	2
.L53:
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
	cmp	r2, #0
	vldrne.32	s15, [r3]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	r2, .L60
	vstrne.32	s15, [r3]
	ldr	r3, [r2]
	lsl	r0, r0, r1
	lsl	r3, r3, r3
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L61:
	.align	2
.L60:
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
.L64:
	mov	r4, r1
	bl	__aeabi_idivmod
	cmp	r1, #0
	mov	r0, r4
	bne	.L64
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9}
	vmov	s16, r2	@ int
	ldr	r4, .L119
	sub	sp, sp, #44
	mov	r8, r0
	mov	r6, r1
	ldr	r0, [r4, #4]
	mov	r1, r4
	vcvt.f64.s32	d0, s16
	str	r3, [sp, #28]
	bl	customLog
	mov	r1, r4
	ldr	r0, [r4, #4]
	vmov.f64	d9, d0
	vmov.f64	d0, #2.0e+0
	bl	customLog
	mov	r1, r4
	ldr	r0, [r4, #4]
	vmov.f64	d1, d0
	vmov.f64	d0, d9
	bl	doubleDivide
	vmov	r0, r1, d0
	bl	__aeabi_d2ulz
	ldr	r3, [r4, #4]
	ldr	r7, .L119+4
	cmp	r3, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	mov	r9, #0
	mov	r5, #1
	mov	r10, r7
	ldr	r3, [r7]
	vstrne.32	s15, [r4]
	add	r3, r3, #1
	str	r3, [r7]
	ldr	r4, .L119
	adds	r3, r0, #1
	str	r3, [sp, #20]
	str	r3, [sp, #24]
	str	r9, [sp, #16]
.L69:
	ldr	r3, [sp, #24]
	cmp	r9, r3
	blt	.L79
	ldr	r3, [sp, #20]
	ldr	r4, .L119
	ldr	r6, .L119+4
	bic	r7, r3, r3, asr #31
.L80:
	cmp	r7, #89
	ble	.L84
	mov	r0, r5
	ldr	r1, [sp, #16]
	add	sp, sp, #44
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L79:
	ldr	fp, [r4, #4]
	mul	r2, r8, r6
	cmp	fp, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	vstrne.32	s15, [r4]
	cmp	fp, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	umull	r0, r1, r8, r8
	ldr	r3, [r10]
	add	r1, r1, r2, lsl #1
	ldr	r2, [sp, #28]
	add	ip, r3, #2
	asr	r3, r2, #31
	strd	r2, [sp, #8]
	lsl	r3, ip, #1
	add	r3, r3, #1
	vstrne.32	s15, [r4]
	str	r3, [r7]
	ldrd	r2, [sp, #8]
	bl	__aeabi_uldivmod
	mov	r1, r9
	strd	r2, [sp, #32]
	mov	r0, #1
	ldr	r3, .L119
	mov	r2, fp
	bl	intLeftShift
	ldr	ip, [r4, #4]
	vmov	r3, s16	@ int
	cmp	ip, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	r2, [r10]
	vstrne.32	s15, [r4]
	tst	r0, r3
	add	r2, r2, #3
	beq	.L73
	cmp	ip, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	vstrne.32	s15, [r4]
	cmp	ip, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	mul	r6, r5, r6
	ldr	r3, [sp, #16]
	umull	r0, r1, r5, r8
	mla	r6, r8, r3, r6
	lsl	r2, r2, #1
	add	r2, r2, #1
	str	r2, [r7]
	ldrd	r2, [sp, #8]
	add	r1, r6, r1
	vstrne.32	s15, [r4]
	bl	__aeabi_uldivmod
	mov	r5, r2
	str	r3, [sp, #16]
.L76:
	ldr	r3, [r4, #4]
	add	r9, r9, #1
	cmp	r3, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	r3, [r10]
	vstrne.32	s15, [r4]
	add	r3, r3, #1
	str	r3, [r10]
	ldr	r8, [sp, #32]
	ldr	r6, [sp, #36]
	b	.L69
.L73:
	cmp	ip, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	str	r2, [r7]
	mov	r3, #0
	mov	r2, #1
	vaddne.f32	s15, s15, s14
	str	r4, [sp, #4]
	str	ip, [sp]
	mov	r0, r2
	mov	r1, r3
	vstrne.32	s15, [r4]
	bl	intMod
	b	.L76
.L84:
	ldr	r2, [r4, #4]
	ldr	r3, [r6]
	cmp	r2, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	add	r3, r3, #2
	str	r3, [r6]
	mov	r3, #0
	stm	sp, {r2, r4}
	mov	r2, #1
	vaddne.f32	s15, s15, s14
	mov	r0, r2
	mov	r1, r3
	vstrne.32	s15, [r4]
	bl	intMod
	mov	r1, #1
	mov	r3, r4
	ldr	r2, [r4, #4]
	mov	r0, r1
	bl	intLeftShift
	ldr	r3, [r4, #4]
	mov	r2, r0
	str	r3, [sp]
	str	r4, [sp, #4]
	asr	r3, r0, #31
	mov	r1, #0
	mov	r0, #1
	bl	bitwiseAnd
	ldr	r2, [r4, #4]
	ldr	r3, [r6]
	cmp	r2, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	add	r3, r3, #2
	str	r3, [r6]
	mov	r3, #0
	stm	sp, {r2, r4}
	mov	r2, #1
	vaddne.f32	s15, s15, s14
	mov	r1, r3
	mov	r0, r2
	vstrne.32	s15, [r4]
	bl	intMod
	ldr	r3, [r4, #4]
	add	r7, r7, #1
	cmp	r3, #0
	vldrne.32	s15, [r4]
	vmovne.f32	s14, #2.2e+1
	vaddne.f32	s15, s15, s14
	ldr	r3, [r6]
	vstrne.32	s15, [r4]
	add	r3, r3, #1
	str	r3, [r6]
	b	.L80
.L120:
	.align	2
.L119:
	.word	.LANCHOR1
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
	ldr	r7, .L127
.L122:
	cmp	ip, #0
	pople	{r4, r5, r6, r7, r8, pc}
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	sub	r3, r2, #97
	uxtb	lr, r3
	cmp	lr, #25
	bls	.L123
	mov	r1, r2
	ldr	r0, .L127+4
	bl	printf
	mov	r0, #0
	bl	exit
.L123:
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
	b	.L122
.L128:
	.align	2
.L127:
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
	ldr	r4, .L133
	add	r4, r4, r7, lsl #3
.L130:
	cmp	r5, r7
	sub	r4, r4, #8
	blt	.L131
	mov	r0, r9
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L131:
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
	b	.L130
.L134:
	.align	2
.L133:
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #1
	sub	sp, sp, #28
	ldrle	r0, .L152
	ble	.L151
	ldr	fp, [r1, #4]
	mov	r0, fp
	bl	strlen
	cmp	r0, #4
	str	r0, [sp, #12]
	bls	.L138
	ldr	r0, .L152+4
.L151:
	bl	puts
	mov	r3, #1
	str	r3, [sp, #16]
.L135:
	ldr	r0, [sp, #16]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L138:
	mov	r0, #0
	bl	time
	bl	srand
	mov	r5, #0
	ldr	r8, .L152+8
.L143:
	bl	rand
	ldr	r1, [r8, #396]
	bl	__aeabi_idivmod
	add	r1, r8, r1, lsl #2
	ldr	r9, [r1, #96]
	bl	rand
	ldr	r1, [r8, #396]
	bl	__aeabi_idivmod
	mov	r4, #2
	add	r1, r8, r1, lsl #2
	ldr	r10, [r1, #96]
	sub	r3, r9, #1
	sub	r6, r10, #1
	mul	r7, r10, r9
	mul	r6, r6, r3
.L139:
	mov	r3, r6
	mov	r0, r4
.L140:
	mov	r1, r3
	str	r3, [sp, #16]
	bl	__aeabi_idivmod
	ldr	r3, [sp, #16]
	subs	r2, r1, #0
	mov	r0, r3
	str	r2, [sp, #16]
	bne	.L144
	cmp	r3, #1
	bne	.L141
	ands	r3, r4, #1
	beq	.L141
.L142:
	mov	r0, r3
	mov	r1, r4
	str	r3, [sp, #20]
	bl	__aeabi_idivmod
	sub	r2, r6, r5
	clz	r2, r2
	cmp	r1, #0
	lsr	r2, r2, #5
	moveq	r1, r2
	movne	r1, #1
	ldr	r3, [sp, #20]
	cmp	r1, #0
	add	r3, r3, r6
	bne	.L142
	lsr	r6, r0, #31
	cmp	r4, r7
	orrge	r6, r6, #1
	cmp	r6, #0
	mov	r5, r0
	bne	.L143
	bl	rand
	add	r1, r5, r5, lsl #1
	asr	r1, r1, #1
	bl	__aeabi_idivmod
	mov	r8, r1
	mov	r3, r4
	mov	r2, r10
	mov	r1, r9
	ldr	r0, .L152+12
	bl	printf
	mov	r2, r8
	mov	r1, r5
	ldr	r0, .L152+16
	bl	printf
	ldr	r1, [sp, #12]
	mov	r0, fp
	bl	encodeMessage
	mov	r3, r7
	mov	r2, r4
	bl	exponentiateAndMod
	mov	r9, #1
	ldr	r4, .L152+20
	mov	r3, r7
	mov	r2, r5
	mov	r10, r0
	mov	fp, r1
	str	r9, [r4, #4]
	bl	exponentiateAndMod
	ldr	r2, [sp, #12]
	str	r6, [r4, #4]
	bl	decodeMessage
	vldr.32	s15, [r4]
	vcvt.f64.f32	d7, s15
	mov	r5, r0
	vmov	r2, r3, d7
	str	r0, [sp]
	ldr	r0, .L152+24
	bl	printf
	mov	r3, #0
	mov	r0, r5
	str	r3, [r4]	@ float
	str	r9, [r4, #4]
	bl	free
	mov	r3, r7
	mov	r2, r8
	mov	r0, r10
	mov	r1, fp
	bl	exponentiateAndMod
	ldr	r2, [sp, #12]
	str	r6, [r4, #4]
	bl	decodeMessage
	vldr.32	s15, [r4]
	vcvt.f64.f32	d7, s15
	mov	r5, r0
	str	r0, [sp]
	vmov	r2, r3, d7
	ldr	r0, .L152+28
	bl	printf
	mov	r0, r5
	bl	free
	b	.L135
.L141:
	add	r4, r4, #1
	b	.L139
.L144:
	ldr	r3, [sp, #16]
	b	.L140
.L153:
	.align	2
.L152:
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC3
	.word	.LC4
	.word	.LANCHOR1
	.word	.LC5
	.word	.LC6
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
	.type	currentDrawn, %object
	.size	currentDrawn, 4
currentDrawn:
	.space	4
	.type	calculatePower, %object
	.size	calculatePower, 4
calculatePower:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"Invalid character provided: %c (please only provide"
	.ascii	" a message containing the letters a-j\012\000"
.LC1:
	.ascii	"Missing message, please include message as argument"
	.ascii	"\000"
.LC2:
	.ascii	"This program only supports up to a 4 character mess"
	.ascii	"age. Please try again with a shorter message\000"
.LC3:
	.ascii	"\012Generated RSA values:\012P: %d Q: %d E: %d\012\000"
.LC4:
	.ascii	"Correct key: %d\012Incorrect Key: %d\012\000"
.LC5:
	.ascii	"\012Power consumption and message using correct key"
	.ascii	" D:\012%f\012%s\012\000"
.LC6:
	.ascii	"\012Power consumption and message using incorrect '"
	.ascii	"fake' D:\012%f\012%s\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
