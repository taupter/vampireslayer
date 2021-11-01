;;=====================================================
;;SUBRUTINAS RELACIONADAS CON LAS PUERTAS
;;=====================================================


;;=====================================================
;;VARIABLES
;;=====================================================

;; arrays con mapa de tiles de las puertas
array_puerta_arriba:
	DB	3,1,1,3
	DB	1,1,1,1
	DB	1,1,1,1
	DB	1,1,1,1
	DB	1,1,1,1

array_puerta_derecha:
	DB	1,3,3
	DB	1,1,3
	DB	1,1,1
	DB	1,1,1
	DB	1,1,1
	DB	2,1,1
	DB	4,2,1
	
array_puerta_abajo:			
	DB	1,1,1,1

array_puerta_izquierda:
	DB	3,3,1
	DB	3,1,1
	DB	1,1,1
	DB	1,1,1
	DB	1,1,1
	DB	1,1,2
	DB	1,2,4

array_escalera:
	DB	5,5,5,5,5,5,5,5
	DB	5,0,0,0,1,1,1,5
	DB	5,0,0,0,1,1,1,5
	DB	5,0,0,6,6,6,6,5
	DB	5,0,6,6,6,6,6,5
	DB	5,6,6,6,6,6,6,5



lista_puertas:
puerta_arriba:		DS		ESTRUCTURA_PUERTA
puerta_derecha:		DS		ESTRUCTURA_PUERTA
puerta_abajo:		DS		ESTRUCTURA_PUERTA
puerta_izquierda:	DS		ESTRUCTURA_PUERTA

datos_puertas:
datos_escalera:
					DB		#00;0		; 0 no activa <>0 activo
					DB		#80;128		;punto x de la puerta para cuando se dispare encima
					DB		#30;48		;punto y de la puerta para cuando se dispare encima
					DB		#20;32		;radio x de la puerta para cuando se dispare encima
					DB		#18;24		;radio y de la puerta para cuando se dispare encima
					DW		accion_escalera	;función para acción de cada tipo de puerta
					DW		array_escalera	;puntero al array con los tiles de las puertas
					DW		TILMAP + POSESCALERA
					DB		6			;alto/filas
					DB		8			;ancho/columnas

datos_puerta_arriba:
					DB		#00;0		;0 no activa <>0 activo
					DB		#80;128		;punto x de la puerta para cuando se dispare encima
					DB		#34;52		;punto y de la puerta para cuando se dispare encima
					DB		#10;16		;radio x de la puerta para cuando se dispare encima
					DB		#14;20		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_arriba	;función para acción de cada tipo de puerta
					DW		array_puerta_arriba		;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERARRI
					DB		5			;alto/filas
					DB		4			;ancho/columnas

datos_puerta_derecha:
					DB		#00;0		;0 no activa <>0 activo
					DB		#EC;236		;punto x de la puerta para cuando se dispare encima
					DB		#54;84		;punto y de la puerta para cuando se dispare encima
					DB		#0C;12		;radio x de la puerta para cuando se dispare encima
					DB		#14;20		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_arriba	;función para acción de cada tipo de puerta
					DW		array_puerta_derecha	;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERDERE
					DB		7			;alto/filas
					DB		3			;ancho/columnas
					
datos_puerta_abajo:
					DB		#00;0		;0 no activa <>0 activo
					DB		#80;128		;punto x de la puerta para cuando se dispare encima
					DB		#7C;124		;punto y de la puerta para cuando se dispare encima
					DB		#05;5		;radio x de la puerta para cuando se dispare encima
					DB		#10;16		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_arriba	;función para acción de cada tipo de puerta
					DW		array_puerta_abajo		;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERABAJ
					DB		1			;alto/filas
					DB		4			;ancho/columnas

datos_puerta_izquierda:
					DB		#00;0		;0 no activa <>0 activo
					DB		#18;24		;punto x de la puerta para cuando se dispare encima
					DB		#54;84		;punto y de la puerta para cuando se dispare encima
					DB		#0C;12		;radio x de la puerta para cuando se dispare encima
					DB		#14;20		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_arriba	;función para acción de cada tipo de puerta
					DW		array_puerta_izquierda	;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERIZQU
					DB		7			;alto/filas
					DB		3			;ancho/columnas



;;=====================================================
;;SUBRUTINAS
;;=====================================================


;;=====================================================
;;INICIALIZA_PUERTAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_puertas
; entrada: 	*********************datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		-
inicializa_puertas:
	PUSH	HL
	PUSH	BC
	PUSH	DE
	
	;inicializa puerta arriba
	LD		 A, (prota_pos_mapy)
	CP		 6
	JP		 Z,.pinta_escalera			;de tener que pintar algo arriba, se pinta escalera (fila 6) o puerta (fila <> 6)
		LD		HL, datos_puerta_arriba	;origen
		JP		.cotinuamos_pintando_escalera_arriba
.pinta_escalera
		LD		HL, datos_escalera		;origen
.cotinuamos_pintando_escalera_arriba
	LD		DE, puerta_arriba			;destino
	CALL	carga_datos_puerta
	
	;inicializa puerta derecha
	LD		HL, datos_puerta_derecha	;origen
	LD		DE, puerta_derecha			;destino
	CALL	carga_datos_puerta
	
	;inicializa puerta abajo
	LD		HL, datos_puerta_abajo		;origen
	LD		DE, puerta_abajo			;destino
	CALL	carga_datos_puerta
	
	;inicializa puerta izquierda
	LD		HL, datos_puerta_izquierda	;origen
	LD		DE, puerta_izquierda		;destino
	CALL	carga_datos_puerta
	
	POP		DE
	POP		BC
	POP		HL
fin_inicializa_puertas:
	RET



;;=====================================================
;;CARGA_DATOS_PUERTA
;;=====================================================	
; función: 	carga los datos de la puerta de una variable con los datos de la puerta
; entrada
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_puerta:
	LD		BC, ESTRUCTURA_PUERTA ;bytes a mover (el nombre de la estructura equivale al tamaño de la estructura en bytes)
	LDIR
fin_carga_datos_puerta:
	RET


;;=====================================================
;;ACCION_ESCALERA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_escalera:
fin_accion_escalera:
	RET


;;=====================================================
;;ACCION_PUERTA_ARRIBA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_arriba:
fin_accion_puerta_arriba:
	RET


;;=====================================================
;;ACCION_PUERTA_DERECHA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_derecha:
fin_accion_puerta_derecha:
	RET
	

;;=====================================================
;;ACCION_PUERTA_ABAJO
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_abajo:
fin_accion_puerta_abajo:
	RET
	
	
;;=====================================================
;;ACCION_PUERTA_IZQUIERDA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_izquierda:
fin_accion_puerta_izquierda:
	RET
	

;;=====================================================
;;PINTA_PUERTAS
;;=====================================================	
; función: 	examina A y mira si tiene que pintar puertas de los lados, arriba o abrajo o las escaleras (o no)
; entrada: 	habitacion_actual 1 escalera 1 puerta arriba 1 pu der 1 pu aba 1 pu izq (si es 0 pinta pared)
; salida: 	-
; toca:		todo
pinta_puertas:
	CALL	pinta_parte_superior_pantalla	;pinta pasillo y paredes

	CALL	localiza_info_habitacion	;busca qué puertas debe pintar y lo mete en habitación_actual
	
	LD		 A, (habitacion_actual)
	BIT		 3, A
	CALL	nz, pinta_puerta_arr		;si es de la fila 7 los datos de la pueta de arriba serán los de una escalera

	LD		 A, (habitacion_actual)
	BIT		 2, A
	CALL	nz, pinta_puerta_der

	LD		 A, (habitacion_actual)
	BIT		 1, A
	CALL	nz, pinta_puerta_aba

	LD		 A, (habitacion_actual)
	BIT		 0, A
	CALL	nz, pinta_puerta_izq
fin_pinta_puertas:
	RET


;;=====================================================
;;PINTA_PUERTA_ABA
;;=====================================================	
; función: 	pinta la puerta de abajo
; entrada: 	puerta_abajo
; salida: 	-
; toca:		A, HL,BC, DE
pinta_puerta_aba:
	LD		IX, puerta_abajo
	CALL	actualiza_variables_pinta_array
		
	JP		pinta_array
fin_pinta_puerta_aba:


;;=====================================================
;;PINTA_PUERTA_ARR
;;=====================================================	
; función: 	pinta la puerta de arriba
; entrada: 	puerta_arriba
; salida: 	-
; toca:		IX
pinta_puerta_arr:
	LD		IX, puerta_arriba
	CALL	actualiza_variables_pinta_array
	
	JP		pinta_array
fin_pinta_puerta_arr:


;;=====================================================
;;PINTA_PUERTA_DER
;;=====================================================	
; función: 	pinta la puerta de la derecha
; entrada: 	puerta_derecha
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_der:
	LD		IX, puerta_derecha
	CALL	actualiza_variables_pinta_array
	
	JP		pinta_array
fin_pinta_puerta_der:

	
;;=====================================================
;;PINTA_PUERTA_IZQ
;;=====================================================	
; función: 	pinta la puerta de la izquierda
; entrada: 	puerta_izquierda
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_izq:
	LD		IX, puerta_izquierda
	CALL	actualiza_variables_pinta_array
	
	JP		pinta_array
fin_pinta_puerta_izq:


;;=====================================================
;;FIN_ACTUALIZA_VARIABLES_PINTA_ARRAY
;;=====================================================	
; función: 	como el código es el mismo en esta subrutia se actualizan los valores de wordaux2, wordaux1, byteaux1, byteaux2
; entrada: 	IX apuntando a la estructura de una puerta
; salida: 	-
; toca:		A,HL,BC, DE
actualiza_variables_pinta_array:
	LD		 L, (IX + ESTRUCTURA_PUERTA.tiles_puerta)			;guardo puntero al array a pintar (como pasar por referencia)
	LD		 H, (IX + ESTRUCTURA_PUERTA.tiles_puerta + 1)
	LD		(wordaux2), HL					;en la variable wordaux2
	
	LD		 L, (IX + ESTRUCTURA_PUERTA.pos_en_tilemap)			;guardo puntero al array a pintar (como pasar por referencia)
	LD		 H, (IX + ESTRUCTURA_PUERTA.pos_en_tilemap + 1)
	LD		(wordaux1), HL					;guarda valor pos tilemap en wordaux1
	
	LD		 A, (IX + ESTRUCTURA_PUERTA.alto)	;nº de filas
	LD		(byteaux1), A
	
	LD		 A, (IX + ESTRUCTURA_PUERTA.ancho)	;nº de columnas
	LD		(byteaux2), A
fin_actualiza_variables_pinta_array:
	RET
