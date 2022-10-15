	OUTPUT	"vs.rom"
	
	include "variables.sym"
	
;;=====================================================
;;DEFINICIÓN DE CONSTANTES
;;=====================================================	
;	include "constantesyvariables/constantes.asm"
;	include "constantesyvariables/constantesenemigos.asm"


;;=====================================================
;;DEFINICIÓN DE CABECERA DE ARCHIVO BIN
;;=====================================================		
	include "cabecerarom.asm"
	
	
START:
;;
;;INTRODUCCIÓN DE CÓDIGO PARA PODER USAR 32K
;;
		DI	
	
		IM 		 	 1
		LD			SP, #F380
	
;preparando para 32K
		CALL 		#0138 ;RSLREG
[2]		RRCA
		AND 		#03

; Secondary Slot
		LD 			 C, A
		LD 			HL, #FCC1
		ADD 		 A, L
		LD 			 L, A
		LD 			 A, [HL]
		AND 		#80
		OR 			 C
		LD 			 C, A
[4]		INC 		 L
		LD 			 A, [HL]

; Define slot ID
		AND 		#0C
		OR 			 C
		LD 			 H, #80

; Enable
		CALL 		#0024 ;ENASLT

		EI
;;
;;FIN INTRODUCCIÓN DE CÓDIGO PARA PODER USAR 32K
;;		
		;inicializa variables
		CALL		carga_valores_iniciales_variables

		;inicializa pantalla y entonrno
		CALL		sub_preparapantalla			;screen 2,2 sin click al pulsar tecla y color 16,1,1

inicio_juego:
		;incializacion de replayer con interrupciones
;		CALL		inicializa_replayer_efectos_interrupciones
	
pantalla_inicial:
		CALL		muestra_pantalla_inicial

		;inicializa variables para parametrizar funciones y que lo que se muestre sea variable (nº vidas, mapa, puertas, pantalla, etc...)
		CALL		inicializa_variables_prota
		CALL		inicializa_variables_juego
	
		;inicializa el punto de mira
		CALL		inicializa_punto_mira
	
		;inicializa los niveles por partida (habitaciones)
		CALL		inicializa_niveles			;no es necesario parametrizarlo según el nivel del usuario ya que se cargan todos

		;inicializa los valores de cada puerta excepto si están activas o no (eso ocurre cuando se matan todos los enemigos de la hab. y sólo a las puertas que se muestren)
		CALL		inicializa_puertas
	
		;inicializa las estructuras de forma particular según ayuda pero sin poner valores de posición
		CALL		inicializa_ayudas
	
		;inicializa las estructuras de las antorchas y esqueletos
		CALL		inicializa_antorchas
		CALL		inicializa_esqueletos
	
		;pinta la pantalla (la primera o algunas especiales se pintan completamente)
		CALL		pinta_pantalla_completa
	
		;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
		;una variable para ver si el array hay que actualizarlo en pantalla o no
		CALL		pinta_vidas
		
		CALL 		pinta_reliquias
		
		CALL		cambio_nivel
	
		CALL		pinta_energia
	
		CALL		entra_habitacion 		;CALL resetea enemigos + CALL inicializa_enemigos_fase + CALL	pinta_puertas + CALL pinta_ayudas_habitacion + CALL	pinta_extra_fondo 

loop_principal:
		HALT								;espera VBLANK y sincroniza	

		CALL		actualiza_elementos_fondo;como antorchas o esqueletos
		
		CALL		check_enemigos			;examina los enemigos por pantalla y los pone en su sitio 

		CALL		check_player			;MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
	
		;incrementa el hearbeat para el movimiento (escena) de los distintos enemigos		
		LD			 B, 12	;se han definido 12 escena de enemigos distintas
		LD			HL, heartbeat_enemigos
.loop_heartbeat:	INC			(HL)
					INC			HL
.fin_loop_hearbeat:	DJNZ		.loop_heartbeat

		CALL		render_sprites			;actualiza array de sprites y los pinta en pantalla
	
		JP			loop_principal
fin_programa_principal:


;;=====================================================
;;INICIALIZA_VARIABLES_PROTA
;;=====================================================
; funcion: inicializa las variables que afectan al prota y dónde empieza la partida
inicializa_variables_prota:
		LD		 A, PROTAVIDAS
		LD		(prota_vidas),A

		LD		 A, PROTARELIQUIAS
		LD		(prota_reliquias), A

		LD		 A, PROTAENERGIA			
		LD		(prota_energia), A
	
		LD		 A, PROTAENERGIABYTEBAJO			
		LD		(prota_energia_bytebajo), A
		
		LD		 A, PROTADANO1
		LD		(prota_dano_actual), A	;daño actual cuando el prota dispara

		;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
		;será igual la posición inicial en todos los niveles
	
		LD		 A, 6; PROTANIVEL	***************	
		LD		(prota_nivel), A

		LD		 A, 6; PROTAPOSMAPY
		LD		(prota_pos_mapy), A	

		LD		 A, PROTAPOSMAPX	
		LD		(prota_pos_mapx), A
fin_inicializa_variables_prota:
		RET
		
		
;;=====================================================
;;INICIALIZA_VARIABLES_JUEGO
;;=====================================================
; funcion: inicializa las variables que afectan al juego en general
inicializa_variables_juego:
		XOR			 A
		LD			(dracula_muerto), A
fin_inicializa_variables_juego:
		RET

;;************************************************************************



efecto_enemigos_tira_reliquia:
;es enemigo jefe
		LD		 B, 6
		
		LD		 A, (prota_pos_mapy);primero miro la posición y. los jefes están en la 6 (7 en realidad)
		CP		 B
		JP		 Z, enemigo_jefe
		
		LD		 A, (prota_nivel)	;si el nivel es 6 (7 en realidad) son todos jefes)
		CP		 B
		JP		 Z, enemigo_jefe

;tira bomba a enemigo NO JEFE
enemigo_nojefe:
		LD		IX, enemigos
		LD		 B, 7
		LD		 C, 2
		
.loop:	
.examina_enemigo:
		LD			 A, (IX)
		CP			 C
		JP			 C, .fin_examina_enemigo
		
		PUSH		BC
		CALL		mata_enemigo
		POP			BC	
.fin_examina_enemigo:
		CALL		pasa_siguiente_enemigo
		DJNZ	.loop
		RET
		
;tira bomba a enemigo JEFE --- nota: se mantiene el bucle porque el últio enemigo (drácula) es equivalente a 3 enemigos
enemigo_jefe:
		LD		IX, enemigos
		LD		 B, 5
		LD		 C, 2
		
.loopjefe:	
.examina_enemigojefe:
		LD			 A, (IX)
		CP			 C
		JP			 C, .fin_examina_enemigojefe
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
		SUB			PROTADANORELIQUIA
		JP			NC, .fin_examina_enemigojefe
		
		PUSH		BC
		CALL		mata_enemigo
		POP			BC
.fin_examina_enemigojefe:
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se resta la energía que 
		CALL		pasa_siguiente_enemigo
		DJNZ	.loopjefe
		RET
fin_efecto_enemigos_tira_reliquia:


pasa_siguiente_enemigo:
		[21]	INC			IX
fin_pasa_siguiente_enemigo:
		RET

;;************************************************************************		


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
	include "subr_general.asm"
	
	include "subr_pintapantalla.asm"
	
	include "subr_puntomira.asm"
	
	include "subr_puertas.asm"
	
	include "subr_sprites.asm"
	
	include "subr_ayudas.asm"
	
	include "subr_tiempo.asm"
	
	include "subr_teclado_joy.asm"
	
	include "enemigos/subr_enemigos.asm"
	
	include "sonido/subr_sonido.asm"
	

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS DE FERNANDO PARA COMPRESIÓN Y SONIDO
;;=====================================================
;Este include lleva la rutina de descompresión de ROM/RAM a VRAM de pletter
;Está adaptada de la original a sjasm
;	HL = RAM/ROM source	; DE = VRAM destination
depack_VRAM:
	include "pletter/PL_VRAM_Depack_SJASM.asm"


;;=====================================================
;;DEFINICIÓN DE PANTALLAS / CONTANTES DATOS PANTALLAS
;;=====================================================		
	include "datos/pantallas.asm"


;;=====================================================
;;CONTANTES DATOS SPRITES
;;=====================================================
	include "datos/sprites.asm"


;;=====================================================
;;CONTANTES DATOS TEXTOS
;;=====================================================
	include "datos/textos.asm"
	
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================		
inicializacion_variables:
	incbin	"variables.dat"
fin_inicializacion_variables:



;nota: el powerup de armadura dura n habitaciones
;nota: el powerup de disparo dura n habitaciones
;IMPORTANTE... BUG EN HABITACIÓN FINALIZADA... SIGUEN SALIENDO ENEMIGOS


;END: (FIN CÓDIGO)


;INICIO ZONA DATOS (BANCO DE MEMORIA 3)
		DS	#C000 - $
