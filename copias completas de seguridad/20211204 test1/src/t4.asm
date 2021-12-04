	OUTPUT	"t4.bin"
	
;;=====================================================
;;DEFINICIÓN DE CONSTANTES
;;=====================================================	
	include "constantes.asm"

;;=====================================================
;;DEFINICIÓN DE CABECERA DE ARCHIVO BIN
;;=====================================================		
	include "cabecerabin.asm"
	
START:	
	;inicializa pantalla y entonrno
	CALL	sub_preparapantalla			;screen 2,2 sin click al pulsar tecla y color 16,1,1
	
	;inicializa variables para parametrizar funciones y que lo que se muestre sea variable (nº vidas, mapa, puertas, pantalla, etc...)
	CALL	inicializa_variables_pruebas
	
	;inicializa los niveles por partida
	CALL	inicializa_niveles			;no es necesario parametrizarlo según el nivel del usuario ya que se cargan todos

	;inicializa los valores de cada puerta excepto si están activas o no (eso ocurre cuando se matan todos los enemigos de la hab. y sólo a las puertas que se muestren)
	CALL	inicializa_puertas
	
	;inicializa las estructuras de forma particular según ayuda pero sin poner valores de posición
	CALL	inicializa_ayudas
	
	;inicializa las estructuras de las antorchas y esqueletos
	CALL	inicializa_antorchas
	CALL	inicializa_esqueletos
	
	;pinta la pantalla (la primera o algunas especiales se pintan completamente)
	CALL	pinta_pantalla_completa
	
	;carga sprites en memoria (SE HA RETRASADO HASTA PARAMETRIZAR LA CARGA DE PANTALLAS)
	CALL 	carga_patrones_sprites_nivel
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	;una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	pinta_vidas
	CALL 	pinta_reliquias
	CALL	pinta_nivel
	CALL	borra_mapa
	CALL	pinta_puertas

	LD		 A, TILEPROTAM
	LD		(elemento_pintar_mapa), A
	CALL	posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.posx y posy
		
	CALL	pinta_ayudas_habitacion
	
	CALL	pinta_extra_fondo
	
	;esta función no va aquí sino en check colisiones pero se pone aquí para realizar pruebas
	CALL	terminada_habitacion_recorrida ;para cuando se maten todos los enemigos de la habitación

	;incializacion de replayer con interrupciones
;	CALL	inicializa_replayer_efectos_interrupciones

loop_principal:
	HALT							;espera VBLANK y sincroniza
	
	CALL	render_sprites			;actualiza array de sprites y los pinta en pantalla
	
	CALL	pinta_energia			;pinta la energia en pantalla
	
	CALL	actualiza_elementos_fondo

	CALL	check_player			;MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
	
	JP		loop_principal
fin_programa_principal:
	;no necesita RET


;;=====================================================
;;CHECK_COLISIONES_OBJETOS
;;=====================================================	
; función: 	revisa (con enemigos+ayudas o puertas según si la habitación ha sido recorrida o no) las variables para ver si se disparó sobre ellas
; entrada: 	is_habitacion_terminada
; salida: 	-
; toca:		HL,BC, DE
check_colisiones_objetos:
	PUSH	AF
	
	;pantalla limpia?
	LD		 A, (is_habitacion_terminada)
	OR		 0
	JP		 Z, .habitacion_no_terminada
	;SI 
	;recorre puertas y sale
		CALL	check_colisiones_puertas
	;NO 
.habitacion_no_terminada:
	
	;recorre ayudas
	LD		 A, (hay_ayudas_en_pantalla)
	OR		 0
	JP		 Z, .habitacion_sin_ayudas
	;SI
	;mira si hay colisiones con la ayuda que haya puntero_ayuda_actual
		CALL	check_colision_ayudas
;	CALL		test_OK
	;NO
.habitacion_sin_ayudas:
	
	;recorre enemigos

fin_check_colisiones_objetos:	
	POP		AF
	RET


;;=====================================================
;;CHECK_COLISION_AYUDAS
;;=====================================================	
; función: 	revisa si ha habido disparo sobre la ayuda de pantalla
; entrada: 	puntero_ayuda_actual
; salida: 	-
; toca:		todo
check_colision_ayudas:
	LD		IX, (puntero_ayuda_actual)
	LD		 A, (IX)
	OR		 A							;está activa la ayuda de pantalla?
	JP		 Z, fin_check_colision_ayudas
	;SI
		CALL	check_colision_ayuda	;aquí ya es cosa de ver colisiones prota/puerta_izquierda
		;recibe valor A
		OR		 0						;hubo colisión?
		RET		 Z						;no hubo colisión por lo que sale
		;hubo colisión
		;EJECUTA ACCIÓN Y SALE DE LA RUTINA	
		LD		HL, fin_check_colision_ayudas ;se guarda dónde volver
		PUSH	HL
		LD		 L, (IX + ESTRUCTURA_AYUDA.accion)
		LD		 H, (IX + ESTRUCTURA_AYUDA.accion + 1)
		JP		(HL)
	;FINSI
fin_check_colision_ayudas:
	RET
	
	


;;=====================================================
;;CHECK_COLISION_AYUDA
;;=====================================================	
; función: 	revisa la distancia con ayuda para ver si se disparó a la ayuda activa
; entrada: 	IX con el puntero a la puerta que se examina
; salida: 	A (0 no hay colisión con puerta / 1 sí la hay)
; toca:		HL,BC, DE
check_colision_ayuda:
.deteccioncolision_paso1:
	LD		IY, prota	;IY punto de mira / IX puerta
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posx)
	ADD		 8			;8-es fijo, offset del punto de mira ya que se mueve según la esquina superior izquierda y el centro del punto de mira está en el centro del sprite
	
	;ya tengo en A la coordenada X del centro del punto de mira					
	SUB		(IX + ESTRUCTURA_AYUDA.posx)	;le resto el punto x en la puerta
	
	JP		NC, .deteccioncolision_paso2	;si no es negativo comparo con el radio

	NEG										;si es negativo lo niego (valor absoluto)
	
.deteccioncolision_paso2:
	CP		(IX + ESTRUCTURA_AYUDA.radiox)	;comparo con el radio X de la puerta
	
	JP		 C, .deteccioncolision_paso3	;SI NC la distancia es >= por lo que sale y no es necesario verificar nada más
	
	XOR		 A								;el resultado es falso y se guarda en A y ya no hay que seguir coprobando
	RET
	
.deteccioncolision_paso3:					;la distancia X es válida, comprobamos la distancia Y
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posy)
	ADD		 8								;le sumo el offset del punto de mira (8 es fijo)

	;ya tengo en A la coordenada Y del centro del punto de mira					
	SUB		(IX + ESTRUCTURA_AYUDA.posy)	;le resto el punto y en la puerta
	
	JP		NC, .deteccioncolision_paso4	;si no es negativo comparo con el radio

	NEG										;si es negativo lo niego (valor absoluto)

.deteccioncolision_paso4:
	CP		(IX + ESTRUCTURA_AYUDA.radioy)	;comparo con el radio Y de la puerta

	JP		 C, .deteccioncolision_paso5	;SI NC la distancia es >= por lo que sale y no es necesario verificar nada más
	
	XOR		 A								;el resultado es falso y se guarda en A un 0 y al ser la 2º comprobación salimos
	RET

.deteccioncolision_paso5:
	LD		 A, SI
fin_check_colision_ayuda:
	RET




;;*******************************************************************
; sólo para hacer pruebas y pintar la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 4
	LD		(prota_vidas),A

	LD		 A, 4
	LD		(prota_reliquias), A

	LD		 A, 100
	LD		(prota_energia), A

	;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
	;será igual la posición inicial en todos los niveles
	
	LD		 A, 0				;los niveles (matrices) son 7 del 0 al 6
	LD		(prota_nivel), A	;nivel empieza en 0 para usar las posiciones ascii

	LD		 A, 0				;los subniveles (filas) son 7 del 0 al 6
	LD		(prota_pos_mapy), A	;pos Y dentro del nivel (se empieza en 0)

	LD		 A, 3				;columnas 7: del 0 al 6
	LD		(prota_pos_mapx), A	;pos X dentro del nivel (se empieza en 0)
	
	XOR		 A					;cadencia por defecto.. cuando se coja mejora en arma se puede variar
	LD		(prota.cadencia), A
	
	LD		(is_habitacion_terminada), A
fin_inicializa_variables_pruebas:
	RET
;;************************************************************************









;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
	include "subr_general.asm"
	
	include "subr_pintapantalla.asm"
	
	include "subr_puertas.asm"
	
	include "subr_sprites.asm"
	
	include "subr_teclado_joy.asm"
	
	include "subr_sonido.asm"
	
	include "subr_ayudas.asm"
	

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS DE FERNANDO PARA COMPRESIÓN Y SONIDO
;;=====================================================
;Este include lleva la rutina de descompresión de ROM/RAM a VRAM de pletter
;Está adaptada de la original a sjasm
;	HL = RAM/ROM source	; DE = VRAM destination
depack_VRAM:
	include "PL_VRAM_Depack_SJASM.asm"


	
;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================		
	include "estructuras.asm"
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================		
	include "sprites.asm"
	
	include "habitaciones.asm"
	
	include "variables.asm"
	
;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"

END:
