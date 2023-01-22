PROCESSOR 18F57Q84   
#include "Bit_Config.inc"           /* config statemens should precede project file includes.*/
#include <xc.inc>

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
PSECT udata_acs
contador1: DS 1
 

PSECT CODE
Main:
    CALL Config_OSC,1
    CALL Config_Port,1
    CALL Delay_ms,1
    NOP
;Loop:
;    BTFSC   PORTA,3,0   ;PORTA<3> = 0? - Button press?
;   goto    Led_Off
;Led_On:
;    BCF     LATF,3,1    ;Led on
;    goto    Loop
;Led_Off:
;    BSF     LATF,3,1    ;Led off
;    goto    Loop
    
Config_OSC:
    ;Configuracion del Oscilador Interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW 0x60    ;Seleccionamos el bloque del osc interno (HFINTOSC) con un DIV=1
    MOVWF OSCCON1,1
    MOVLW 0x02    ;Seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ,1  
    RETURN
    
Config_Port:           ;PART-LAT-ANSEL-TRIS LED:RF3, BUTTON:RA3
    ;Config Led
    BANKSEL PORTF
    CLRF PORTF,1       ;PORTF = 0
    BSF  LATF,3,1      ;LATF<3> = 1 - Led off
    CLRF ANSELF,1      ;ANSEL<7:0> = 0 - PortF digital
    BCF  TRISF,3,1     ;TRISF<3> = 0 - RF3 como salida
    
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1    ;PORTA<7:0> = 0
    CLRF    ANSELA,1   ;PortA digital
    BSF     TRISA,3,1  ;RA3 como entrada
    BSF     WPUA,3,1   ;Activamos la resistencia
    RETURN
    
;T = (6 + 4k)us            1Tcy = 1us

Delay_ms:                  ;2Tcy -- Call 
    MOVLW 1                ;1Tcy
    MOVWF   BANKMASK(contador1),0    ;1Tcy
Delay_Loop:
    NOP                    ;k*Tcy
    DECFSZ  BANKMASK(contador1),1,0  ;(k-1)+3Tcy
    GOTO    Delay_Loop     ; (k.1)*2Tcy consume cuando el valor es mayor a 1
    RETURN                 ; 2 Tcy

    
END resetVect



