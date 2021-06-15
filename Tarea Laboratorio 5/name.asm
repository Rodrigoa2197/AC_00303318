 ; Ejercicio: Imprimir en pantalla su nombre completo. Cada nombre y apellido debe ir separado en filas 
org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d
    
    call modotexto
    call movercursorname
	call escribirname
	call movercursorapellido
	call escribirapellido
	call movercursorsegundoapellido
	call escribirsegundoapellido
    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET

;NOMBRE
    movercursorname:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET

    escribirname: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, name ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

;APELLIDO
	movercursorapellido:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 12 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET

    escribirapellido: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, apellido ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

;MI SEGUNDO APELLIDO
	movercursorsegundoapellido:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 14 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET

    escribirsegundoapellido: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, segundoapellido ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

    esperartecla:
        MOV AH, 00h ; espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

        ret
    exit:
        int 20h

section .data

name DB "Rodrigo $"
apellido DB "Arevalo $"
segundoapellido DB "Najarro $"