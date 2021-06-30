; GUARDAR UNA CADENA EN UN VARIABLE Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

        mov cx, 5
	; print msg1
	;mov 	bx, msg1
        ;call    EscribirCadena
        ;mov 	BP, frase
        call 	LeerCadenaContra
        ;mov 	bx, msg2
	;call 	EscribirCadena
	call	EsperarTecla
         

; FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado

LeerCadenaContra:
        xor     SI, SI          ; SI = 0

; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
;EscribirCadena:
;	mov 	AH, 09h
;	int 	21h
;	ret


while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      verificarmodificado            ; si AL == EnterKey, saltar a exit
        mov     [300h+SI], AL   ; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while

verificarmodificado:
        xor SI, SI 
        xor DI, DI
        jmp verificarcontrasenia

verificarcontrasenia: 
        mov BL, [msgContra+SI]
        cmp BL, [300h+SI]
        jne ContraIncorrecta
        INC SI
        INC DI
        loop verificarcontrasenia 
        call ContraCorrecta
        jmp exit

ContraIncorrecta:
        mov AH, 09h
        mov DX, msgIncorrecta	
        int 21h
        int 20h 

ContraCorrecta:
        mov AH, 09h
        mov DX, msgCorrecta
        int 21h
        ret

exit:
    int 20h

section	.data

;msg1	db	"Ingresa Contraseñía: ", "$"
;msg2 	db 	"Contraseñía ingresada: ", "$"
;msg3 	db 	"Ingrese Usuario: ", "$"
;frase 	times 	20  	db	" " 
msgCorrecta db "Bienvenido$" 
msgIncorrecta db "Clave incorrecta$" 
msgContra db "escontrasenia"