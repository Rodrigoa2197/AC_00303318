 ; Ejercicio: El promedio de la suma de los 8 dígitos de su carnet, el resultado del promedio guardarlo en 20Ah (50%)
    org 	100h

	section	.text

	xor AX, AX ;limpia AX para valor de otras operaciones
	mov CX, 8d ;Inicia CX su contador hasta llegar al 0
;almacena en la memorias 400h a 407h los numeros de mi numero de carnet
	mov byte[400h], 0d
	mov byte[401h], 0d
	mov byte[402h], 3d
	mov byte[403h], 0d
	mov byte[404h], 3d
	mov byte[405h], 3d
	mov byte[406h], 1d
	mov byte[407h], 8d

	mov BX, 400h

	jmp addingtotal ;se llama a BX donde se empieza trabajar lo logico 

addingtotal:
;1. Suma de los dígitos (20%).
	add AL,[BX]
	add BX, 1h
	loop addingtotal
	mov CL, 8d

;2. Promedio (este promedio será la DIVISION ENTERA, no trabajaremos con decimales)(25%).
	div CL

;3. Guardar el resultado en el registro 20Ah (5%).
	mov byte[20Ah], AL

	int	20h ; termina el programa
