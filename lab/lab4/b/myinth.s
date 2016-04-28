; Generated by c86 (BYU-NASM) 5.1 (beta) from myinth.i
	CPU	8086
	ALIGN	2
	jmp	main	; Jump to program start
	ALIGN	2
counter:
	DW	0
	ALIGN	2
reset_handler:
	; >>>>> Line:	7
	; >>>>> void reset_handler(){ 
	jmp	L_myinth_1
L_myinth_2:
	; >>>>> Line:	8
	; >>>>> exit(0); 
	xor	al, al
	push	ax
	call	exit
	add	sp, 2
	mov	sp, bp
	pop	bp
	ret
L_myinth_1:
	push	bp
	mov	bp, sp
	jmp	L_myinth_2
L_myinth_4:
	DB	"TICK ",0
	ALIGN	2
tick_handler:
	; >>>>> Line:	11
	; >>>>> void tick_handler(){ 
	jmp	L_myinth_5
L_myinth_6:
	; >>>>> Line:	12
	; >>>>> counter++; 
	inc	word [counter]
	; >>>>> Line:	13
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	14
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	15
	; >>>>> printString("TICK "); 
	mov	ax, L_myinth_4
	push	ax
	call	printString
	add	sp, 2
	; >>>>> Line:	16
	; >>>>> printInt(counter); 
	push	word [counter]
	call	printInt
	add	sp, 2
	; >>>>> Line:	17
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	18
	; >>>>> printNewLine(); 
	call	printNewLine
	mov	sp, bp
	pop	bp
	ret
L_myinth_5:
	push	bp
	mov	bp, sp
	jmp	L_myinth_6
L_myinth_11:
	DB	" IGNORED",0
L_myinth_10:
	DB	"KEYPRESS ",0
L_myinth_9:
	DB	"DELAY COMPLETE",0
L_myinth_8:
	DB	"DELAY KEY PRESSED",0
	ALIGN	2
keyboard_handler:
	; >>>>> Line:	21
	; >>>>> void keyboard_handler(){ 
	jmp	L_myinth_12
L_myinth_13:
	; >>>>> Line:	25
	; >>>>> if(kb == 'd'){ 
	mov	al, byte [KeyBuffer]
	mov	byte [bp-3], al
	; >>>>> Line:	25
	; >>>>> if(kb == 'd'){ 
	cmp	byte [bp-3], 100
	jne	L_myinth_14
	; >>>>> Line:	26
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	27
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	28
	; >>>>> printString("DELAY KEY PRESSED"); 
	mov	ax, L_myinth_8
	push	ax
	call	printString
	add	sp, 2
	; >>>>> Line:	29
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	30
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	33
	; >>>>> for(i = 0; i < 5000; i++){ 
	mov	word [bp-2], 0
	jmp	L_myinth_16
L_myinth_15:
L_myinth_18:
	; >>>>> Line:	35
	; >>>>> } 
	inc	word [bp-2]
L_myinth_16:
	cmp	word [bp-2], 5000
	jl	L_myinth_15
L_myinth_17:
	; >>>>> Line:	37
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	38
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	39
	; >>>>> printString("DELAY COMPLETE"); 
	mov	ax, L_myinth_9
	push	ax
	call	printString
	add	sp, 2
	; >>>>> Line:	40
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	41
	; >>>>> printNewLine(); 
	call	printNewLine
	jmp	L_myinth_19
L_myinth_14:
	; >>>>> Line:	45
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	46
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	47
	; >>>>> printString("KEYPRESS "); 
	mov	ax, L_myinth_10
	push	ax
	call	printString
	add	sp, 2
	; >>>>> Line:	48
	; >>>>> printChar('('); 
	mov	al, 40
	push	ax
	call	printChar
	add	sp, 2
	; >>>>> Line:	49
	; >>>>> printChar(kb); 
	push	word [bp-3]
	call	printChar
	add	sp, 2
	; >>>>> Line:	50
	; >>>>> printChar(')'); 
	mov	al, 41
	push	ax
	call	printChar
	add	sp, 2
	; >>>>> Line:	51
	; >>>>> printString(" IGNORED"); 
	mov	ax, L_myinth_11
	push	ax
	call	printString
	add	sp, 2
	; >>>>> Line:	52
	; >>>>> printNewLine(); 
	call	printNewLine
	; >>>>> Line:	53
	; >>>>> printNewLine(); 
	call	printNewLine
L_myinth_19:
	mov	sp, bp
	pop	bp
	ret
L_myinth_12:
	push	bp
	mov	bp, sp
	sub	sp, 4
	jmp	L_myinth_13
