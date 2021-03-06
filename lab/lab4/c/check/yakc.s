; Generated by c86 (BYU-NASM) 5.1 (beta) from yakc.i
	CPU	8086
	ALIGN	2
	jmp	main	; Jump to program start
	ALIGN	2
YKCtxSwCount:
	DW	0
YKIdleCount:
	DW	0
YKTickCounter:
	DW	0
L_yakc_1:
	DW	0
L_yakc_4:
	DW	0
	ALIGN	2
YKEnterMutex:
	; >>>>> Line:	25
	; >>>>> void YKEnterMutex(void) { 
	jmp	L_yakc_5
L_yakc_6:
	; >>>>> Line:	28
	; >>>>> asm("cli"); 
	cli
	mov	sp, bp
	pop	bp
	ret
L_yakc_5:
	push	bp
	mov	bp, sp
	jmp	L_yakc_6
	ALIGN	2
YKExitMutex:
	; >>>>> Line:	32
	; >>>>> void YKExitMutex(void) { 
	jmp	L_yakc_8
L_yakc_9:
	; >>>>> Line:	35
	; >>>>> asm("sti"); 
	sti
	mov	sp, bp
	pop	bp
	ret
L_yakc_8:
	push	bp
	mov	bp, sp
	jmp	L_yakc_9
	ALIGN	2
YKEnterISR:
	; >>>>> Line:	39
	; >>>>> void YKEnterISR(void) { 
	jmp	L_yakc_11
L_yakc_12:
	; >>>>> Line:	41
	; >>>>> ISRCallDepth++; 
	inc	word [L_yakc_1]
	mov	sp, bp
	pop	bp
	ret
L_yakc_11:
	push	bp
	mov	bp, sp
	jmp	L_yakc_12
	ALIGN	2
YKExitISR:
	; >>>>> Line:	45
	; >>>>> void YKExitISR(void) { 
	jmp	L_yakc_14
L_yakc_15:
	; >>>>> Line:	47
	; >>>>> ISRCallDepth--; 
	dec	word [L_yakc_1]
	; >>>>> Line:	48
	; >>>>> if (ISRCallDepth == 0) YKScheduler(); 
	mov	ax, word [L_yakc_1]
	test	ax, ax
	jne	L_yakc_16
	; >>>>> Line:	48
	; >>>>> if (ISRCallDepth == 0) YKScheduler(); 
	call	YKScheduler
L_yakc_16:
	mov	sp, bp
	pop	bp
	ret
L_yakc_14:
	push	bp
	mov	bp, sp
	jmp	L_yakc_15
	ALIGN	2
YKInitialize:
	; >>>>> Line:	52
	; >>>>> void YKInitialize(void) { 
	jmp	L_yakc_18
L_yakc_19:
	; >>>>> Line:	54
	; >>>>> YKEnterMutex(); 
	call	YKEnterMutex
	; >>>>> Line:	57
	; >>>>> initializeReadyQueue(); 
	call	initializeReadyQueue
	; >>>>> Line:	58
	; >>>>> initializeDelayQueue(); 
	call	initializeDelayQueue
	; >>>>> Line:	61
	; >>>>> taskBlock.nextFreeTCB == 0; 
	mov	ax, word [(70+L_yakc_2)]
	test	ax, ax
	je	L_yakc_20
	xor	ax, ax
	jmp	L_yakc_21
L_yakc_20:
	mov	ax, 1
L_yakc_21:
	; >>>>> Line:	65
	; >>>>> YKNewTask(YKIdleTask, &idleTaskStack[10], 100); 
	mov	al, 100
	push	ax
	mov	ax, (L_yakc_3+20)
	push	ax
	mov	ax, YKIdleTask
	push	ax
	call	YKNewTask
	add	sp, 6
	; >>>>> Line:	68
	; >>>>> YKExitMutex(); 
	call	YKExitMutex
L_yakc_22:
	; >>>>> Line:	69
	; >>>>> return; 
	mov	sp, bp
	pop	bp
	ret
L_yakc_18:
	push	bp
	mov	bp, sp
	jmp	L_yakc_19
L_yakc_24:
	DB	"IdleTask ran",0xA,0
	ALIGN	2
YKIdleTask:
	; >>>>> Line:	73
	; >>>>> void YKIdleTask(void) { 
	jmp	L_yakc_25
L_yakc_26:
	; >>>>> Line:	75
	; >>>>> printString("IdleTas 
	mov	ax, L_yakc_24
	push	ax
	call	printString
	add	sp, 2
	; >>>>> Line:	77
	; >>>>> while (1) { 
	jmp	L_yakc_28
L_yakc_27:
	; >>>>> Line:	78
	; >>>>> YKEnterMutex(); 
	call	YKEnterMutex
	; >>>>> Line:	79
	; >>>>> YKIdleCount++; 
	inc	word [YKIdleCount]
	; >>>>> Line:	80
	; >>>>> YKExitMutex(); 
	call	YKExitMutex
L_yakc_28:
	jmp	L_yakc_27
L_yakc_29:
	mov	sp, bp
	pop	bp
	ret
L_yakc_25:
	push	bp
	mov	bp, sp
	jmp	L_yakc_26
	ALIGN	2
YKScheduler:
	; >>>>> Line:	85
	; >>>>> void YKScheduler(void) { 
	jmp	L_yakc_31
L_yakc_32:
	; >>>>> Line:	89
	; >>>>> YKEnterMutex(); 
	call	YKEnterMutex
	; >>>>> Line:	90
	; >>>>> if (kernelState == K_BLOCKED) return; 
	mov	ax, word [L_yakc_4]
	test	ax, ax
	jne	L_yakc_33
	; >>>>> Line:	90
	; >>>>> if (kernelState == K_BLOCKED) return; 
	jmp	L_yakc_34
L_yakc_33:
	; >>>>> Line:	91
	; >>>>> readyTask = peekReadyQueue(); 
	call	peekReadyQueue
	mov	word [bp-2], ax
	; >>>>> Line:	92
	; >>>>> if (readyTask == 0) exit(2); 
	mov	ax, word [bp-2]
	test	ax, ax
	jne	L_yakc_35
	; >>>>> Line:	92
	; >>>>> if (readyTask == 0) exit(2); 
	mov	al, 2
	push	ax
	call	exit
	add	sp, 2
L_yakc_35:
	; >>>>> Line:	93
	; >>>>> if (readyTask != currentTask) { 
	mov	ax, word [currentTask]
	cmp	ax, word [bp-2]
	je	L_yakc_36
	; >>>>> Line:	94
	; >>>>> currentTask->state = T_READY; 
	mov	si, word [currentTask]
	add	si, 6
	mov	word [si], 1
	; >>>>> Line:	95
	; >>>>> currentTask = readyTask; 
	mov	ax, word [bp-2]
	mov	word [currentTask], ax
	; >>>>> Line:	96
	; >>>>> YKCtxSwCount++; 
	inc	word [YKCtxSwCount]
	; >>>>> Line:	97
	; >>>>> readyTask->state = T_RUNNING; 
	mov	si, word [bp-2]
	add	si, 6
	mov	word [si], 2
	; >>>>> Line:	98
	; >>>>> YKDispatcher(readyTask); 
	push	word [bp-2]
	call	YKDispatcher
	add	sp, 2
	; >>>>> Line:	99
	; >>>>> YKExitMutex(); 
	call	YKExitMutex
	; >>>>> Line:	100
	; >>>>> return; 
	jmp	L_yakc_34
L_yakc_36:
	; >>>>> Line:	102
	; >>>>> YKExitMutex(); 
	call	YKExitMutex
L_yakc_34:
	; >>>>> Line:	103
	; >>>>> return; 
	mov	sp, bp
	pop	bp
	ret
L_yakc_31:
	push	bp
	mov	bp, sp
	push	cx
	jmp	L_yakc_32
	ALIGN	2
YKNewTask:
	; >>>>> Line:	106
	; >>>>> ], cx"); 
	jmp	L_yakc_38
L_yakc_39:
	; >>>>> Line:	114
	; >>>>> newTask = getNewTCB(); 
	call	getNewTCB
	mov	word [bp-2], ax
	; >>>>> Line:	115
	; >>>>> if (newTask == 0) exit(1); 
	mov	ax, word [bp-2]
	test	ax, ax
	jne	L_yakc_40
	; >>>>> Line:	115
	; >>>>> if (newTask == 0) exit(1); 
	mov	al, 1
	push	ax
	call	exit
	add	sp, 2
L_yakc_40:
	; >>>>> Line:	119
	; >>>>> newTask->tid = 0; 
	mov	si, word [bp-2]
	mov	word [si], 0
	; >>>>> Line:	120
	; >>>>> newTask->priority = priority; 
	mov	si, word [bp-2]
	add	si, 2
	mov	al, byte [bp+8]
	mov	byte [si], al
	; >>>>> Line:	121
	; >>>>> newTask->stackPointer = ((void*)((int*) taskStack - 12)); 
	mov	ax, word [bp+6]
	sub	ax, 24
	mov	si, word [bp-2]
	add	si, 4
	mov	word [si], ax
	; >>>>> Line:	122
	; >>>>> newTask->state = T_READY; 
	mov	si, word [bp-2]
	add	si, 6
	mov	word [si], 1
	; >>>>> Line:	123
	; >>>>> newTask->delayCount = 0; 
	mov	si, word [bp-2]
	add	si, 8
	mov	word [si], 0
	; >>>>> Line:	124
	; >>>>> newTask->next = 0; 
	mov	si, word [bp-2]
	add	si, 10
	mov	word [si], 0
	; >>>>> Line:	125
	; >>>>> newTask->prev = 0; 
	mov	si, word [bp-2]
	add	si, 12
	mov	word [si], 0
	; >>>>> Line:	129
	; >>>>> asm("push bx"); 
	push bx
	; >>>>> Line:	130
	; >>>>> asm("push cx"); 
	push cx
	; >>>>> Line:	131
	; >>>>> asm("mov bx, [bp+6]"); 
	mov bx, [bp+6]
	; >>>>> Line:	132
	; >>>>> asm("mov cx, [bp+4]"); 
	mov cx, [bp+4]
	; >>>>> Line:	133
	; >>>>> asm("mov [bx-2], word 0x0200"); 
	mov [bx-2], word 0x0200
	; >>>>> Line:	134
	; >>>>> asm("mov [bx-4], word 0x0"); 
	mov [bx-4], word 0x0
	; >>>>> Line:	135
	; >>>>> asm("mov [bx-6], cx"); 
	mov [bx-6], cx
	; >>>>> Line:	136
	; >>>>> asm("pop cx"); 
	pop cx
	; >>>>> Line:	137
	; >>>>> asm("po 
	pop bx
	; >>>>> Line:	141
	; >>>>> insertReadyQueue(newTask); 
	push	word [bp-2]
	call	insertReadyQueue
	add	sp, 2
	; >>>>> Line:	143
	; >>>>> asm("int 0x20"); 
	int 0x20
L_yakc_41:
	; >>>>> Line:	144
	; >>>>> return; 
	mov	sp, bp
	pop	bp
	ret
L_yakc_38:
	push	bp
	mov	bp, sp
	push	cx
	jmp	L_yakc_39
	ALIGN	2
getNewTCB:
	; >>>>> Line:	148
	; >>>>> TCB* getNewTCB(void) { 
	jmp	L_yakc_43
L_yakc_44:
	; >>>>> Line:	151
	; >>>>> if (taskBlock.nextFreeTCB < 4 + 1) { 
	cmp	word [(70+L_yakc_2)], 5
	jae	L_yakc_45
	; >>>>> Line:	152
	; >>>>> task = &taskBlock.TCBPool[taskBlock.nextFreeTCB]; 
	mov	ax, word [(70+L_yakc_2)]
	mov	cx, 14
	imul	cx
	add	ax, L_yakc_2
	mov	word [bp-2], ax
	; >>>>> Line:	153
	; >>>>> taskBlock.nextFreeTCB++; 
	inc	word [(70+L_yakc_2)]
	; >>>>> Line:	154
	; >>>>> return task; 
	mov	ax, word [bp-2]
	jmp	L_yakc_46
	jmp	L_yakc_47
L_yakc_45:
	; >>>>> Line:	156
	; >>>>> return 0; 
	xor	ax, ax
L_yakc_47:
L_yakc_46:
	mov	sp, bp
	pop	bp
	ret
L_yakc_43:
	push	bp
	mov	bp, sp
	push	cx
	jmp	L_yakc_44
	ALIGN	2
YKRun:
	; >>>>> Line:	161
	; >>>>> void YKRun(void) { 
	jmp	L_yakc_49
L_yakc_50:
	; >>>>> Line:	163
	; >>>>> YKEnterMutex(); 
	call	YKEnterMutex
	; >>>>> Line:	164
	; >>>>> kernelState = K_RUNNING; 
	mov	word [L_yakc_4], 1
	; >>>>> Line:	165
	; >>>>> YKScheduler(); 
	call	YKScheduler
	; >>>>> Line:	166
	; >>>>> YKExitMutex(); 
	call	YKExitMutex
L_yakc_51:
	; >>>>> Line:	167
	; >>>>> return; 
	mov	sp, bp
	pop	bp
	ret
L_yakc_49:
	push	bp
	mov	bp, sp
	jmp	L_yakc_50
	ALIGN	2
YKDelayTask:
	; >>>>> Line:	171
	; >>>>> void YKDelayTask(unsigned int count) { 
	jmp	L_yakc_53
L_yakc_54:
	; >>>>> Line:	175
	; >>>>> if (count == 0) return; 
	mov	ax, word [bp+4]
	test	ax, ax
	jne	L_yakc_55
	; >>>>> Line:	175
	; >>>>> if (count == 0) return; 
	jmp	L_yakc_56
L_yakc_55:
	; >>>>> Line:	177
	; >>>>> currentTask->state = T_BLOCKED; 
	mov	si, word [currentTask]
	add	si, 6
	mov	word [si], 0
	; >>>>> Line:	178
	; >>>>> currentT 
	mov	si, word [currentTask]
	add	si, 8
	mov	ax, word [bp+4]
	mov	word [si], ax
	; >>>>> Line:	179
	; >>>>> delayedTask = removeReadyQueue(); 
	call	removeReadyQueue
	mov	word [bp-2], ax
	; >>>>> Line:	180
	; >>>>> insertDelayQueue(delayedTask); 
	push	word [bp-2]
	call	insertDelayQueue
	add	sp, 2
	; >>>>> Line:	181
	; >>>>> asm("int 0x20"); 
	int 0x20
L_yakc_56:
	; >>>>> Line:	182
	; >>>>> return; 
	mov	sp, bp
	pop	bp
	ret
L_yakc_53:
	push	bp
	mov	bp, sp
	push	cx
	jmp	L_yakc_54
	ALIGN	2
YKTickHandler:
	; >>>>> Line:	186
	; >>>>> void YKTickHandler(void) { 
	jmp	L_yakc_58
L_yakc_59:
	; >>>>> Line:	188
	; >>>>> tickClock(); 
	call	tickClock
	mov	sp, bp
	pop	bp
	ret
L_yakc_58:
	push	bp
	mov	bp, sp
	jmp	L_yakc_59
	ALIGN	2
currentTask:
	TIMES	2 db 0
readyQueue:
	TIMES	6 db 0
delayQueue:
	TIMES	4 db 0
L_yakc_2:
	TIMES	72 db 0
L_yakc_3:
	TIMES	20 db 0
