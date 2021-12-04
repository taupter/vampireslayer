;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

;array de ayudas
;posición dentro del bank1 (o 0 que son iguales) de los tiles de la ayuda (cómo en los sprites de 2x2)
array_ayudas:
array_oracionon:			DB	200,202
array_oracionon1:			DB	201,203
array_oracionoff:			DB	204,206
array_oracionoff1:			DB	205,207
array_cruzon:				DB	208,210
array_cruzon1:				DB	209,211
array_cruzoff:				DB	212,214
array_cruzoff1:				DB	213,215
array_aguaon:				DB	216,218
array_aguaon1:				DB	217,219
array_aguaoff:				DB	220,222
array_aguaoff1:				DB	221,223
array_armaduraon:			DB	224,226
array_armaduraon1:			DB	225,227
array_armaduraoff:			DB	228,230
array_armaduraoff1:			DB	229,231
array_plantaon:				DB	232,234
array_plantaon1:			DB	233,235
array_plantaoff:			DB	236,238
array_plantaoff1:			DB	237,239
array_extraon:				DB	240,242
array_extraon1:				DB	241,243
array_extraoff:				DB	244,246
array_extraoff1:			DB	245,247
array_ballestaon:			DB	248,250
array_ballestaon1:			DB	249,251
array_ballestaoff:			DB	252,254
array_ballestaoff1:			DB	253,255


lista_ayudas:
ayuda_oracion:		DS		ESTRUCTURA_AYUDA		
ayuda_cruz:			DS		ESTRUCTURA_AYUDA
ayuda_aguabendita:	DS		ESTRUCTURA_AYUDA
ayuda_armadura:		DS		ESTRUCTURA_AYUDA
ayuda_planta:		DS		ESTRUCTURA_AYUDA
ayuda_vidaextra		DS		ESTRUCTURA_AYUDA
ayuda_ballesta:		DS		ESTRUCTURA_AYUDA

;datos ayudas
datos_oracion:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_oracionon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_oracionoff;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSORACION		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSORACIONX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_oracion	;subrutina que indica la acción si se dispara en el objeto						8,9
datos_cruz:
				;~ DB    	0				;0 no activo <>0 activo															0
				;~ DW		array_cruzon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				;~ DW		array_cruzoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				;~ DB		POSCRUZ			;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				;~ DB		POSCRUZX		;pos del pixel central (esquina superior + 8x)									6
				;~ DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				;~ DW		accion_cruz		;subrutina que indica la acción si se dispara en el objeto						8,9 
				
				DB    	0				;0 no activo <>0 activo															0
				DW		array_cruzon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_cruzoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		167			;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		64		;pos del pixel central (esquina superior + 8x)									6
				DB		112		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_cruz		;subrutina que indica la acción si se dispara en el objeto						8,9 
				
datos_aguabendita:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_aguaon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_aguaoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSAGUA			;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSAGUAX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_agua		;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16    
datos_armadura:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_armaduraon;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_armaduraoff;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSARMAD		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSARMADX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_armadura	;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16    
datos_planta:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_plantaon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_plantaoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSPLANTA		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSPLANTAX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_planta	;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16     
datos_vidaextra:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_extraon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_extraoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSVIDAEXT		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSVIDAEXTX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_vidaextra;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16     
datos_ballesta:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_ballestaon;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_ballestaoff;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSBALLESTA		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSBALLESTAX	;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_oracion	;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16      







;;=====================================================
;;INICIALIZA_AYUDAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_ayudas
; entrada: 	datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		HL, DE, BC
inicializa_ayudas:
	;oración
	LD		IX, ayuda_oracion
	LD		(IX + 0), INACTIVA			
	LD		HL, array_oracionon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_oracionoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSORACION
	LD		(IX + 6), POSORACIONX
	LD		(IX + 7), POSAYUDASY	
	LD		HL, accion_oracion
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;cruz
	LD		HL, datos_cruz
	LD		DE, ayuda_cruz
	LD		BC, 16;#ESTRUCTURA_AYUDA ;equivale a 16.. el tamaño de la estructura en bytes
	LDIR
	
	;agua bendita
	LD		HL, datos_aguabendita
	LD		DE, ayuda_aguabendita
	CALL	carga_datos_ayuda
		
	;armadura
	LD		HL, datos_armadura
	LD		DE, ayuda_armadura
	CALL	carga_datos_ayuda
		
	;planta
	LD		HL, datos_planta
	LD		DE, ayuda_planta
	CALL	carga_datos_ayuda
		
	;vida extra
	LD		HL, datos_vidaextra
	LD		DE, ayuda_vidaextra
	CALL	carga_datos_ayuda
		
	;ballesta
	LD		HL, datos_ballesta
	LD		DE, ayuda_ballesta
	CALL	carga_datos_ayuda
fin_resetea_ayudas:
	RET
	

;;=====================================================
;;CARGA_DATOS_AYUDA
;;=====================================================	
; función: 	carga los datos de la ayuda de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
;entrada
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_ayuda:
	LD		BC, 16;ESTRUCTURA_AYUDA ;equivale a 16.. el tamaño de la estructura en bytes
	LDIR
fin_carga_datos_ayuda:
	RET



;;=====================================================
;;PINTA_OBJ_AYUDA
;;=====================================================	
; función: 	pinta un objeto de tipo ayuda que se le pase por referencia IX y el tipo en A
; entrada: 	IX - puntero a objeto a mostrar, A - si está on u off
; salida: 	-
; toca:		AF, HL, BC, DE
pinta_obj_ayuda:
	;se recibe objeto desde fuera, por ejmplo LD IX, ayuda_oracion

	OR		 A
	JP		 Z,.dibujooff
.dibujoon:	
	LD		 H, (IX + 1)
	LD		 L, (IX + 2)
	LD		(wordaux2), HL
	JP		.param_wordaux2
.dibujooff:
	LD		 H, (IX + 3)
	LD		 L, (IX + 4)
	LD		(wordaux2), HL

.param_wordaux2:	
	LD		HL, TILMAP + 256	;calcula posición en tilemap + 256 por colocarse siempre en bank1
	LD		 A, (IX + 5)
	CALL	suma_A_HL
	LD		(wordaux1), HL		;pongo el valor en wordaux1

.filasycols:
	LD		 A, 2				;equivale a LD	A,2 porque A ya valía 1
	LD		(byteaux1), A	;nº de filas
	LD		(byteaux2), A	;nº de columnas
	
	JP		pinta_array
fin_pinta_obj_ayuda:


;;=====================================================
;;PINTA_AYUDAS_HABITACIÓN
;;=====================================================	
; función: 	examina el byte con las ayudas y pinta las que estén seleccionadas según variable habitacion_extras
; entrada: 	habitacion_extras
; salida: 	-
pinta_ayudas_habitacion:
.examina_oracion:
	LD		 A, (habitacion_extras)
	BIT		 7,A
	JP		 Z,.examina_cruz
	LD		IX, ayuda_oracion
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_cruz:
	LD		 A, (habitacion_extras)
	BIT		 6,A
	JP		 Z,.examina_aguabendita
	LD		IX, ayuda_cruz
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_aguabendita:
	LD		 A, (habitacion_extras)
	BIT		 5,A
	JP		 Z,.examina_armadura
	LD		IX, ayuda_aguabendita
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_armadura:
	LD		 A, (habitacion_extras)
	BIT		 4,A
	JP		 Z,.examina_planta
	LD		IX, ayuda_armadura
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_planta:
	LD		 A, (habitacion_extras)
	BIT		 3,A
	JP		 Z,.examina_vidaextra
	LD		IX, ayuda_planta
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_vidaextra:
	LD		 A, (habitacion_extras)
	BIT		 2,A
	JP		 Z,.examina_ballesta
	LD		IX, ayuda_vidaextra
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_ballesta:
	LD		 A, (habitacion_extras)
	BIT		 1,A
	RET		 Z
	LD		IX, ayuda_ballesta
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
fin_pinta_ayudas_habitacion:
	RET



;;=====================================================
;;ACCION_ORACION
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_oracion:
fin_accion_oracion:
	RET
	

;;=====================================================
;;ACCION_CRUZ
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_cruz:
fin_accion_cruz:
	RET


;;=====================================================
;;ACCION_AGUA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_agua:
fin_accion_agua:
	RET


;;=====================================================
;;ACCION_ARMADURA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_armadura:
fin_accion_armadura:
	RET


;;=====================================================
;;ACCION_PLANTA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_planta:
fin_accion_planta:
	RET


;;=====================================================
;;ACCION_VIDAEXTRA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_vidaextra:
fin_accion_vidaextra:
	RET


;;=====================================================
;;ACCION_BALLESTA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_ballesta:
fin_accion_ballesta:
	RET

