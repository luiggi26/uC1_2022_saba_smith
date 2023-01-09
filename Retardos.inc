PSECT udata_acs
contador1: DS 1      ; reserva 1 byte en acces ram
contador2: DS 1

PSECT code
;T = (6 + 4k)us            1Tcy = 1us

Delay_10us:                  ;2Tcy -- Call 
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
Delay_Loop:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    RETURN                 ; 2 Tcy    
Delay_50us:                  ;2Tcy -- Call  
    MOVLW 11                ;1Tcy
    MOVWF contador1,0      ;1Tcy
Delay_Loop:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
;T = (8 + 4k)us            1Tcy = 1us}
Delay_100us:                  ;2Tcy -- Call  
    MOVLW 23                ;1Tcy
    MOVWF contador1,0      ;1Tcy

Delay_Loop:
    NOP                    ;k*Tcy
    GOTO                   ;2Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
Delay_200us:                  ;2Tcy -- Call  
    MOVLW 48                ;1Tcy
    MOVWF contador1,0      ;1Tcy

Delay_Loop:
    NOP                    ;k*Tcy
    GOTO                   ;2Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
;T = (6 + 4k)us            1Tcy = 1us

Delay_250us:                  ;2Tcy -- Call 
    MOVLW 61                ;1Tcy
    MOVWF contador1,0      ;1Tcy
Delay_Loop:
    NOP                    ;k*Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy
    
;T = (8 + 4k)us            1Tcy = 1us}
Delay_500us:                  ;2Tcy -- Call  
    MOVLW 123                ;1Tcy
    MOVWF contador1,0      ;1Tcy

Delay_Loop:
    NOP                    ;k*Tcy
    GOTO                   ;2Tcy
    DECFSZ  contador1,1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy