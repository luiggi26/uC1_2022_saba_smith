PSECT udata_acs
contador1: DS 1      ; reserva 1 byte en acces ram
contador2: DS 1

PSECT code
;T = (6 + 4k)us            1Tcy = 1us

Delay_10us:                ;2Tcy -- Call 
    MOVLW 1                ;1Tcy
    MOVWF contador1,0      ;1Tcy
Delay_Loop:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
Delay_25us:                  ;2Tcy -- Call 
    MOVLW 5                ;1Tcy
    MOVWF contador1,0      ;1Tcy
Delay_Loop1:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    RETURN                 ; 2 Tcy    
Delay_50us:                  ;2Tcy -- Call  
    MOVLW 11                ;1Tcy
    MOVWF contador1,0      ;1Tcy
Delay_Loop2:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
;T = (8 + 4k)us            1Tcy = 1us}
Delay_100us:                  ;2Tcy -- Call  
    MOVLW 23                ;1Tcy
    MOVWF contador1,0      ;1Tcy

Delay_Loop3:
    NOP                    ;k*Tcy
    ;GOTO                   ;2Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
Delay_200us:                  ;2Tcy -- Call  
    MOVLW 48                ;1Tcy
    MOVWF contador1,0      ;1Tcy

Delay_Loop4:
    NOP                    ;k*Tcy
    ;GOTO                   ;2Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
;T = (6 + 4k)us            1Tcy = 1us

Delay_250us:                  ;2Tcy -- Call 
    MOVLW 61                ;1Tcy
    MOVWF contador1,0      ;1Tcy
Delay_Loop5:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
;T = (8 + 4k)us            1Tcy = 1us}
Delay_500us:               ;2Tcy -- Call  
    MOVLW 123              ;1Tcy
    MOVWF contador1,0      ;1Tcy

Delay_Loop6:
    NOP                    ;k*Tcy
    ;GOTO                   ;2Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy





;

Delay_1ms:				;2Tcy -- Call 
	MOVLW	1			;1Tcy (Valor de "M")
Delay_5ms:				;2Tcy -- Call 
	MOVLW	5			;1Tcy
	GOTO	Delay_ms		; 2Tcy
Delay_10ms:				;2Tcy -- Call 
	MOVLW	10			;1Tcy (Valor de "M")
	goto	Delay_ms		; 2Tcy
Delay_25ms:				;2Tcy -- Call 
	MOVLW	25			;1Tcy (Valor de "M")
	goto	Delay_ms		; 2Tcy
Delay_50ms:				;2Tcy -- Call 
	MOVLW	50			;1Tcy (Valor de "M")
	GOTO	Delay_ms		; 2Tcy
Delay_100ms:				;2Tcy -- Call 
	MOVLW	100			;1Tcy (Valor de "M")
	GOTO	Delay_ms		; 2Tcy
Delay_200ms:			        ;2Tcy -- Call 
	MOVLW	200			;1Tcy (Valor de "M")
	GOTO	Delay_ms		;2Tcy

Delay_250ms:				;2Tcy -- Call 
	MOVLW	250			;1Tcy (Valor de "M")
	MOVWF	contador2,0		;2Tcy
Delay_ms:
	MOVWF	contador2,0	        ;1Tcy.
Ext_Loop:
	MOVLW	249			; M x 1Tcy. Este es el valor de "K".
	MOVWF	contador1,0	        ; M x 1Tcy
Int_Loop:
	NOP				; K x M x 1Tcy
	DECFSZ	contador1,1,0	        ; (K-1)x M x 1Tcy (cuando no salta) + M x 2Tcy (al saltar).
	GOTO	Int_Loop		; (K-1)x M x 2Tcy
	NOP                             ; 1Tcy
	DECFSZ	contador2,1,0	        ; (M-1)x 1Tcy(cuando no salta) + 2 Tcy (al saltar).
	GOTO	Ext_Loop		; (M-1)x 2Tcy
	RETURN                          ;2Tcy


