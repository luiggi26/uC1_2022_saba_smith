;------------------------------------------------------	
;file     Practica_01
;brief    Corrimientos de 8 leds conectados al puerto C, con un retardo de 500ms y 250ms para los corrimientos pares e impares respectivamente.
;autor    Saba Martinez Luiggi Smith
;Date:    14/01/2023

PROCESSOR 18F57Q84   
#include "Bit_Config.inc"           /* config statemens should precede project file includes.*/
#include "Retardos.inc"
#include <xc.inc> 
  
   
    
    
PSECT resetVect,class=CODE,reloc=2
resetVect:
    GOTO Main
    
PSECT CODE
Main:
    CALL Config_OSC,1
    CALL Config_Port,1
    CALL Config_Button,1
    
Config_OSC:
    ;Configuracion del Oscilador Interno a una frecuencia de 4MHz
    BANKSEL OSCCON1     
    MOVLW   0x60        ; se utiliza un oscilador interno y un divisor 1
    MOVWF   OSCCON1,1	; Fuente:HFINTOSC & DIV=1
    MOVLW   0x02        ; Frecuencia de 4MHz
    MOVWF   OSCFRQ,1	; Clock = 4MHz
    RETURN
    
    Config_Port:       ;PART-LAT-ANSEL-TRIS LED:PORC, BUTTON:RA3
    BANKSEL ANSELC
    SETF  ANSELC,1     ;ANSED<7:0> = 0 - PortC digital
    CLRF  TRISC,0      ;Puerto C como salida
    
    
  
    Config_Button:
    BANKSEL PORTA
    CLRF    PORTA,1    ;PORTA<7:0> = 0
    CLRF    ANSELA,1   ;PortA digital
    BSF     TRISA,3,1  ;RA3 como entrada
    BSF     WPUA,3,1   ;Activamos la resistencia
    RETURN
    
;Corrimientos par e impar

Analisis:
    BANKSEL PORTE
    BTFSS   PORTE,0,1
    GOTO    BUTTONS
 
Loop:

    ;Corimientos par e impar DEL 0 AL 7

  
    ;BIT 0
    
    MOVLW   00000001B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    
    ;BIT1
    
    MOVLW   00000000B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    
    
    ;BIT2
    MOVLW   00000011B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    ;BIT3
    MOVLW   00000010B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    ;BIT4
    MOVLW   00000101B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    ;BIT5
    MOVLW   00000100B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    ;BIT6
    MOVLW   00000111B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    ;BIT7
    MOVLW   00000110B        ;le damos ese valor a w    
    MOVWF   LATC,1           ;Movemos W al puerto C
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms 
    CALL    Delay_250ms     ; Llamamos al retardo de 250 ms
    ;BTFSS   PORTA,3,0
    GOTO    BUTTONS
    
    
BUTTONS:
    NOP
    BTFSS PORTA,3,0
    GOTO  Loop
    




END resetVect


