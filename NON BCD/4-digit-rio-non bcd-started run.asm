
; By : Rio Bastian	|	09011282025039		| SK6A Reguler
		ORG 000H
		ljmp MULAI

NOL:		;7-Segment untuk angka 0
		CJNE	A,#00H,SATU
		MOV	R3,#3FH
        RET
		
SATU:		;7-Segment untuk angka 1
		CJNE	A,#01H,DUA
		MOV	R3,#06H
        RET

DUA:		;7-Segment untuk angka 2
		CJNE	A,#02H,TIGA
		MOV	R3,#5BH
        RET

TIGA:		;7-Segment untuk angka 3
		CJNE	A,#03H,EMPAT
		MOV	R3,#4FH
        RET
		
EMPAT:		;7-Segment untuk angka 4
		CJNE	A,#04H,LIMA
		MOV	R3,#66H
        RET

LIMA:		;7-Segment untuk angka 5
		CJNE	A,#05H,ENAM
		MOV	R3,#6DH
        RET

ENAM:		;7-Segment untuk angka 6
		CJNE	A,#06H,TUJUH
		MOV	R3,#7DH
        RET

TUJUH:		;7-Segment untuk angka 7
		CJNE	A,#07H,DELAPAN
		MOV	R3,#07H
        RET

DELAPAN:	;7-Segment untuk angka 8
		CJNE	A,#08H,SEMBILAN
		MOV	R3,#7FH
        RET

SEMBILAN:	;7-Segment untuk angka 9
        CJNE	A,#09H,NOTHING
        MOV	R3,#6FH
        RET

NOTHING:	; Jika tidak ada angka yang cocok
        RET

DISPLAY:	; Menampilkan nilai pada 7-Segment
        MOV     A,R7
        LCALL	NOL
        MOV	    P3,R3

        MOV     A,R6
        LCALL	NOL
        MOV	    P2,R3

        MOV     A,R5
        LCALL	NOL
        MOV	    P1,R3

        MOV     A,R4
        LCALL	NOL
        MOV	    P0,R3

		MOV		A,B
        LJMP	COUNTER

MULAI:		; Inisiasi Nilai Register
		MOV	P0,#3FH			; Digunakan untuk menampilikan digit 1
		MOV	P1,#3FH			; Digunakan untuk menampilikan digit 2
		MOV	P2,#3FH			; Digunakan untuk menampilikan digit 3
		MOV	P3,#3FH			; Digunakan untuk menampilikan digit 4
        MOV R3,#00H         ; Digunakan untuk menampung nilai display
		MOV	R4,#00H			; Counter Digit 1
		MOV	R5,#00H			; Counter Digit 2
		MOV	R6,#00H			; Counter Digit 3
		MOV	R7,#00H			; Counter Digit 4
		MOV	 A,#00H
		LJMP COUNTER

COUNTKEY:	; Tombol Trigger Untuk Menambah Waktu Menit
		JB		P2.7,COUNTKEY	

TIMEOUT_TOMBOL:	; Waktu Tunggu Tombol Untuk Menambah Waktu Menit atau Menampilkannya
		JB		P2.7,add_minutes
		djnz 	R2,TIMEOUT_TOMBOL
		djnz 	R1,TIMEOUT_TOMBOL
		djnz 	R0,TIMEOUT_TOMBOL
		LJMP	DISPLAY

add_minutes:	; Fungsi untuk Menambah Waktu Menit
		INC 	R5
		CJNE 	R5,#0AH,COUNTKEY
		MOV		R5,#00H

		INC 	R4
		CJNE 	R4,#06H,COUNTKEY
		MOV		R4,#00H
		LJMP    COUNTKEY

COUNTER:      ; Main Program untuk Hitung Waktu
		LCALL	TUNDA
		jb		P3.7,MULAI
		jb 		P2.7, RESET_VALUE
		
		; COUNTER DIGIT 4
		INC 	R7			        
		CJNE 	R7,#0AH,DISPLAY
		MOV		R7,#00H

		; COUNTER DIGIT 3
		INC 	R6
		CJNE 	R6,#06H,DISPLAY
		MOV		R6,#00H

		; COUNTER DIGIT 2
		INC 	R5
		CJNE 	R5,#0AH,DISPLAY
		MOV		R5,#00H

		; COUNTER DIGIT 1
		INC 	R4
		CJNE 	R4,#06H,DISPLAY
		MOV		R4,#00H
		LJMP    DISPLAY

RESET_VALUE:	; Reset Nilai Menit Jika Tombol Setting Ditekan
		MOV		R5,#00H
		MOV		R4,#00H

		MOV     A,R5
        LCALL	NOL
        MOV	    P1,R3

        MOV     A,R4
        LCALL	NOL
        MOV	    P0,R3
		
		LJMP	TIMEOUT_TOMBOL

TUNDA:	MOV		R0,#15H
TUND:	DJNZ	R1,TUND
		DJNZ	R2,TUND
		DJNZ	R0,TUND
		RET

END