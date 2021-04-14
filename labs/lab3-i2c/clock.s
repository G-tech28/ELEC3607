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
	.file	"clock.c"
	.text
	.comm	i2c_file,4,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"/dev/i2c-2\000"
	.text
	.align	1
	.global	i2c_init
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	i2c_init, %function
i2c_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r3, r4, r7, lr}
	add	r7, sp, #0
	ldr	r4, .L4
.LPIC1:
	add	r4, pc
	movs	r1, #2
	ldr	r3, .L4+4
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	open(PLT)
	mov	r2, r0
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	str	r2, [r3]
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L3
	movs	r0, #1
	bl	exit(PLT)
.L3:
	nop
	pop	{r3, r4, r7, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	.LC0-(.LPIC0+4)
	.word	i2c_file(GOT)
	.size	i2c_init, .-i2c_init
	.section	.rodata
	.align	2
.LC1:
	.ascii	"r dev(0x%x) reg(0x%x)=0x%x\012\000"
	.text
	.align	1
	.global	i2c_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	i2c_read, %function
i2c_read:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldr	r4, .L10
.LPIC2:
	add	r4, pc
	ldr	r3, .L10+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	movs	r2, #96
	movw	r1, #1795
	mov	r0, r3
	bl	ioctl(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L7
	movs	r0, #1
	bl	exit(PLT)
.L7:
	ldr	r3, .L10+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	i2c_smbus_read_byte_data(PLT)
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bge	.L8
	movs	r0, #1
	bl	exit(PLT)
.L8:
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	movs	r1, #96
	ldr	r0, .L10+8
.LPIC3:
	add	r0, pc
	bl	printf(PLT)
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+4)
	.word	i2c_file(GOT)
	.word	.LC1-(.LPIC3+4)
	.size	i2c_read, .-i2c_read
	.align	1
	.global	i2c_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	i2c_write, %function
i2c_write:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	ldr	r4, .L15
.LPIC4:
	add	r4, pc
	ldr	r3, .L15+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	movs	r2, #96
	movw	r1, #1795
	mov	r0, r3
	bl	ioctl(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L13
	movs	r0, #1
	bl	exit(PLT)
.L13:
	ldr	r3, .L15+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	uxtb	r1, r2
	ldrb	r2, [r7, #3]	@ zero_extendqisi2
	mov	r0, r3
	bl	i2c_smbus_write_byte_data(PLT)
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.word	i2c_file(GOT)
	.size	i2c_write, .-i2c_write
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	bl	i2c_init(PLT)
	movs	r0, #0
	bl	i2c_read(PLT)
	movs	r1, #255
	movs	r0, #3
	bl	i2c_write(PLT)
	movs	r3, #16
	str	r3, [r7, #4]
	b	.L18
.L19:
	ldr	r3, [r7, #4]
	movs	r1, #128
	mov	r0, r3
	bl	i2c_write(PLT)
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L18:
	ldr	r3, [r7, #4]
	cmp	r3, #23
	ble	.L19
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
