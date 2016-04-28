; Generated by c86 (BYU-NASM) 5.1 (beta) from ReadyQueue.i
	CPU	8086
	ALIGN	2
	jmp	main	; Jump to program start
	ALIGN	2
initializeReadyQueue:
	; >>>>> Line:	7
	; >>>>> void initializeReadyQueue() { 
	jmp	L_ReadyQueue_1
L_ReadyQueue_2:
	; >>>>> Line:	8
	; >>>>> readyQueue.size = 0; 
	mov	word [(4+readyQueue)], 0
	; >>>>> Line:	9
	; >>>>> readyQueue.head = 0; 
	mov	word [readyQueue], 0
	; >>>>> Line:	10
	; >>>>> readyQueue.tail = 0; 
	mov	word [(2+readyQueue)], 0
	mov	sp, bp
	pop	bp
	ret
L_ReadyQueue_1:
	push	bp
	mov	bp, sp
	jmp	L_ReadyQueue_2
	ALIGN	2
insertReadyQueue:
	; >>>>> Line:	13
	; >>>>> void insertReadyQueue(TCB* tcb) { 
	jmp	L_ReadyQueue_4
L_ReadyQueue_5:
	; >>>>> Line:	17
	; >>>>> if(tcb == 0) return; 
	mov	ax, word [bp+4]
	test	ax, ax
	jne	L_ReadyQueue_6
	; >>>>> Line:	17
	; >>>>> if(tcb == 0) return; 
	jmp	L_ReadyQueue_7
L_ReadyQueue_6:
	; >>>>> Line:	20
	; >>>>> if (readyQueue.size == 0) { 
	mov	ax, word [(4+readyQueue)]
	test	ax, ax
	jne	L_ReadyQueue_8
	; >>>>> Line:	21
	; >>>>> readyQueue.head = tcb; 
	mov	ax, word [bp+4]
	mov	word [readyQueue], ax
	; >>>>> Line:	22
	; >>>>> readyQueue.tail = tcb; 
	mov	word [(2+readyQueue)], ax
	; >>>>> Line:	23
	; >>>>> tcb->next = 0; 
	mov	si, word [bp+4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	24
	; >>>>> tcb->prev = 0; 
	mov	si, word [bp+4]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	25
	; >>>>> readyQueue.size = 1; 
	mov	word [(4+readyQueue)], 1
	; >>>>> Line:	29
	; >>>>> return; 
	jmp	L_ReadyQueue_7
L_ReadyQueue_8:
	; >>>>> Line:	33
	; >>>>> if (readyQueue.size == 1) { 
	cmp	word [(4+readyQueue)], 1
	jne	L_ReadyQueue_9
	; >>>>> Line:	34
	; >>>>> if (readyQueue.head->priority < tcb->priority) { 
	mov	si, word [readyQueue]
	add	si, 2
	mov	di, word [bp+4]
	add	di, 2
	mov	al, byte [di]
	cmp	al, byte [si]
	jbe	L_ReadyQueue_10
	; >>>>> Line:	35
	; >>>>> readyQueue.head->next = tcb; 
	mov	si, word [readyQueue]
	add	si, 10
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	36
	; >>>>> tcb->prev = readyQueue.head; 
	mov	si, word [bp+4]
	add	si, 12
	mov	ax, word [readyQueue]
	mov	word [si], ax
	; >>>>> Line:	37
	; >>>>> tcb->next = 0; 
	mov	si, word [bp+4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	38
	; >>>>> readyQueue.tail = tcb; 
	mov	ax, word [bp+4]
	mov	word [(2+readyQueue)], ax
	; >>>>> Line:	39
	; >>>>> readyQueue.size++; 
	inc	word [(4+readyQueue)]
	; >>>>> Line:	40
	; >>>>> return; 
	jmp	L_ReadyQueue_7
	jmp	L_ReadyQueue_11
L_ReadyQueue_10:
	; >>>>> Line:	42
	; >>>>> tcb->next = readyQueue.head; 
	mov	si, word [bp+4]
	add	si, 10
	mov	ax, word [readyQueue]
	mov	word [si], ax
	; >>>>> Line:	43
	; >>>>> tcb->prev = 0; 
	mov	si, word [bp+4]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	44
	; >>>>> readyQueue.tail->prev = tcb; 
	mov	si, word [(2+readyQueue)]
	add	si, 12
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	45
	; >>>>> readyQueue.head = tcb; 
	mov	ax, word [bp+4]
	mov	word [readyQueue], ax
	; >>>>> Line:	46
	; >>>>> readyQueue.size++; 
	inc	word [(4+readyQueue)]
	; >>>>> Line:	50
	; >>>>> return; 
	jmp	L_ReadyQueue_7
L_ReadyQueue_11:
L_ReadyQueue_9:
	; >>>>> Line:	56
	; >>>>> temp = readyQueue.head; 
	mov	ax, word [readyQueue]
	mov	word [bp-2], ax
	; >>>>> Line:	57
	; >>>>> while (temp != 0) { 
	jmp	L_ReadyQueue_13
L_ReadyQueue_12:
	; >>>>> Line:	58
	; >>>>> if (temp->priority > tcb->priority) { 
	mov	si, word [bp-2]
	add	si, 2
	mov	di, word [bp+4]
	add	di, 2
	mov	al, byte [di]
	cmp	al, byte [si]
	jae	L_ReadyQueue_15
	; >>>>> Line:	59
	; >>>>> tcb->next = temp; 
	mov	si, word [bp+4]
	add	si, 10
	mov	ax, word [bp-2]
	mov	word [si], ax
	; >>>>> Line:	60
	; >>>>> tcb->prev = temp->prev; 
	mov	si, word [bp-2]
	add	si, 12
	mov	di, word [bp+4]
	add	di, 12
	mov	ax, word [si]
	mov	word [di], ax
	; >>>>> Line:	61
	; >>>>> temp->prev = tcb; 
	mov	si, word [bp-2]
	add	si, 12
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	62
	; >>>>> if (temp == readyQueue.head) readyQueue.head = tcb; 
	mov	ax, word [readyQueue]
	cmp	ax, word [bp-2]
	jne	L_ReadyQueue_16
	; >>>>> Line:	62
	; >>>>> if (temp == readyQueue.head) readyQueue.head = tcb; 
	mov	ax, word [bp+4]
	mov	word [readyQueue], ax
L_ReadyQueue_16:
	; >>>>> Line:	63
	; >>>>> readyQueue.size++; 
	inc	word [(4+readyQueue)]
	; >>>>> Line:	64
	; >>>>> retValu 
	jmp	L_ReadyQueue_7
L_ReadyQueue_15:
	; >>>>> Line:	66
	; >>>>> temp = temp->next; 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	mov	word [bp-2], ax
L_ReadyQueue_13:
	mov	ax, word [bp-2]
	test	ax, ax
	jne	L_ReadyQueue_12
L_ReadyQueue_14:
	; >>>>> Line:	70
	; >>>>> readyQueue.tail->next = tcb; 
	mov	si, word [(2+readyQueue)]
	add	si, 10
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	71
	; >>>>> tcb->prev = readyQueue.tail; 
	mov	si, word [bp+4]
	add	si, 12
	mov	ax, word [(2+readyQueue)]
	mov	word [si], ax
	; >>>>> Line:	72
	; >>>>> readyQueue.tail = tcb; 
	mov	ax, word [bp+4]
	mov	word [(2+readyQueue)], ax
	; >>>>> Line:	73
	; >>>>> tcb->next = 0; 
	mov	si, word [bp+4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	74
	; >>>>> readyQueue.size++; 
	inc	word [(4+readyQueue)]
L_ReadyQueue_7:
	; >>>>> Line:	75
	; >>>>> return; 
	mov	sp, bp
	pop	bp
	ret
L_ReadyQueue_4:
	push	bp
	mov	bp, sp
	push	cx
	jmp	L_ReadyQueue_5
	ALIGN	2
peekReadyQueue:
	; >>>>> Line:	79
	; >>>>> TCB* peekReadyQueue() { 
	jmp	L_ReadyQueue_18
L_ReadyQueue_19:
	; >>>>> Line:	81
	; >>>>> if (readyQueue.size == 0) { 
	mov	ax, word [(4+readyQueue)]
	test	ax, ax
	jne	L_ReadyQueue_20
	; >>>>> Line:	82
	; >>>>> return 0; 
	xor	ax, ax
	jmp	L_ReadyQueue_21
	jmp	L_ReadyQueue_22
L_ReadyQueue_20:
	; >>>>> Line:	84
	; >>>>> return readyQueue.head; 
	mov	ax, word [readyQueue]
L_ReadyQueue_22:
L_ReadyQueue_21:
	mov	sp, bp
	pop	bp
	ret
L_ReadyQueue_18:
	push	bp
	mov	bp, sp
	jmp	L_ReadyQueue_19
	ALIGN	2
removeReadyQueue:
	; >>>>> Line:	89
	; >>>>> TCB* removeReadyQueue() { 
	jmp	L_ReadyQueue_24
L_ReadyQueue_25:
	; >>>>> Line:	94
	; >>>>> if (readyQueue.size == 0) { 
	mov	ax, word [(4+readyQueue)]
	test	ax, ax
	jne	L_ReadyQueue_26
	; >>>>> Line:	95
	; >>>>> return 0; 
	xor	ax, ax
	jmp	L_ReadyQueue_27
L_ReadyQueue_26:
	; >>>>> Line:	99
	; >>>>> if (readyQueue.size == 1) { 
	cmp	word [(4+readyQueue)], 1
	jne	L_ReadyQueue_28
	; >>>>> Line:	102
	; >>>>> retValue = readyQueue.head; 
	mov	ax, word [readyQueue]
	mov	word [bp-2], ax
	; >>>>> Line:	103
	; >>>>> readyQueue.size--; 
	dec	word [(4+readyQueue)]
	; >>>>> Line:	104
	; >>>>> readyQueue.head = 0; 
	mov	word [readyQueue], 0
	; >>>>> Line:	105
	; >>>>> readyQueue.tail = 0; 
	mov	word [(2+readyQueue)], 0
	; >>>>> Line:	106
	; >>>>> return retValu 
	mov	ax, word [bp-2]
	jmp	L_ReadyQueue_27
L_ReadyQueue_28:
	; >>>>> Line:	112
	; >>>>> retValue = readyQueue.head; 
	mov	ax, word [readyQueue]
	mov	word [bp-2], ax
	; >>>>> Line:	113
	; >>>>> readyQueue.head = readyQueue.head->next; 
	mov	si, word [readyQueue]
	add	si, 10
	mov	ax, word [si]
	mov	word [readyQueue], ax
	; >>>>> Line:	114
	; >>>>> readyQueue.size--; 
	dec	word [(4+readyQueue)]
	; >>>>> Line:	115
	; >>>>> retValue->next = 0; 
	mov	si, word [bp-2]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	116
	; >>>>> retValue->prev = 0; 
	mov	si, word [bp-2]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	117
	; >>>>> return retValue; 
	mov	ax, word [bp-2]
L_ReadyQueue_27:
	mov	sp, bp
	pop	bp
	ret
L_ReadyQueue_24:
	push	bp
	mov	bp, sp
	push	cx
	jmp	L_ReadyQueue_25
