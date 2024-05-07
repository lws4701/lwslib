	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 4
	.globl	_create_list                    ; -- Begin function create_list
	.p2align	2
_create_list:                           ; @create_list
	.cfi_startproc
; %bb.0:
	mov	w8, #2147483646
	cmp	x0, x8
	b.hi	LBB0_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	w8, #16
	cmp	x0, #16
	csel	x20, x0, x8, hi
	mov	w0, #24
	bl	_malloc
	mov	x19, x0
	stp	xzr, x20, [x0, #8]
	lsl	x0, x20, #3
	bl	_malloc
	str	x0, [x19]
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_2:
	mov	x0, #0
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_delete_list                    ; -- Begin function delete_list
	.p2align	2
_delete_list:                           ; @delete_list
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0]
	cbz	x0, LBB1_10
; %bb.1:
	ldr	x8, [x19, #8]
	cbz	x8, LBB1_9
; %bb.2:
	mov	x20, #0
	b	LBB1_5
LBB1_3:                                 ;   in Loop: Header=BB1_5 Depth=1
	bl	_free
LBB1_4:                                 ;   in Loop: Header=BB1_5 Depth=1
	add	x20, x20, #1
	ldr	x8, [x19, #8]
	cmp	x8, x20
	b.ls	LBB1_8
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19]
	ldr	x0, [x8, x20, lsl #3]
	cbz	x0, LBB1_4
; %bb.6:                                ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [x0, #8]
	cmp	w8, #10
	b.ne	LBB1_3
; %bb.7:                                ;   in Loop: Header=BB1_5 Depth=1
	ldr	x0, [x0]
	bl	_delete_list
	b	LBB1_4
LBB1_8:
	ldr	x0, [x19]
LBB1_9:
	bl	_free
LBB1_10:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	_free
	.cfi_endproc
                                        ; -- End function
	.globl	_double_capacity                ; -- Begin function double_capacity
	.p2align	2
_double_capacity:                       ; @double_capacity
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x0, #16]
	lsr	x9, x8, #30
	cbnz	x9, LBB2_2
; %bb.1:
	mov	x19, x0
	ldr	x0, [x0]
	lsl	x1, x8, #4
	bl	_realloc
	str	x0, [x19]
	ldr	x8, [x19, #16]
	lsl	x8, x8, #1
	str	x8, [x19, #16]
LBB2_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_insert_item                    ; -- Begin function insert_item
	.p2align	2
_insert_item:                           ; @insert_item
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x3
	mov	x21, x2
	mov	x22, x1
	mov	x20, x0
	ldp	x23, x8, [x0, #8]
	lsr	x9, x8, #30
	cmp	x9, #0
	ccmp	x8, x23, #0, eq
	b.eq	LBB3_3
; %bb.1:
	subs	x8, x23, x19
	b.hs	LBB3_4
LBB3_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB3_3:
	ldr	x0, [x20]
	lsl	x1, x8, #4
	bl	_realloc
	str	x0, [x20]
	ldp	x23, x8, [x20, #8]
	lsl	x8, x8, #1
	str	x8, [x20, #16]
	subs	x8, x23, x19
	b.lo	LBB3_2
LBB3_4:
	b.ls	LBB3_6
; %bb.5:
	ldr	x9, [x20]
	add	x1, x9, x19, lsl #3
	add	x0, x1, #8
	lsl	x2, x8, #3
	bl	_memmove
	ldr	x23, [x20, #8]
LBB3_6:
	mov	w0, #8
	bl	_malloc
	str	x22, [x0]
	str	w21, [x0, #8]
	ldr	x8, [x20]
	str	x0, [x8, x19, lsl #3]
	add	x8, x23, #1
	str	x8, [x20, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_modify_item                    ; -- Begin function modify_item
	.p2align	2
_modify_item:                           ; @modify_item
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	x8, [x0, #8]
	cbz	x8, LBB4_3
; %bb.1:
	mov	x19, x3
	mov	x20, x0
	ldr	x8, [x0]
	ldr	x0, [x8, x3, lsl #3]
	cbz	x0, LBB4_3
; %bb.2:
	mov	x21, x1
	bl	_free
	mov	w0, #8
	bl	_malloc
	str	x21, [x0]
	ldr	x8, [x20]
	str	x0, [x8, x19, lsl #3]
LBB4_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_push_item                      ; -- Begin function push_item
	.p2align	2
_push_item:                             ; @push_item
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	ldp	x22, x8, [x0, #8]
	lsr	x9, x8, #30
	cmp	x9, #0
	ccmp	x8, x22, #0, eq
	mov	x23, x22
	b.ne	LBB5_4
; %bb.1:
	ldr	x0, [x19]
	lsl	x1, x22, #4
	bl	_realloc
	str	x0, [x19]
	ldp	x23, x8, [x19, #8]
	lsl	x8, x8, #1
	str	x8, [x19, #16]
	subs	x8, x23, x22
	b.lo	LBB5_5
; %bb.2:
	b.ls	LBB5_4
; %bb.3:
	add	x1, x0, x22, lsl #3
	add	x0, x1, #8
	lsl	x2, x8, #3
	bl	_memmove
	ldr	x23, [x19, #8]
LBB5_4:
	mov	w0, #8
	bl	_malloc
	str	x21, [x0]
	str	w20, [x0, #8]
	ldr	x8, [x19]
	str	x0, [x8, x22, lsl #3]
	add	x8, x23, #1
	str	x8, [x19, #8]
LBB5_5:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_remove_item                    ; -- Begin function remove_item
	.p2align	2
_remove_item:                           ; @remove_item
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	x8, [x0, #8]
	cbz	x8, LBB6_4
; %bb.1:
	mov	x22, x1
	mov	x21, x0
	ldr	x8, [x0]
	ldr	x0, [x8, x1, lsl #3]
	ldp	x19, x20, [x0]
	bl	_free
	ldr	x8, [x21, #8]
	cmp	x8, x22
	b.ls	LBB6_3
; %bb.2:
	ldr	x9, [x21]
	add	x0, x9, x22, lsl #3
	add	x1, x0, #8
	mvn	x9, x22
	add	x8, x8, x9
	lsl	x2, x8, #3
	bl	_memmove
	ldr	x8, [x21, #8]
LBB6_3:
	sub	x8, x8, #1
	str	x8, [x21, #8]
	mov	x0, x19
	mov	x1, x20
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB6_4:
	mov	x19, #0
	mov	w20, #11
	mov	x0, x19
	mov	x1, x20
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_pop_item                       ; -- Begin function pop_item
	.p2align	2
_pop_item:                              ; @pop_item
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	ldr	x22, [x0, #8]
	cbz	x22, LBB7_4
; %bb.1:
	mov	x21, x0
	sub	x24, x22, #1
	ldr	x8, [x0]
	lsl	x23, x22, #3
	add	x8, x8, x23
	ldur	x0, [x8, #-8]
	ldp	x19, x20, [x0]
	bl	_free
	ldr	x8, [x21, #8]
	cmp	x8, x24
	b.ls	LBB7_3
; %bb.2:
	ldr	x9, [x21]
	add	x10, x9, x23
	sub	x0, x10, #8
	add	x1, x9, x22, lsl #3
	sub	x8, x8, x22
	lsl	x2, x8, #3
	bl	_memmove
	ldr	x8, [x21, #8]
LBB7_3:
	sub	x8, x8, #1
	str	x8, [x21, #8]
	b	LBB7_5
LBB7_4:
	mov	x19, #0
	mov	w20, #11
LBB7_5:
	mov	x0, x19
	mov	x1, x20
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_get_item                       ; -- Begin function get_item
	.p2align	2
_get_item:                              ; @get_item
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	cmp	x8, x1
	b.ls	LBB8_2
; %bb.1:
	ldr	x8, [x0]
	ldr	x0, [x8, x1, lsl #3]
	ret
LBB8_2:
	mov	x0, #0
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_array                    ; -- Begin function print_array
	.p2align	2
_print_array:                           ; @print_array
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x19, x0
	strb	wzr, [sp, #30]
	mov	w8, #8236
	strh	w8, [sp, #28]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	x8, [x19, #8]
	cbz	x8, LBB9_19
; %bb.1:
	mov	x23, #0
Lloh2:
	adrp	x24, l_.str.2@PAGE
Lloh3:
	add	x24, x24, l_.str.2@PAGEOFF
	add	x25, sp, #28
Lloh4:
	adrp	x26, lJTI9_0@PAGE
Lloh5:
	add	x26, x26, lJTI9_0@PAGEOFF
Lloh6:
	adrp	x22, l_.str.3@PAGE
Lloh7:
	add	x22, x22, l_.str.3@PAGEOFF
Lloh8:
	adrp	x27, l_.str.8@PAGE
Lloh9:
	add	x27, x27, l_.str.8@PAGEOFF
Lloh10:
	adrp	x28, l_.str.9@PAGE
Lloh11:
	add	x28, x28, l_.str.9@PAGEOFF
Lloh12:
	adrp	x20, l_.str.10@PAGE
Lloh13:
	add	x20, x20, l_.str.10@PAGEOFF
Lloh14:
	adrp	x21, l_.str.11@PAGE
Lloh15:
	add	x21, x21, l_.str.11@PAGEOFF
LBB9_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19]
	ldr	x8, [x8, x23, lsl #3]
	ldr	w9, [x8, #8]
	cmp	w9, #11
	b.hi	LBB9_5
; %bb.3:                                ;   in Loop: Header=BB9_2 Depth=1
	adr	x10, LBB9_4
	ldrb	w11, [x26, x9]
	add	x10, x10, x11, lsl #2
	br	x10
LBB9_4:                                 ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldrsb	x8, [x8]
	stp	x9, x8, [sp]
Lloh16:
	adrp	x0, l_.str.1@PAGE
Lloh17:
	add	x0, x0, l_.str.1@PAGEOFF
	b	LBB9_18
LBB9_5:                                 ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x8, x24, x25, eq
	str	x8, [sp]
Lloh18:
	adrp	x0, l_.str.12@PAGE
Lloh19:
	add	x0, x0, l_.str.12@PAGEOFF
	b	LBB9_18
LBB9_6:                                 ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldrsb	x8, [x8]
	b	LBB9_8
LBB9_7:                                 ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	w8, [x8]
LBB9_8:                                 ;   in Loop: Header=BB9_2 Depth=1
	stp	x9, x8, [sp]
	mov	x0, x22
	b	LBB9_18
LBB9_9:                                 ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	w8, [x8]
	stp	x9, x8, [sp]
Lloh20:
	adrp	x0, l_.str.4@PAGE
Lloh21:
	add	x0, x0, l_.str.4@PAGEOFF
	b	LBB9_18
LBB9_10:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	x8, [x8]
	stp	x9, x8, [sp]
Lloh22:
	adrp	x0, l_.str.5@PAGE
Lloh23:
	add	x0, x0, l_.str.5@PAGEOFF
	b	LBB9_18
LBB9_11:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	x8, [x8]
	stp	x9, x8, [sp]
Lloh24:
	adrp	x0, l_.str.6@PAGE
Lloh25:
	add	x0, x0, l_.str.6@PAGEOFF
	b	LBB9_18
LBB9_12:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	x8, [x8]
	stp	x9, x8, [sp]
Lloh26:
	adrp	x0, l_.str.7@PAGE
Lloh27:
	add	x0, x0, l_.str.7@PAGEOFF
	b	LBB9_18
LBB9_13:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	x8, [x8]
	stp	x9, x8, [sp]
	mov	x0, x27
	b	LBB9_18
LBB9_14:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	s0, [x8]
	fcvt	d0, s0
	str	d0, [sp, #8]
	str	x9, [sp]
	mov	x0, x28
	bl	_printf
	ldr	x8, [x19]
	ldr	x8, [x8, x23, lsl #3]
LBB9_15:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x9, x24, x25, eq
	ldr	x8, [x8]
	ldr	d0, [x8]
	str	d0, [sp, #8]
	str	x9, [sp]
	mov	x0, x20
	b	LBB9_18
LBB9_16:                                ;   in Loop: Header=BB9_2 Depth=1
	ldr	x0, [x8]
	bl	_print_array
	add	x23, x23, #1
	ldr	x8, [x19, #8]
	cmp	x8, x23
	b.hi	LBB9_2
	b	LBB9_19
LBB9_17:                                ;   in Loop: Header=BB9_2 Depth=1
	cmp	x23, #0
	csel	x8, x24, x25, eq
	str	x8, [sp]
	mov	x0, x21
LBB9_18:                                ;   in Loop: Header=BB9_2 Depth=1
	bl	_printf
	add	x23, x23, #1
	ldr	x8, [x19, #8]
	cmp	x8, x23
	b.hi	LBB9_2
LBB9_19:
Lloh28:
	adrp	x0, l_str@PAGE
Lloh29:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh28, Lloh29
	.cfi_endproc
	.section	__TEXT,__const
lJTI9_0:
	.byte	(LBB9_4-LBB9_4)>>2
	.byte	(LBB9_6-LBB9_4)>>2
	.byte	(LBB9_7-LBB9_4)>>2
	.byte	(LBB9_9-LBB9_4)>>2
	.byte	(LBB9_10-LBB9_4)>>2
	.byte	(LBB9_11-LBB9_4)>>2
	.byte	(LBB9_12-LBB9_4)>>2
	.byte	(LBB9_13-LBB9_4)>>2
	.byte	(LBB9_14-LBB9_4)>>2
	.byte	(LBB9_15-LBB9_4)>>2
	.byte	(LBB9_16-LBB9_4)>>2
	.byte	(LBB9_17-LBB9_4)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_get_array_size                 ; -- Begin function get_array_size
	.p2align	2
_get_array_size:                        ; @get_array_size
	.cfi_startproc
; %bb.0:
	ldr	x0, [x0, #8]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_get_array_capacity             ; -- Begin function get_array_capacity
	.p2align	2
_get_array_capacity:                    ; @get_array_capacity
	.cfi_startproc
; %bb.0:
	ldr	x0, [x0, #16]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_is_sortable                    ; -- Begin function is_sortable
	.p2align	2
_is_sortable:                           ; @is_sortable
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	cbz	x8, LBB12_2
; %bb.1:
	ldr	x9, [x0]
	ldr	x10, [x9]
	ldr	w10, [x10, #8]
	cmp	w10, #10
	b.ne	LBB12_3
LBB12_2:
	mov	w0, #0
	ret
LBB12_3:
	mov	w12, #1
LBB12_4:                                ; =>This Inner Loop Header: Depth=1
	mov	x11, x12
	cmp	x8, x12
	b.eq	LBB12_6
; %bb.5:                                ;   in Loop: Header=BB12_4 Depth=1
	ldr	x12, [x9, x11, lsl #3]
	ldr	w13, [x12, #8]
	add	x12, x11, #1
	cmp	w13, w10
	b.eq	LBB12_4
LBB12_6:
	cmp	x8, x11
	cset	w0, ls
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.globl	_DEFAULT_ARRAYLIST_SIZE         ; @DEFAULT_ARRAYLIST_SIZE
	.p2align	2, 0x0
_DEFAULT_ARRAYLIST_SIZE:
	.long	16                              ; 0x10

	.globl	_SIZE_OF_DATATYPE               ; @SIZE_OF_DATATYPE
	.p2align	3, 0x0
_SIZE_OF_DATATYPE:
	.quad	8                               ; 0x8

	.section	__TEXT,__cstring,cstring_literals
l___const.print_array.delim:            ; @__const.print_array.delim
	.asciz	", "

l_.str:                                 ; @.str
	.asciz	"[ "

l_.str.1:                               ; @.str.1
	.asciz	"%s%c"

l_.str.2:                               ; @.str.2
	.space	1

l_.str.3:                               ; @.str.3
	.asciz	"%s%d"

l_.str.4:                               ; @.str.4
	.asciz	"%s%u"

l_.str.5:                               ; @.str.5
	.asciz	"%s%ld"

l_.str.6:                               ; @.str.6
	.asciz	"%s%lu"

l_.str.7:                               ; @.str.7
	.asciz	"%s%lld"

l_.str.8:                               ; @.str.8
	.asciz	"%s%llu"

l_.str.9:                               ; @.str.9
	.asciz	"%s%f"

l_.str.10:                              ; @.str.10
	.asciz	"%s%lf"

l_.str.11:                              ; @.str.11
	.asciz	"%sNONE"

l_.str.12:                              ; @.str.12
	.asciz	"%sUNKNOWN"

l_str:                                  ; @str
	.asciz	" ]"

.subsections_via_symbols
