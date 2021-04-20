    org 	100h

	section	.text

;Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h (25%):

	;En 200h el carácter R
	mov	byte [200h], "R"
	;En 201h el carácter A
	mov	byte [201h], "A"
	;En 202h el carácter G
	mov	byte [202h], "G"
	;En 203h el carácter Q 
	mov	byte [203h], "Q"

;Luego, mover a los siguientes registros los códigos ASCII de los caracteres guardados en 200h (75%):

;Copiar el valor de 200h a AX usando direccionamiento directo.
mov [200h], AX
;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
mov BX, 201h
mov CX, [BX]
;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
mov SI, 1h
mov DX, [BX + SI]
;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
mov DI, [BX + 2h]
	int	20h
