 ; Ejercicio: Hacer un programa utilizando una o más subrutinas donde, con la ayuda de un arreglo de elementos numéricos con tamaño de 1 byte, se separe los números pares e impares. 
    org 	100h

	section	.text

	XOR SI, DI;
	XOR DI, DI;
	XOR BX, BX;
	XOR CX, CX;
	XOR DX, DX;

	MOV BP, arrByte
	CALL OddEven 

	int 20h

	section .data

	arrByte db 01,02,03,04,05,06,07,08,09,10; declaramos los siguientes numeros a procesar
	divs equ 02

OddEven:
	MOV BL, divs

process:
	CMP SI, 10
	JE end

	XOR AX, AX;
	MOV AL, [BP + SI]
	MOV BH, AL
	DIV BL
	INC SI

	CMP AH, 0
	JE odd
	JNE even

odd: 
	MOV DI, CX
	MOV [300h + DI], BH
	INC DI
	MOV CX, DI
	jmp process

even:
	MOV DI, CX
	MOV [320h + DI], BH
	INC DI
	MOV DX, DI
	jmp process

end: 
	ret; termina el programa
