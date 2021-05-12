    org 	100h

	section	.text

	xor AX, AX ;limpia AX
	xor CX, CX ;limpia CX
	mov CL, 5d ;inicia contador
	mov AL, 1d ;almacena dato en AL para poder guardar aqui los datos de la multipliacion

	call factorial

	mov CH, 1d
	mul CH

	mov [20Bh], AL ;mandamos los datos y se almacenan en esta memoria
	jmp exit

factorial:
	mul CL ;se multiplica datos
	sub CL, 1d ; se le resta al contador 
	cmp CL, 0d
	JNZ factorial; itaracion de datos para obtener el factorial
	ret ;termina de ejectutar el Jump Not Zero

exit:
	int	20h ; fin programa
