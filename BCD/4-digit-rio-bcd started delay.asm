
; By : Rio Bastian	|	09011282025039		| SK6A Reguler
		ORG 000H

MULAI:		; Inisiasi Nilai Register
		MOV	P0,#00H			; Digunakan untuk menampilikan digit 1
		MOV	P1,#00H			; Digunakan untuk menampilikan digit 2
		MOV	P2,#00H			; Digunakan untuk menampilikan digit 3
		MOV	P3,#00H			; Digunakan untuk menampilikan digit 4
		MOV	R4,#00H			; Counter Digit 1
		MOV	R5,#00H			; Counter Digit 2
		MOV	R6,#00H			; Counter Digit 3
		MOV	R7,#00H			; Counter Digit 4

BTNSTART:		; Tombol Trigger Untuk Mulai
		JNB		P2.7,BTNSTART
		LJMP	add_minutes

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

RESET_VALUE:	; Reset Nilai Menit Jika Tombol Setting Ditekan
		MOV		R5,#00H
		MOV		R4,#00H
		MOV		P1,R5
		MOV		P0,R4
		LJMP	TIMEOUT_TOMBOL

DISPLAY:		; Menampilkan Nilai BCD ke 7-Segment
		MOV		P3,R7
		MOV		P2,R6
		MOV		P1,R5
		MOV		P0,R4

RESET_BTN:      ; Main Program untuk Hitung Waktu
		LCALL	TUNDA
		JB		P3.7,MULAI
		JB		P2.7,RESET_VALUE
		
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
		ljmp	DISPLAY
		
TUNDA:		MOV	R0,#15H			
TUND:		DJNZ	R1,TUND
			DJNZ	R2,TUND
			DJNZ	R0,TUND
			RET
END