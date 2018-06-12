;
;	Disassembled by:
;		DASMx object code disassembler
;		(c) Copyright 1996-2003   Conquest Consultants
;		Version 1.40 (Oct 18 2003)
;
;	File:		8085.bin
;
;	Size:		2048 bytes
;	Checksum:	AEF6
;	CRC-32:		376D3836
;
;	Date:		Sun May 27 19:43:10 2018
;
;	CPU:		Intel 8080 (MCS-80/85 family)
;
;
;
	org	00000H
;
	jmp	L003F
;
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	jmp	L00D9
;
L003F:
	mvi	a,091H
	out	003H
	mvi	a,0CFH
	out	005H
	mvi	a,00EH
	out	005H
L004B:
	mvi	a,010H
	out	002H
	xra	a
	out	001H
	sta	X8308
	sta	X8309
	lxi	sp,083E0H
	lxi	h,08000H
	mvi	a,00BH
;
	db	030H
;
	ei
	xra	a
	sta	X8309
L0066:
	mvi	a,00FH
	sta	X830A
L006B:
	call	L00E1
	lda	X830C
	cpi	00DH
	jz	L0082
	call	L027C
	cpi	060H
	jnz	L0066
	hlt
	jmp	L006B
;
L0082:
	mvi	a,00FH
	sta	X830A
	call	L00E1
	call	L027C
	lda	X830B
	inr	a
	sta	X830B
	cpi	008H
	jnz	L00AD
L0099:
	lda	X8308
	rar
	cc	L00E1
	in	005H
	rar
	rar
	jnc	L0099
	in	004H
	xra	a
	sta	X830B
L00AD:
	lda	X8309
	cpi	060H
	jnz	L0082
	mvi	a,00EH
	sta	X830A
	call	L00E1
	mvi	a,030H
	sta	X8319
	call	L027C
	mvi	a,00EH
	sta	X830A
	call	L00E1
	mvi	a,030H
	sta	X8319
	call	L027C
	hlt
	jmp	L006B
;
L00D9:
	push	psw
	mvi	a,001H
	sta	X8308
	pop	psw
	ret
;
L00E1:
	push	h
	push	b
	push	d
	lxi	b,X830C
L00E7:
	lda	X8308
	rar
	jc	L0107
	in	005H
	rar
	rar
	jnc	L00E7
	in	004H
	stax	b
	inx	b
	xra	a
	lda	X830A
	dcr	a
	sta	X830A
	jnz	L00E7
	jmp	L01D4
;
L0107:
	lda	X8309
	mov	d,a
	xra	a
	cmp	d
	jnz	L019F
;
	db	020H
;
	ral
	jc	L0198
	in	000H
	mov	b,a
	in	002H
	mov	c,a
L011B:
	in	000H
	cmp	b
	jnz	L018D
	sta	X8300
	in	002H
	cmp	c
	jnz	L0194
	ani	00FH
	sta	X8301
	xra	a
	lda	X8301
	rar
	rar
	rar
	jc	L013C
	jmp	L0141
;
L013C:
	mvi	a,00DH
	jmp	L0143
;
L0141:
	mvi	a,00CH
L0143:
	adi	060H
	sta	X8302
	xra	a
	mvi	b,007H
	lda	X8301
	mov	c,a
	ldax	b
	sta	X8303
	xra	a
	lda	X8302
	lxi	h,X8303
	mov	e,m
	adc	e
	lxi	h,X8300
	mov	e,m
	adc	e
	jc	L0167
	jmp	L0168
;
L0167:
	inr	a
L0168:
	sta	X8304
	call	L0218
	xra	a
	lda	X8304
	call	L01D8
	lda	X8302
	call	L01D8
	lda	X8303
	call	L01D8
	lda	X8300
	call	L01D8
	call	L024B
	jmp	L0198
;
L018D:
	mov	b,a
	in	002H
	mov	c,a
	jmp	L011B
;
L0194:
	mov	c,a
	jmp	L011B
;
L0198:
	pop	d
	pop	b
	pop	h
	pop	d
	jmp	L004B
;
L019F:
	lxi	h,08000H
	mvi	a,001H
	out	001H
L01A6:
	call	L0218
	xra	a
	mov	a,m
	call	L01D8
	inx	h
	mov	a,m
	call	L01D8
	inx	h
	mov	a,m
	call	L01D8
	inx	h
	mov	a,m
	call	L01D8
	inx	h
	mov	a,m
	call	L01D8
	inx	h
	call	L024B
	xra	a
	lda	X8309
	dcr	a
	sta	X8309
	jz	L0198
	jmp	L01A6
;
L01D4:
	pop	d
	pop	b
	pop	h
	ret
;
L01D8:
	push	b
	mvi	b,008H
L01DB:
	rlc
	mov	c,a
	mvi	a,010H
	out	002H
	jc	L01F8
	call	L0204
L01E7:
	xra	a
	out	002H
	call	L0204
	xra	a
	mov	a,b
	dcr	a
	jz	L0201
	mov	b,a
	mov	a,c
	jmp	L01DB
;
L01F8:
	call	L0204
	call	L0204
	jmp	L01E7
;
L0201:
	xra	a
	pop	b
	ret
;
L0204:
	mvi	a,001H
L0206:
	sta	X8305
	xra	a
	mvi	a,0E0H
L020C:
	inr	a
	jnz	L020C
	lda	X8305
	dcr	a
	jnz	L0206
	ret
;
L0218:
	xra	a
	out	002H
	sta	X8306
L021E:
	call	L0204
	lda	X8306
	inr	a
	sta	X8306
	cpi	0FFH
	jz	L0230
	jmp	L021E
;
L0230:
	mvi	a,010H
	out	002H
	call	L0204
	xra	a
	out	002H
	call	L0204
	mvi	a,010H
	out	002H
	call	L0204
	xra	a
	out	002H
	call	L0204
	ret
;
L024B:
	mvi	a,010H
	out	002H
	call	L0204
	call	L0204
	xra	a
	out	002H
	call	L0204
	mvi	a,010H
	out	002H
	call	L0204
	xra	a
	out	002H
	call	L0204
	mvi	a,090H
L026A:
	sta	X8307
	xra	a
	mvi	a,001H
L0270:
	inr	a
	jnz	L0270
	lda	X8307
	dcr	a
	jnz	L026A
	ret
;
L027C:
	push	b
	push	d
	lda	X8314
	cpi	02DH
	jz	L028B
	mvi	a,06CH
	jmp	L028D
;
L028B:
	mvi	a,06DH
L028D:
	sta	X831B
	lda	X8315
	cpi	042H
	jz	L02D3
	cpi	055H
	jz	L02D3
	lda	X8316
	cpi	04FH
	jz	L02E4
	lda	X8315
	adi	080H
	rlc
	rlc
	rlc
	rlc
	sta	X831C
	lda	X8317
	adi	0D0H
	rlc
	rlc
	rlc
	rlc
	mov	c,a
	lda	X8318
	adi	0D0H
	add	c
	sta	X831D
	lda	X8319
	adi	070H
	rlc
	rlc
	rlc
	rlc
	sta	X831E
	jmp	L02F6
;
L02D3:
	mvi	a,00BH
	sta	X831C
	xra	a
	sta	X831D
	mvi	a,00AH
	sta	X831E
	jmp	L02F6
;
L02E4:
	mvi	a,01BH
	sta	X831C
	mvi	a,050H
	sta	X831D
	mvi	a,00AH
	sta	X831E
	jmp	L02F6
;
L02F6:
	xra	a
	lda	X831B
	mov	e,a
	lda	X831C
	adc	e
	mov	e,a
	lda	X831D
	adc	e
	mov	e,a
	lda	X831E
	adc	e
	jc	L030F
	jmp	L0310
;
L030F:
	inr	a
L0310:
	mov	m,a
	inx	h
	lda	X831B
	mov	m,a
	inx	h
	lda	X831C
	mov	m,a
	inx	h
	lda	X831D
	mov	m,a
	inx	h
	lda	X831E
	mov	m,a
	inx	h
	lda	X8309
	inr	a
	sta	X8309
	pop	d
	pop	b
	ret
;
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	inr	m
	nop
	inr	m
	nop
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	m,000H
	inr	m
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	inr	m
	nop
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	inr	a
	nop
	inr	a
	nop
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	inr	m
	nop
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	inr	a
	nop
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	m,000H
	mvi	m,000H
	mvi	a,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	lxi	b,01B0BH
	dcx	d
	dcx	b
	inx	b
	dad	d
	lxi	d,00036H
	mvi	a,000H
	mvi	a,000H
	inr	m
	nop
	inr	a
	nop
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	inr	a
	nop
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	inr	a
	nop
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	inr	a
	nop
	inr	m
	nop
	mvi	a,000H
	mvi	a,000H
	mvi	a,000H
	mvi	m,000H
	mvi	a,000H
