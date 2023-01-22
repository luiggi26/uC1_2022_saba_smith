;------------------------------------------------------	
;file     Practica_02
;brief    Display 7 segmentos de ánodo común conectados al puerto C mostrando los valores Alfanumericos (0-9 y A-F) con retardo de 1s.
;autor    Saba Martinez Luiggi Smith
;Date:    14/01/2023
    
PROCESSOR 18F57Q84   
#include "Bit_Config.inc"           /* config statemens should precede project file includes.*/
#include "Retardos.inc"
#include <xc.inc> 
    ;CONTADOR DEL  0 AL 9, a-f
  
   
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE   
Main:
    CALL Config_Osc,1
    CALL Config_Port,1
    CALL Config_Button,1
    
Loop:

    ;Estableceremos los digitos a w para cada lectura de numeros y letras establecidos, usando
    ;digito 0
    MOVLW   01000000B       ; 0gfedcba
    MOVWF   LATD,0          ;me lo manda al puerto D
    CALL   Delay_250ms      ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0      
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
    
    
    ;digito 1
    MOVLW   01111001B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
    
  ;     ;digito 2
    MOVLW   00100100B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms   

    
 ;     ;digito 3
    MOVLW   00110000B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
    
    
     ;digito 4
    MOVLW   00011001B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
     ;digito 5
    MOVLW   00010010B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
    
 ;     ;digito 6
    MOVLW   00000010B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
    
 ;     ;digito 7
    MOVLW   01111000B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
   
     ;digito 8
    MOVLW   00000000B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
 ;     ;digito 9
    MOVLW   00010000B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    BTFSS   PORTA,3,0
    GOTO    Display_On_AF
    CALL    Delay_250ms 
    CALL    Delay_250ms  
    
    BTFSC   PORTA,3,0   ;PORTA<3> = 0? - Button press?
    GOTO   Loop

      
Display_On_AF:
    
    ;digito a
    MOVLW   00001000B       ; 0gfedcba
    MOVWF   LATD,0          ;me lo manda al puerto D 
    CALL   Delay_250ms      ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    CALL   Delay_250ms 
    CALL   Delay_250ms
   
    
    
    ;digito b
    MOVLW   10000011B
    MOVWF   LATD,0         ;Movemos W al puerto D
    CALL   Delay_250ms     ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    CALL   Delay_250ms 
    CALL   Delay_250ms
    
    
   ;digito c 
    MOVLW   11000110B
    MOVWF   LATD,0           ;Movemos W al puerto D
    CALL   Delay_250ms       ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    CALL   Delay_250ms
    CALL   Delay_250ms
    

    
 ;     ;digito d
    MOVLW   10100001B
    MOVWF   LATD,0           ;Movemos W al puerto D
    CALL   Delay_250ms       ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms 
    CALL   Delay_250ms
    CALL   Delay_250ms
    
    
     ;digito e
    MOVLW   10000110B
    MOVWF   LATD,0          ;Movemos W al puerto D
    CALL   Delay_250ms      ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms
    CALL   Delay_250ms
    CALL   Delay_250ms

     ;digito f
    MOVLW   10001110B
    MOVWF   LATD,0           ;Movemos W al puerto D
    CALL   Delay_250ms       ;Retardo de 250 ms, (llamamos 4 veces para completar restardo de 1s)
    CALL   Delay_250ms
    CALL   Delay_250ms
    CALL   Delay_250ms
    GOTO   Loop
 
    

	


Config_Osc:
    ;config oscillator for 4MHz
    BANKSEL OSCCON1
    MOVLW   0x60h       ;Seleccionamos el bloque del osc interno (HFINTOSC) con un DIV=1
    MOVWF   OSCCON1,1	; Source:HFINTOSC & DIV=1
    MOVLW   0x02h       ;Seleccionamos una frecuencia de 4MHz
    MOVWF   OSCFRQ,1	; Clock = 4MHz
    RETURN
 
Config_Port:
    BANKSEL ANSELD
    SETF    ANSELD,1 ;ANSED<7:0> = 0 - PortD digital
    CLRF    TRISD,0  ;TRISD<3> = 0 - como salida
    
Config_Button:
    BANKSEL PORTA
    CLRF    PORTA,1    ;PORTA<7:0> = 0
    CLRF    ANSELA,1   ;PortA digital
    BSF     TRISA,3,1  ;RA3 como entrada
    BSF     WPUA,3,1   ;Activamos la resistencia
    RETURN
    
END resetVect


