; Generated by c86 (BYU-NASM) 5.1 (beta) from switch.i
	CPU	8086
	ALIGN	2
	jmp	main	; Jump to program start
	ALIGN	2
main:
	; >>>>> Line:	5
	; >>>>> int main(){ 
	jmp	L_switch_1
L_switch_2:
	; >>>>> Line:	11
	; >>>>> switch(i){ 
	mov	word [bp-2], 5
	mov	word [bp-4], 7
	mov	word [bp-6], 1
	; >>>>> Line:	11
	; >>>>> switch(i){ 
	mov	ax, word [bp-6]
	sub	ax, 77
	je	L_switch_5
	sub	ax, 244
	je	L_switch_6
	sub	ax, 262
	je	L_switch_7
	sub	ax, 267
	je	L_switch_8
	sub	ax, -849
	je	L_switch_9
	sub	ax, 4
	je	L_switch_10
	sub	ax, 57
	je	L_switch_11
	sub	ax, 363
	je	L_switch_12
	jmp	L_switch_4
L_switch_5:
	; >>>>> Line:	13
	; >>>>> case 77: x = x+y; break; 
	mov	ax, word [bp-2]
	add	ax, word [bp-4]
	mov	word [bp-2], ax
	; >>>>> Line:	13
	; >>>>> case 77: x = x+y; break; 
	jmp	L_switch_3
L_switch_6:
	; >>>>> Line:	14
	; >>>>> case 321: x = x-y; break; 
	mov	ax, word [bp-2]
	sub	ax, word [bp-4]
	mov	word [bp-2], ax
	; >>>>> Line:	14
	; >>>>> case 321: x = x-y; break; 
	jmp	L_switch_3
L_switch_7:
	; >>>>> Line:	15
	; >>>>> case 583: x = x*y; break; 
	mov	ax, word [bp-2]
	imul	word [bp-4]
	mov	word [bp-2], ax
	; >>>>> Line:	15
	; >>>>> case 583: x = x*y; break; 
	jmp	L_switch_3
L_switch_8:
	; >>>>> Line:	16
	; >>>>> case 850: x = x/y; break; 
	mov	ax, word [bp-2]
	cwd
	idiv	word [bp-4]
	mov	word [bp-2], ax
	; >>>>> Line:	16
	; >>>>> case 850: x = x/y; break; 
	jmp	L_switch_3
L_switch_9:
	; >>>>> Line:	17
	; >>>>> case 1: x = x%y; break; 
	mov	ax, word [bp-2]
	cwd
	idiv	word [bp-4]
	mov	ax, dx
	mov	word [bp-2], ax
	; >>>>> Line:	17
	; >>>>> case 1: x = x%y; break; 
	jmp	L_switch_3
L_switch_10:
	; >>>>> Line:	18
	; >>>>> case 5: x = x^y; break; 
	mov	ax, word [bp-2]
	xor	ax, word [bp-4]
	mov	word [bp-2], ax
	; >>>>> Line:	18
	; >>>>> case 5: x = x^y; break; 
	jmp	L_switch_3
L_switch_11:
	; >>>>> Line:	19
	; >>>>> case 62: printInt(x); break; 
	push	word [bp-2]
	call	printInt
	add	sp, 2
	; >>>>> Line:	19
	; >>>>> case 62: printInt(x); break; 
	jmp	L_switch_3
L_switch_12:
	; >>>>> Line:	20
	; >>>>> case 425: printInt(y); break; 
	push	word [bp-4]
	call	printInt
	add	sp, 2
	; >>>>> Line:	20
	; >>>>> case 425: printInt(y); break; 
	jmp	L_switch_3
L_switch_4:
	; >>>>> Line:	21
	; >>>>> default: printInt(x+y); break; 
	mov	ax, word [bp-2]
	add	ax, word [bp-4]
	push	ax
	call	printInt
	add	sp, 2
L_switch_3:
	; >>>>> Line:	27
	; >>>>> return 0; 
	xor	ax, ax
L_switch_13:
	mov	sp, bp
	pop	bp
	ret
L_switch_1:
	push	bp
	mov	bp, sp
	sub	sp, 6
	jmp	L_switch_2
