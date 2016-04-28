; Generated by c86 (BYU-NASM) 5.1 (beta) from DelayQueue.i
	CPU	8086
	ALIGN	2
	jmp	main	; Jump to program start
	ALIGN	2
initializeDelayQueue:
	; >>>>> Line:	8
	; >>>>> void initializeDelayQueue() { 
	jmp	L_DelayQueue_1
L_DelayQueue_2:
	; >>>>> Line:	9
	; >>>>> delayQueue.size = 0; 
	mov	word [(2+delayQueue)], 0
	; >>>>> Line:	10
	; >>>>> delayQueue.head = 0; 
	mov	word [delayQueue], 0
	mov	sp, bp
	pop	bp
	ret
L_DelayQueue_1:
	push	bp
	mov	bp, sp
	jmp	L_DelayQueue_2
	ALIGN	2
tickClock:
	; >>>>> Line:	13
	; >>>>> void tickClock() { 
	jmp	L_DelayQueue_4
L_DelayQueue_5:
	; >>>>> Line:	18
	; >>>>> if (delayQueue.size == 0) return; 
	mov	ax, word [(2+delayQueue)]
	test	ax, ax
	jne	L_DelayQueue_6
	; >>>>> Line:	18
	; >>>>> if (delayQueue.size == 0) return; 
	jmp	L_DelayQueue_7
L_DelayQueue_6:
	; >>>>> Line:	21
	; >>>>> current = delayQueue.head; 
	mov	ax, word [delayQueue]
	mov	word [bp-2], ax
	; >>>>> Line:	22
	; >>>>> while (current != 0) { 
	jmp	L_DelayQueue_9
L_DelayQueue_8:
	; >>>>> Line:	23
	; >>>>> rent != 0) { 
	mov	si, word [bp-2]
	add	si, 8
	dec	word [si]
	; >>>>> Line:	24
	; >>>>> temp = current; 
	mov	ax, word [bp-2]
	mov	word [bp-4], ax
	; >>>>> Line:	25
	; >>>>> if (temp->delayCount == 0) { 
	mov	si, word [bp-4]
	add	si, 8
	mov	ax, word [si]
	test	ax, ax
	jne	L_DelayQueue_11
	; >>>>> Line:	26
	; >>>>> removeDelayQueue(temp); 
	push	word [bp-4]
	call	removeDelayQueue
	add	sp, 2
L_DelayQueue_11:
	; >>>>> Line:	28
	; >>>>> current = current->next; 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	mov	word [bp-2], ax
L_DelayQueue_9:
	mov	ax, word [bp-2]
	test	ax, ax
	jne	L_DelayQueue_8
L_DelayQueue_10:
L_DelayQueue_7:
	mov	sp, bp
	pop	bp
	ret
L_DelayQueue_4:
	push	bp
	mov	bp, sp
	sub	sp, 4
	jmp	L_DelayQueue_5
	ALIGN	2
insertDelayQueue:
	; >>>>> Line:	33
	; >>>>> void insertDelayQueue(TCB* tcb) { 
	jmp	L_DelayQueue_13
L_DelayQueue_14:
	; >>>>> Line:	38
	; >>>>> if (tcb == 0) return; 
	mov	ax, word [bp+4]
	test	ax, ax
	jne	L_DelayQueue_15
	; >>>>> Line:	38
	; >>>>> if (tcb == 0) return; 
	jmp	L_DelayQueue_16
L_DelayQueue_15:
	; >>>>> Line:	41
	; >>>>> if (delayQueue.size == 0) { 
	mov	ax, word [(2+delayQueue)]
	test	ax, ax
	jne	L_DelayQueue_17
	; >>>>> Line:	42
	; >>>>> delayQueue.head = tcb; 
	mov	ax, word [bp+4]
	mov	word [delayQueue], ax
	; >>>>> Line:	43
	; >>>>> tcb->next = 0; 
	mov	si, word [bp+4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	44
	; >>>>> tcb->prev = 0; 
	mov	si, word [bp+4]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	45
	; >>>>> delayQueue.size++; 
	inc	word [(2+delayQueue)]
	; >>>>> Line:	46
	; >>>>> return; 
	jmp	L_DelayQueue_16
L_DelayQueue_17:
	; >>>>> Line:	50
	; >>>>> current = delayQueue.head; 
	mov	ax, word [delayQueue]
	mov	word [bp-2], ax
	; >>>>> Line:	51
	; >>>>> sumCount = 0; 
	mov	word [bp-4], 0
	; >>>>> Line:	52
	; >>>>> while (current != 0) { 
	jmp	L_DelayQueue_19
L_DelayQueue_18:
	; >>>>> Line:	53
	; >>>>>  
	mov	si, word [bp-2]
	add	si, 8
	mov	ax, word [si]
	add	word [bp-4], ax
	; >>>>> Line:	54
	; >>>>> if (tcb->delayCount < sumCount) { 
	mov	si, word [bp+4]
	add	si, 8
	mov	ax, word [bp-4]
	cmp	ax, word [si]
	jbe	L_DelayQueue_21
	; >>>>> Line:	55
	; >>>>> tcb->prev = current->prev; 
	mov	si, word [bp-2]
	add	si, 12
	mov	di, word [bp+4]
	add	di, 12
	mov	ax, word [si]
	mov	word [di], ax
	; >>>>> Line:	56
	; >>>>> tcb->next = current; 
	mov	si, word [bp+4]
	add	si, 10
	mov	ax, word [bp-2]
	mov	word [si], ax
	; >>>>> Line:	57
	; >>>>> if (current == delayQueue.head) { 
	mov	ax, word [delayQueue]
	cmp	ax, word [bp-2]
	jne	L_DelayQueue_22
	; >>>>> Line:	58
	; >>>>> delayQueue.head = tcb; 
	mov	ax, word [bp+4]
	mov	word [delayQueue], ax
	; >>>>> Line:	59
	; >>>>> current->prev->next = tcb; 
	mov	si, word [bp-2]
	add	si, 12
	mov	si, word [si]
	add	si, 10
	mov	word [si], ax
L_DelayQueue_22:
	; >>>>> Line:	61
	; >>>>> current->prev = tcb; 
	mov	si, word [bp-2]
	add	si, 12
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	62
	; >>>>> delayQueue.size++; 
	inc	word [(2+delayQueue)]
	; >>>>> Line:	63
	; >>>>> tcb->delayCount = tcb->delayCount - sumCount; 
	mov	si, word [bp+4]
	add	si, 8
	mov	ax, word [si]
	sub	ax, word [bp-4]
	mov	si, word [bp+4]
	add	si, 8
	mov	word [si], ax
	; >>>>> Line:	64
	; >>>>> return; 
	jmp	L_DelayQueue_16
L_DelayQueue_21:
	; >>>>> Line:	66
	; >>>>> if (current->next == 0) { 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	test	ax, ax
	jne	L_DelayQueue_23
	; >>>>> Line:	67
	; >>>>> current->next = tcb; 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	68
	; >>>>> tcb->prev = current; 
	mov	si, word [bp+4]
	add	si, 12
	mov	ax, word [bp-2]
	mov	word [si], ax
	; >>>>> Line:	69
	; >>>>> tcb->next = 0; 
	mov	si, word [bp+4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	70
	; >>>>> delayQueue.size++; 
	inc	word [(2+delayQueue)]
	; >>>>> Line:	71
	; >>>>> tcb->delayCount = tcb->delayCount - sumCount; 
	mov	si, word [bp+4]
	add	si, 8
	mov	ax, word [si]
	sub	ax, word [bp-4]
	mov	si, word [bp+4]
	add	si, 8
	mov	word [si], ax
	; >>>>> Line:	72
	; >>>>> return; 
	jmp	L_DelayQueue_16
L_DelayQueue_23:
	; >>>>> Line:	74
	; >>>>> current = current->next; 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	mov	word [bp-2], ax
L_DelayQueue_19:
	mov	ax, word [bp-2]
	test	ax, ax
	jne	L_DelayQueue_18
L_DelayQueue_20:
L_DelayQueue_16:
	mov	sp, bp
	pop	bp
	ret
L_DelayQueue_13:
	push	bp
	mov	bp, sp
	sub	sp, 4
	jmp	L_DelayQueue_14
	ALIGN	2
removeDelayQueue:
	; >>>>> Line:	79
	; >>>>> void removeDelayQueue(TCB* tcb) { 
	jmp	L_DelayQueue_25
L_DelayQueue_26:
	; >>>>> Line:	84
	; >>>>> if (tcb == 0) return; 
	mov	ax, word [bp+4]
	test	ax, ax
	jne	L_DelayQueue_27
	; >>>>> Line:	84
	; >>>>> if (tcb == 0) return; 
	jmp	L_DelayQueue_28
L_DelayQueue_27:
	; >>>>> Line:	86
	; >>>>> current = delayQueue.head; 
	mov	ax, word [delayQueue]
	mov	word [bp-2], ax
	; >>>>> Line:	87
	; >>>>> while (current != 0) { 
	jmp	L_DelayQueue_30
L_DelayQueue_29:
	; >>>>> Line:	88
	; >>>>> if (current->priority = tcb->priority) { 
	mov	si, word [bp+4]
	add	si, 2
	mov	di, word [bp-2]
	add	di, 2
	mov	ax, word [si]
	mov	word [di], ax
	test	al, al
	je	L_DelayQueue_32
	; >>>>> Line:	89
	; >>>>> if (current == delayQueue.head) { 
	mov	ax, word [delayQueue]
	cmp	ax, word [bp-2]
	jne	L_DelayQueue_33
	; >>>>> Line:	90
	; >>>>> temp = current; 
	mov	ax, word [bp-2]
	mov	word [bp-4], ax
	; >>>>> Line:	91
	; >>>>> { 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	mov	word [bp-2], ax
	; >>>>> Line:	92
	; >>>>> delayQueue.head = temp->next; 
	mov	si, word [bp-4]
	add	si, 10
	mov	ax, word [si]
	mov	word [delayQueue], ax
	; >>>>> Line:	93
	; >>>>> temp->next->prev = 0; 
	mov	si, word [bp-4]
	add	si, 10
	mov	si, word [si]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	94
	; >>>>> delayQueue.size--; 
	dec	word [(2+delayQueue)]
	; >>>>> Line:	95
	; >>>>> temp->next = 0; 
	mov	si, word [bp-4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	96
	; >>>>> temp->prev = 0; 
	mov	si, word [bp-4]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	97
	; >>>>> insertReadyQueue(temp); 
	push	word [bp-4]
	call	insertReadyQueue
	add	sp, 2
	jmp	L_DelayQueue_34
L_DelayQueue_33:
	; >>>>> Line:	98
	; >>>>> } else if (current->next == 0) { 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	test	ax, ax
	jne	L_DelayQueue_35
	; >>>>> Line:	99
	; >>>>> temp = current; 
	mov	ax, word [bp-2]
	mov	word [bp-4], ax
	; >>>>> Line:	100
	; >>>>> current = current->next; 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	mov	word [bp-2], ax
	; >>>>> Line:	101
	; >>>>> temp->prev->next = 0; 
	mov	si, word [bp-4]
	add	si, 12
	mov	si, word [si]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	102
	; >>>>> delayQueue.size--; 
	dec	word [(2+delayQueue)]
	; >>>>> Line:	103
	; >>>>> insertReadyQueue(temp); 
	push	word [bp-4]
	call	insertReadyQueue
	add	sp, 2
	jmp	L_DelayQueue_36
L_DelayQueue_35:
	; >>>>> Line:	105
	; >>>>>  
	mov	ax, word [bp-2]
	mov	word [bp-4], ax
	; >>>>> Line:	106
	; >>>>> current = current->next; 
	mov	si, word [bp-2]
	add	si, 10
	mov	ax, word [si]
	mov	word [bp-2], ax
	; >>>>> Line:	107
	; >>>>> temp->prev->next = temp->next; 
	mov	si, word [bp-4]
	add	si, 10
	mov	di, word [bp-4]
	add	di, 12
	mov	di, word [di]
	add	di, 10
	mov	ax, word [si]
	mov	word [di], ax
	; >>>>> Line:	108
	; >>>>> temp->next->prev = temp->prev; 
	mov	si, word [bp-4]
	add	si, 12
	mov	di, word [bp-4]
	add	di, 10
	mov	di, word [di]
	add	di, 12
	mov	ax, word [si]
	mov	word [di], ax
	; >>>>> Line:	109
	; >>>>> temp->next = 0; 
	mov	si, word [bp-4]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	110
	; >>>>> temp->prev = 0; 
	mov	si, word [bp-4]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	111
	; >>>>> delayQueue.size--; 
	dec	word [(2+delayQueue)]
	; >>>>> Line:	112
	; >>>>> insertReadyQueue(temp); 
	push	word [bp-4]
	call	insertReadyQueue
	add	sp, 2
L_DelayQueue_36:
L_DelayQueue_34:
L_DelayQueue_32:
L_DelayQueue_30:
	mov	ax, word [bp-2]
	test	ax, ax
	jne	L_DelayQueue_29
L_DelayQueue_31:
L_DelayQueue_28:
	mov	sp, bp
	pop	bp
	ret
L_DelayQueue_25:
	push	bp
	mov	bp, sp
	sub	sp, 4
	jmp	L_DelayQueue_26
