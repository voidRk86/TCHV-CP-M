	public	C_BASE,C_SIZE

C_BASE:
L0004	EQU	04H
L0005	EQU	05H
L000B	EQU	0BH
L005C	EQU	5CH
L0080	EQU	80H
L0081	EQU	81H
L0100	EQU	0100H
L76F3	EQU	76F3H
LC400:		;C400
	JMP	LC75C	;0C75CH
	JMP	LC758	;0C758H
LC406:		;C406
	DB	7FH
LC407:		;C407
	DB	0
LC408:		;C408
	DS	0080H
LC488:		;C488
	DS	0002H
LC48A:		;C48A
	DS	0002H
LC48C:		;C48C 
	MOV	E,A
	MVI	C,2
	JMP	L0005	;5
LC492:		;C492 
	PUSH	B
	CALL	LC48C	;0C48CH
	POP	B
	RET
LC498:		;C498 
	MVI	A,0DH
	CALL	LC492	;0C492H
	MVI	A,0AH
	JMP	LC492	;0C492H
LC4A2:		;C4A2 
	MVI	A,' '	;20H
	JMP	LC492	;0C492H
LC4A7:		;C4A7 
	PUSH	B
	CALL	LC498	;0C498H
	POP	H
LC4AC:		;C4AC 
	MOV	A,M
	ORA	A
	RZ
	INX	H
	PUSH	H
	CALL	LC48C	;0C48CH
	POP	H
	JMP	LC4AC	;0C4ACH
LC4B8:		;C4B8 
	MVI	C,0DH
	JMP	L0005	;5
LC4BD:		;C4BD 
	MOV	E,A
	MVI	C,0EH
	JMP	L0005	;5
LC4C3:		;C4C3 
	CALL	L0005	;5
	STA	LCBEE	;0CBEEH
	INR	A
	RET
LC4CB:		;C4CB 
	MVI	C,0FH
	JMP	LC4C3	;0C4C3H
LC4D0:		;C4D0 
	XRA	A
	STA	LCBED	;0CBEDH
	LXI	D,LCBCD	;0CBCDH
	JMP	LC4CB	;0C4CBH
LC4DA:		;C4DA 
	MVI	C,10H
	JMP	LC4C3	;0C4C3H
LC4DF:		;C4DF 
	MVI	C,11H
	JMP	LC4C3	;0C4C3H
LC4E4:		;C4E4 
	MVI	C,12H
	JMP	LC4C3	;0C4C3H
LC4E9:		;C4E9 
	LXI	D,LCBCD	;0CBCDH
	JMP	LC4DF	;0C4DFH
LC4EF:		;C4EF 
	MVI	C,13H
	JMP	L0005	;5
LC4F4:		;C4F4 
	CALL	L0005	;5
	ORA	A
	RET
LC4F9:		;C4F9 
	MVI	C,14H
	JMP	LC4F4	;0C4F4H
LC4FE:		;C4FE 
	LXI	D,LCBCD	;0CBCDH
	JMP	LC4F9	;0C4F9H
LC504:		;C504 
	MVI	C,15H
	JMP	LC4F4	;0C4F4H
LC509:		;C509 
	MVI	C,16H
	JMP	LC4C3	;0C4C3H
LC50E:		;C50E 
	MVI	C,17H
	JMP	L0005	;5
LC513:		;C513 
	MVI	E,0FFH
LC515:		;C515 
	MVI	C,' '	;20H
	JMP	L0005	;5
LC51A:		;C51A
	CALL	LC513	;0C513H
	ADD	A
	ADD	A
	ADD	A
	ADD	A
	LXI	H,LCBEF	;0CBEFH
	ORA	M
	STA	L0004	;4
	RET
LC529:		;C529
	LDA	LCBEF	;0CBEFH
	STA	L0004	;4
	RET
LC530:		;C530 
	CPI	61H
	RC
	CPI	7BH
	RNC
	ANI	5FH
	RET
LC539:		;C539 
	LDA	LCBAB	;0CBABH
	ORA	A
	JZ	LC596	;0C596H
	LDA	LCBEF	;0CBEFH
	ORA	A
	MVI	A,0
	CNZ	LC4BD	;0C4BDH
	LXI	D,LCBAC	;0CBACH
	CALL	LC4CB	;0C4CBH
	JZ	LC596	;0C596H
	LDA	LCBBB	;0CBBBH
	DCR	A
	STA	LCBCC	;0CBCCH
	LXI	D,LCBAC	;0CBACH
	CALL	LC4F9	;0C4F9H
	JNZ	LC596	;0C596H
	LXI	D,LC407	;0C407H
	LXI	H,L0080	;80H
	MVI	B,80H
	CALL	LC842	;0C842H
	LXI	H,LCBBA	;0CBBAH
	MVI	M,0
	INX	H
	DCR	M
	LXI	D,LCBAC	;0CBACH
	CALL	LC4DA	;0C4DAH
	JZ	LC596	;0C596H
	LDA	LCBEF	;0CBEFH
	ORA	A
	CNZ	LC4BD	;0C4BDH
	LXI	H,LC408	;0C408H
	CALL	LC4AC	;0C4ACH
	CALL	LC5C2	;0C5C2H
	JZ	LC5A7	;0C5A7H
	CALL	LC5DD	;0C5DDH
	JMP	LC782	;0C782H
LC596:		;C596 
	CALL	LC5DD	;0C5DDH
	CALL	LC51A	;0C51AH
	MVI	C,0AH
	LXI	D,LC406	;0C406H
	CALL	L0005	;5
	CALL	LC529	;0C529H
LC5A7:		;C5A7 
	LXI	H,LC407	;0C407H
	MOV	B,M
LC5AB:		;C5AB 
	INX	H
	MOV	A,B
	ORA	A
	JZ	LC5BA	;0C5BAH
	MOV	A,M
	CALL	LC530	;0C530H
	MOV	M,A
	DCR	B
	JMP	LC5AB	;0C5ABH
LC5BA:		;C5BA 
	MOV	M,A
	LXI	H,LC408	;0C408H
	SHLD	LC488	;0C488H
	RET
LC5C2:		;C5C2 
	MVI	C,0BH
	CALL	L0005	;5
	ORA	A
	RZ
	MVI	C,1
	CALL	L0005	;5
	ORA	A
	RET
LC5D0:		;C5D0 
	MVI	C,19H
	JMP	L0005	;5
LC5D5:		;C5D5 
	LXI	D,L0080	;80H
LC5D8:		;C5D8 
	MVI	C,1AH
	JMP	L0005	;5
LC5DD:		;C5DD 
	LXI	H,LCBAB	;0CBABH
	MOV	A,M
	ORA	A
	RZ
	MVI	M,0
	XRA	A
	CALL	LC4BD	;0C4BDH
	LXI	D,LCBAC	;0CBACH
	CALL	LC4EF	;0C4EFH
	LDA	LCBEF	;0CBEFH
	JMP	LC4BD	;0C4BDH
LC5F5:		;C5F5 
	LXI	D,LC728	;0C728H
	LXI	H,LCC00	;0CC00H
	MVI	B,6
LC5FD:		;C5FD 
	LDAX	D
	CMP	M
	JNZ	LC7CF	;0C7CFH
	INX	D
	INX	H
	DCR	B
	JNZ	LC5FD	;0C5FDH
	RET
LC609:		;C609 
	CALL	LC498	;0C498H
	LHLD	LC48A	;0C48AH
LC60F:		;C60F 
	MOV	A,M
	CPI	' '	;20H
	JZ	LC622	;0C622H
	ORA	A
	JZ	LC622	;0C622H
	PUSH	H
	CALL	LC48C	;0C48CH
	POP	H
	INX	H
	JMP	LC60F	;0C60FH
LC622:		;C622 
	MVI	A,'?'	;3FH
	CALL	LC48C	;0C48CH
	CALL	LC498	;0C498H
	CALL	LC5DD	;0C5DDH
	JMP	LC782	;0C782H
LC630:		;C630 
	LDAX	D
	ORA	A
	RZ
	CPI	' '	;20H
	JC	LC609	;0C609H
	RZ
	CPI	'='	;3DH
	RZ
	CPI	5FH
	RZ
	CPI	'.'	;2EH
	RZ
	CPI	':'	;3AH
	RZ
	CPI	';'	;3BH
	RZ
	CPI	'<'	;3CH
	RZ
	CPI	'>'	;3EH
	RZ
	RET
LC64F:		;C64F 
	LDAX	D
	ORA	A
	RZ
	CPI	' '	;20H
	RNZ
	INX	D
	JMP	LC64F	;0C64FH
LC659:		;C659 
	ADD	L
	MOV	L,A
	RNC
	INR	H
	RET
LC65E:		;C65E 
	MVI	A,0
LC660:		;C660 
	LXI	H,LCBCD	;0CBCDH
	CALL	LC659	;0C659H
	PUSH	H
	PUSH	H
	XRA	A
	STA	LCBF0	;0CBF0H
	LHLD	LC488	;0C488H
	XCHG
	CALL	LC64F	;0C64FH
	XCHG
	SHLD	LC48A	;0C48AH
	XCHG
	POP	H
	LDAX	D
	ORA	A
	JZ	LC689	;0C689H
	SBI	'@'	;40H
	MOV	B,A
	INX	D
	LDAX	D
	CPI	':'	;3AH
	JZ	LC690	;0C690H
	DCX	D
LC689:		;C689 
	LDA	LCBEF	;0CBEFH
	MOV	M,A
	JMP	LC696	;0C696H
LC690:		;C690 
	MOV	A,B
	STA	LCBF0	;0CBF0H
	MOV	M,B
	INX	D
LC696:		;C696 
	MVI	B,8
LC698:		;C698 
	CALL	LC630	;0C630H
	JZ	LC6B9	;0C6B9H
	INX	H
	CPI	'*'	;2AH
	JNZ	LC6A9	;0C6A9H
	MVI	M,'?'	;3FH
	JMP	LC6AB	;0C6ABH
LC6A9:		;C6A9 
	MOV	M,A
	INX	D
LC6AB:		;C6AB 
	DCR	B
	JNZ	LC698	;0C698H
LC6AF:		;C6AF 
	CALL	LC630	;0C630H
	JZ	LC6C0	;0C6C0H
	INX	D
	JMP	LC6AF	;0C6AFH
LC6B9:		;C6B9 
	INX	H
	MVI	M,' '	;20H
	DCR	B
	JNZ	LC6B9	;0C6B9H
LC6C0:		;C6C0 
	MVI	B,3
	CPI	'.'	;2EH
	JNZ	LC6E9	;0C6E9H
	INX	D
LC6C8:		;C6C8 
	CALL	LC630	;0C630H
	JZ	LC6E9	;0C6E9H
	INX	H
	CPI	'*'	;2AH
	JNZ	LC6D9	;0C6D9H
	MVI	M,'?'	;3FH
	JMP	LC6DB	;0C6DBH
LC6D9:		;C6D9 
	MOV	M,A
	INX	D
LC6DB:		;C6DB 
	DCR	B
	JNZ	LC6C8	;0C6C8H
LC6DF:		;C6DF 
	CALL	LC630	;0C630H
	JZ	LC6F0	;0C6F0H
	INX	D
	JMP	LC6DF	;0C6DFH
LC6E9:		;C6E9 
	INX	H
	MVI	M,' '	;20H
	DCR	B
	JNZ	LC6E9	;0C6E9H
LC6F0:		;C6F0 
	MVI	B,3
LC6F2:		;C6F2 
	INX	H
	MVI	M,0
	DCR	B
	JNZ	LC6F2	;0C6F2H
	XCHG
	SHLD	LC488	;0C488H
	POP	H
	LXI	B,L000B	;0BH
LC701:		;C701 
	INX	H
	MOV	A,M
	CPI	'?'	;3FH
	JNZ	LC709	;0C709H
	INR	B
LC709:		;C709 
	DCR	C
	JNZ	LC701	;0C701H
	MOV	A,B
	ORA	A
	RET
LC710:		;C710 
	DB	'DIR ERA TYPESAVEREN USER'
LC728:		;C728
	DB	0F6H,16H,0,0,0,6BH
LC72E:		;C72E
	LXI	H,LC710	;0C710H
	MVI	C,0
LC733:		;C733 
	MOV	A,C
	CPI	6
	RNC
	LXI	D,LCBCE	;0CBCEH
	MVI	B,4
LC73C:		;C73C 
	LDAX	D
	CMP	M
	JNZ	LC74F	;0C74FH
	INX	D
	INX	H
	DCR	B
	JNZ	LC73C	;0C73CH
	LDAX	D
	CPI	' '	;20H
	JNZ	LC754	;0C754H
	MOV	A,C
	RET
LC74F:		;C74F 
	INX	H
	DCR	B
	JNZ	LC74F	;0C74FH
LC754:		;C754 
	INR	C
	JMP	LC733	;0C733H
LC758:		;C758 
	XRA	A
	STA	LC407	;0C407H
LC75C:		;C75C 
	LXI	SP,LCBAB	;0CBABH
	PUSH	B
	MOV	A,C
	RAR
	RAR
	RAR
	RAR
	ANI	0FH
	MOV	E,A
	CALL	LC515	;0C515H
	CALL	LC4B8	;0C4B8H
	STA	LCBAB	;0CBABH
	POP	B
	MOV	A,C
	ANI	0FH
	STA	LCBEF	;0CBEFH
	CALL	LC4BD	;0C4BDH
	LDA	LC407	;0C407H
	ORA	A
	JNZ	LC798	;0C798H
LC782:		;C782 
	LXI	SP,LCBAB	;0CBABH
	CALL	LC498	;0C498H
	CALL	LC5D0	;0C5D0H
	ADI	'A'	;41H
	CALL	LC48C	;0C48CH
	MVI	A,'>'	;3EH
	CALL	LC48C	;0C48CH
	CALL	LC539	;0C539H
LC798:		;C798 
	LXI	D,L0080	;80H
	CALL	LC5D8	;0C5D8H
	CALL	LC5D0	;0C5D0H
	STA	LCBEF	;0CBEFH
	CALL	LC65E	;0C65EH
	CNZ	LC609	;0C609H
	LDA	LCBF0	;0CBF0H
	ORA	A
	JNZ	LCAA5	;0CAA5H
	CALL	LC72E	;0C72EH
	LXI	H,LC7C1	;0C7C1H
	MOV	E,A
	MVI	D,0
	DAD	D
	DAD	D
	MOV	A,M
	INX	H
	MOV	H,M
	MOV	L,A
	PCHL
LC7C1:		;C7C1 
	DW	LC877	;0C877H
	DW	LC91F	;0C91FH
	DW	LC95D	;0C95DH
	DW	LC9AD	;0C9ADH
	DW	LCA10	;0CA10H
	DW	LCA8E	;0CA8EH
	DW	LCAA5	;0CAA5H
LC7CF:		;C7CF 
	LXI	H,L76F3	;76F3H
	SHLD	LC400	;0C400H
	LXI	H,LC400	;0C400H
	PCHL
LC7D9:		;C7D9 
	LXI	B,LC7DF	;0C7DFH
	JMP	LC4A7	;0C4A7H
LC7DF:		;C7DF 
	DB	'READ ERROR',0
LC7EA:		;C7EA 
	LXI	B,LC7F0	;0C7F0H
	JMP	LC4A7	;0C4A7H
LC7F0:		;C7F0 
	DB	'NO FILE',0
LC7F8:		;C7F8 
	CALL	LC65E	;0C65EH
	LDA	LCBF0	;0CBF0H
	ORA	A
	JNZ	LC609	;0C609H
	LXI	H,LCBCE	;0CBCEH
	LXI	B,L000B	;0BH
LC808:		;C808 
	MOV	A,M
	CPI	' '	;20H
	JZ	LC833	;0C833H
	INX	H
	SUI	'0'	;30H
	CPI	0AH
	JNC	LC609	;0C609H
	MOV	D,A
	MOV	A,B
	ANI	0E0H
	JNZ	LC609	;0C609H
	MOV	A,B
	RLC
	RLC
	RLC
	ADD	B
	JC	LC609	;0C609H
	ADD	B
	JC	LC609	;0C609H
	ADD	D
	JC	LC609	;0C609H
	MOV	B,A
	DCR	C
	JNZ	LC808	;0C808H
	RET
LC833:		;C833 
	MOV	A,M
	CPI	' '	;20H
	JNZ	LC609	;0C609H
	INX	H
	DCR	C
	JNZ	LC833	;0C833H
	MOV	A,B
	RET
LC840:		;C840 
	MVI	B,3
LC842:		;C842 
	MOV	A,M
	STAX	D
	INX	H
	INX	D
	DCR	B
	JNZ	LC842	;0C842H
	RET
LC84B:		;C84B 
	LXI	H,L0080	;80H
	ADD	C
	CALL	LC659	;0C659H
	MOV	A,M
	RET
LC854:		;C854 
	XRA	A
	STA	LCBCD	;0CBCDH
	LDA	LCBF0	;0CBF0H
	ORA	A
	RZ
	DCR	A
	LXI	H,LCBEF	;0CBEFH
	CMP	M
	RZ
	JMP	LC4BD	;0C4BDH
LC866:		;C866 
	LDA	LCBF0	;0CBF0H
	ORA	A
	RZ
	DCR	A
	LXI	H,LCBEF	;0CBEFH
	CMP	M
	RZ
	LDA	LCBEF	;0CBEFH
	JMP	LC4BD	;0C4BDH
LC877:		;C877 
	CALL	LC65E	;0C65EH
	CALL	LC854	;0C854H
	LXI	H,LCBCE	;0CBCEH
	MOV	A,M
	CPI	' '	;20H
	JNZ	LC88F	;0C88FH
	MVI	B,0BH
LC888:		;C888 
	MVI	M,'?'	;3FH
	INX	H
	DCR	B
	JNZ	LC888	;0C888H
LC88F:		;C88F 
	MVI	E,0
	PUSH	D
	CALL	LC4E9	;0C4E9H
	CZ	LC7EA	;0C7EAH
LC898:		;C898 
	JZ	LC91B	;0C91BH
	LDA	LCBEE	;0CBEEH
	RRC
	RRC
	RRC
	ANI	60H
	MOV	C,A
	MVI	A,0AH
	CALL	LC84B	;0C84BH
	RAL
	JC	LC90F	;0C90FH
	POP	D
	MOV	A,E
	INR	E
	PUSH	D
	ANI	3
	PUSH	PSW
	JNZ	LC8CC	;0C8CCH
	CALL	LC498	;0C498H
	PUSH	B
	CALL	LC5D0	;0C5D0H
	POP	B
	ADI	'A'	;41H
	CALL	LC492	;0C492H
	MVI	A,':'	;3AH
	CALL	LC492	;0C492H
	JMP	LC8D4	;0C8D4H
LC8CC:		;C8CC 
	CALL	LC4A2	;0C4A2H
	MVI	A,':'	;3AH
	CALL	LC492	;0C492H
LC8D4:		;C8D4 
	CALL	LC4A2	;0C4A2H
	MVI	B,1
LC8D9:		;C8D9 
	MOV	A,B
	CALL	LC84B	;0C84BH
	ANI	7FH
	CPI	' '	;20H
	JNZ	LC8F9	;0C8F9H
	POP	PSW
	PUSH	PSW
	CPI	3
	JNZ	LC8F7	;0C8F7H
	MVI	A,9
	CALL	LC84B	;0C84BH
	ANI	7FH
	CPI	' '	;20H
	JZ	LC90E	;0C90EH
LC8F7:		;C8F7 
	MVI	A,' '	;20H
LC8F9:		;C8F9 
	CALL	LC492	;0C492H
	INR	B
	MOV	A,B
	CPI	0CH
	JNC	LC90E	;0C90EH
	CPI	9
	JNZ	LC8D9	;0C8D9H
	CALL	LC4A2	;0C4A2H
	JMP	LC8D9	;0C8D9H
LC90E:		;C90E 
	POP	PSW
LC90F:		;C90F 
	CALL	LC5C2	;0C5C2H
	JNZ	LC91B	;0C91BH
	CALL	LC4E4	;0C4E4H
	JMP	LC898	;0C898H
LC91B:		;C91B 
	POP	D
	JMP	LCB86	;0CB86H
LC91F:		;C91F 
	CALL	LC65E	;0C65EH
	CPI	0BH
	JNZ	LC942	;0C942H
	LXI	B,LC952	;0C952H
	CALL	LC4A7	;0C4A7H
	CALL	LC539	;0C539H
	LXI	H,LC407	;0C407H
	DCR	M
	JNZ	LC782	;0C782H
	INX	H
	MOV	A,M
	CPI	'Y'	;59H
	JNZ	LC782	;0C782H
	INX	H
	SHLD	LC488	;0C488H
LC942:		;C942 
	CALL	LC854	;0C854H
	LXI	D,LCBCD	;0CBCDH
	CALL	LC4EF	;0C4EFH
	INR	A
	CZ	LC7EA	;0C7EAH
	JMP	LCB86	;0CB86H
LC952:		;C952 
	DB	'ALL (Y/N)?',0
LC95D:		;C95D 
	CALL	LC65E	;0C65EH
	JNZ	LC609	;0C609H
	CALL	LC854	;0C854H
	CALL	LC4D0	;0C4D0H
	JZ	LC9A7	;0C9A7H
	CALL	LC498	;0C498H
	LXI	H,LCBF1	;0CBF1H
	MVI	M,0FFH
LC974:		;C974 
	LXI	H,LCBF1	;0CBF1H
	MOV	A,M
	CPI	80H
	JC	LC987	;0C987H
	PUSH	H
	CALL	LC4FE	;0C4FEH
	POP	H
	JNZ	LC9A0	;0C9A0H
	XRA	A
	MOV	M,A
LC987:		;C987 
	INR	M
	LXI	H,L0080	;80H
	CALL	LC659	;0C659H
	MOV	A,M
	CPI	1AH
	JZ	LCB86	;0CB86H
	CALL	LC48C	;0C48CH
	CALL	LC5C2	;0C5C2H
	JNZ	LCB86	;0CB86H
	JMP	LC974	;0C974H
LC9A0:		;C9A0 
	DCR	A
	JZ	LCB86	;0CB86H
	CALL	LC7D9	;0C7D9H
LC9A7:		;C9A7 
	CALL	LC866	;0C866H
	JMP	LC609	;0C609H
LC9AD:		;C9AD 
	CALL	LC7F8	;0C7F8H
	PUSH	PSW
	CALL	LC65E	;0C65EH
	JNZ	LC609	;0C609H
	CALL	LC854	;0C854H
	LXI	D,LCBCD	;0CBCDH
	PUSH	D
	CALL	LC4EF	;0C4EFH
	POP	D
	CALL	LC509	;0C509H
	JZ	LC9FB	;0C9FBH
	XRA	A
	STA	LCBED	;0CBEDH
	POP	PSW
	MOV	L,A
	MVI	H,0
	DAD	H
	LXI	D,L0100	;0100H
LC9D4:		;C9D4 
	MOV	A,H
	ORA	L
	JZ	LC9F1	;0C9F1H
	DCX	H
	PUSH	H
	LXI	H,L0080	;80H
	DAD	D
	PUSH	H
	CALL	LC5D8	;0C5D8H
	LXI	D,LCBCD	;0CBCDH
	CALL	LC504	;0C504H
	POP	D
	POP	H
	JNZ	LC9FB	;0C9FBH
	JMP	LC9D4	;0C9D4H
LC9F1:		;C9F1 
	LXI	D,LCBCD	;0CBCDH
	CALL	LC4DA	;0C4DAH
	INR	A
	JNZ	LCA01	;0CA01H
LC9FB:		;C9FB 
	LXI	B,LCA07	;0CA07H
	CALL	LC4A7	;0C4A7H
LCA01:		;CA01 
	CALL	LC5D5	;0C5D5H
	JMP	LCB86	;0CB86H
LCA07:		;CA07 
	DB	'NO SPACE',0
LCA10:		;CA10 
	CALL	LC65E	;0C65EH
	JNZ	LC609	;0C609H
	LDA	LCBF0	;0CBF0H
	PUSH	PSW
	CALL	LC854	;0C854H
	CALL	LC4E9	;0C4E9H
	JNZ	LCA79	;0CA79H
	LXI	H,LCBCD	;0CBCDH
	LXI	D,LCBDD	;0CBDDH
	MVI	B,10H
	CALL	LC842	;0C842H
	LHLD	LC488	;0C488H
	XCHG
	CALL	LC64F	;0C64FH
	CPI	'='	;3DH
	JZ	LCA3F	;0CA3FH
	CPI	5FH
	JNZ	LCA73	;0CA73H
LCA3F:		;CA3F 
	XCHG
	INX	H
	SHLD	LC488	;0C488H
	CALL	LC65E	;0C65EH
	JNZ	LCA73	;0CA73H
	POP	PSW
	MOV	B,A
	LXI	H,LCBF0	;0CBF0H
	MOV	A,M
	ORA	A
	JZ	LCA59	;0CA59H
	CMP	B
	MOV	M,B
	JNZ	LCA73	;0CA73H
LCA59:		;CA59 
	MOV	M,B
	XRA	A
	STA	LCBCD	;0CBCDH
	CALL	LC4E9	;0C4E9H
	JZ	LCA6D	;0CA6DH
	LXI	D,LCBCD	;0CBCDH
	CALL	LC50E	;0C50EH
	JMP	LCB86	;0CB86H
LCA6D:		;CA6D 
	CALL	LC7EA	;0C7EAH
	JMP	LCB86	;0CB86H
LCA73:		;CA73 
	CALL	LC866	;0C866H
	JMP	LC609	;0C609H
LCA79:		;CA79 
	LXI	B,LCA82	;0CA82H
	CALL	LC4A7	;0C4A7H
	JMP	LCB86	;0CB86H
LCA82:		;CA82 
	DB	'FILE EXISTS',0
LCA8E:		;CA8E 
	CALL	LC7F8	;0C7F8H
	CPI	10H
	JNC	LC609	;0C609H
	MOV	E,A
	LDA	LCBCE	;0CBCEH
	CPI	' '	;20H
	JZ	LC609	;0C609H
	CALL	LC515	;0C515H
	JMP	LCB89	;0CB89H
LCAA5:		;CAA5 
	CALL	LC5F5	;0C5F5H
	LDA	LCBCE	;0CBCEH
	CPI	' '	;20H
	JNZ	LCAC4	;0CAC4H
	LDA	LCBF0	;0CBF0H
	ORA	A
	JZ	LCB89	;0CB89H
	DCR	A
	STA	LCBEF	;0CBEFH
	CALL	LC529	;0C529H
	CALL	LC4BD	;0C4BDH
	JMP	LCB89	;0CB89H
LCAC4:		;CAC4 
	LXI	D,LCBD6	;0CBD6H
	LDAX	D
	CPI	' '	;20H
	JNZ	LC609	;0C609H
	PUSH	D
	CALL	LC854	;0C854H
	POP	D
	LXI	H,LCB83	;0CB83H
	CALL	LC840	;0C840H
	CALL	LC4D0	;0C4D0H
	JZ	B_BASE##+33H
	LXI	H,L0100	;0100H
LCAE1:		;CAE1 
	PUSH	H
	XCHG
	CALL	LC5D8	;0C5D8H
	LXI	D,LCBCD	;0CBCDH
	CALL	LC4F9	;0C4F9H
	JNZ	LCB01	;0CB01H
	POP	H
	LXI	D,L0080	;80H
	DAD	D
	LXI	D,LC400	;0C400H
	MOV	A,L
	SUB	E
	MOV	A,H
	SBB	D
	JNC	LCB71	;0CB71H
	JMP	LCAE1	;0CAE1H
LCB01:		;CB01 
	POP	H
	DCR	A
	JNZ	LCB71	;0CB71H
	CALL	LC866	;0C866H
	CALL	LC65E	;0C65EH
	LXI	H,LCBF0	;0CBF0H
	PUSH	H
	MOV	A,M
	STA	LCBCD	;0CBCDH
	MVI	A,10H
	CALL	LC660	;0C660H
	POP	H
	MOV	A,M
	STA	LCBDD	;0CBDDH
	XRA	A
	STA	LCBED	;0CBEDH
	LXI	D,L005C	;5CH
	LXI	H,LCBCD	;0CBCDH
	MVI	B,'!'	;21H
	CALL	LC842	;0C842H
	LXI	H,LC408	;0C408H
LCB30:		;CB30 
	MOV	A,M
	ORA	A
	JZ	LCB3E	;0CB3EH
	CPI	' '	;20H
	JZ	LCB3E	;0CB3EH
	INX	H
	JMP	LCB30	;0CB30H
LCB3E:		;CB3E 
	MVI	B,0
	LXI	D,L0081	;81H
LCB43:		;CB43 
	MOV	A,M
	STAX	D
	ORA	A
	JZ	LCB4F	;0CB4FH
	INR	B
	INX	H
	INX	D
	JMP	LCB43	;0CB43H
LCB4F:		;CB4F 
	MOV	A,B
	STA	L0080	;80H
	CALL	LC498	;0C498H
	CALL	LC5D5	;0C5D5H
	CALL	LC51A	;0C51AH
	CALL	L0100	;0100H
	LXI	SP,LCBAB	;0CBABH
	CALL	LC529	;0C529H
	CALL	LC4BD	;0C4BDH
	JMP	LC782	;0C782H
	CALL	LC866	;0C866H
	JMP	LC609	;0C609H
LCB71:		;CB71 
	LXI	B,LCB7A	;0CB7AH
	CALL	LC4A7	;0C4A7H
	JMP	LCB86	;0CB86H
LCB7A:		;CB7A 
	DB	'BAD LOAD',0
LCB83:		;CB83 
	DB	'COM'
LCB86:		;CB86 
	CALL	LC866	;0C866H
LCB89:		;CB89 
	CALL	LC65E	;0C65EH
	LDA	LCBCE	;0CBCEH
	SUI	' '	;20H
	LXI	H,LCBF0	;0CBF0H
	ORA	M
	JNZ	LC609	;0C609H
	JMP	LC782	;0C782H
	DS	0010H
LCBAB:		;CBAB 
	DB	0
LCBAC:		;CBAC 
	DB	0,'$$$     SUB',0,0
LCBBA:		;CBBA 
	DB	0
LCBBB:		;CBBB 
	DB	0,0,0,0,0,0,0,0,0,0,0,0,0
	DB	0,0,0,0
LCBCC:		;CBCC 
	DB	0
LCBCD:		;CBCD 
	DB	0
LCBCE:		;CBCE 
	DB	'        '
LCBD6:		;CBD6 
	DB	'   ',0,0,0,'.'
LCBDD:		;CBDD 
	DB	0,'           ',0,0,0,0
LCBED:		;CBED 
	DB	0
LCBEE:		;CBEE 
	INX	B
LCBEF:		;CBEF 
	DB	0
LCBF0:		;CBF0 
	DB	0
LCBF1:		;CBF1 
	DB	0,0,0,0,0,0,0,0,0,0,0,0,0
	DB	0,0
LCC00:		;CC00 
	DB	0F6H,16H,0,0,0,6BH

C_SIZE	equ	$-C_BASE
	END
