	output 	"variables.dat"

;se posiciona el siguiente codigo (variables en la página 3)
	ORG		#C000

;;=====================================================
;;DEFINICIÓN DE VARIABLES GENERALES
;;=====================================================

include "constantesyvariables/constantes.asm"
include "constantesyvariables/constantesenemigos.asm"
include "constantesyvariables/estructuras.asm"

;variables globales del prota
prota:
prota_nivel:				DB		0			;nivel del castillo donde está 0-6
prota_vidas:				DB		3
prota_reliquias:			DB		3
prota_pos_mapx:				DB		0			;pos columna
prota_pos_mapy:				DB		3			;pos fila
prota_energia:				DB		0			;valor real de la energía
prota_energia_bytebajo:		DB		0			;cuando se llene este es cuando se pierde prota_energía
prota_dano_actual:			DB		PROTADANO1	;daño actual cuando el prota dispara

;array para pintar de golpe el marcador de vidas
array_aux_vidas: 			DB		0,0,0,0,0,0,0,0
;;RELIQUIAS
array_aux_reliquias:		DB		0,0,0,0,0,0,0,0	;array para pintar de golpe el marcador de reliquias
;;ENERGIA
array_aux_energia:								;array para pintar de golpe el marcador de energía
							DB		16,0,0,0,0,0,0	;el 16 primero es porque siempre estará pintado el cuadro primero rojo
ultimo_pos_array_aux_energia:
							DB		0			;el array completo es de 8 pero para posicionar sin niecesidad de cálculos  etiqueto este aparte

;;MAPA	
array_aux_mapa_limpiar:		DB		0,0,0,0,0,0,0	;es por facilitar el reseteo del mapa (pinto 7 lineas en negro con bios) la otra opción es más larga en código y complicada aunque más rápida
elemento_pintar_mapa:		DB		0			;TILEPROTAM = 19, ;TILEGRISM = 9
			

;;=====================================================
;;DECORACION PAREDES
;;=====================================================
antorchas:					DS		ESTRUCTURA_ANTORCHA
array_antorcha:				DB		197,198,199	;fuego + madera1 + madera2

esqueletos:					DS		ESTRUCTURA_ESQUELETO
array_esqueleto:			DB		194, 0, 195, 160, 164, 161, 0, 163, 0, 193, 162, 192
lista_escenas_calavera:		DB		164, 165, 164, 166
var_aux_calavera:			DB		0			;flip_calavera_esqueletos


;;=====================================================
;;VARIABLES ENEMIGOS
;;=====================================================
;para movimiento de enemigos (las escenas)
heartbeat_enemigos:
heartbeat_cienpies:			DB		0;			;reloj central que moverá los enemigos (cienpies)
heartbeat_serpiente:		DB		0;			;reloj central que moverá los enemigos (serpiente)
heartbeat_arana:			DB		0;			;reloj central que moverá los enemigos (arana)
heartbeat_murcielago:		DB		0;			;reloj central que moverá los enemigos (murcielago)
heartbeat_lobo:				DB		0;			;reloj central que moverá los enemigos (lobo)
heartbeat_esqueleto:		DB		0;			;reloj central que moverá los enemigos (esqueleto)
heartbeat_zombi:			DB		0;			;reloj central que moverá los enemigos (zombi)
heartbeat_fantasma:			DB		0;			;reloj central que moverá los enemigos (fantasma)
heartbeat_caballero:		DB		0;			;reloj central que moverá los enemigos (caballero)
heartbeat_fuego:			DB		0;			;reloj central que moverá los enemigos (fuego)
heartbeat_magia:			DB		0;			;reloj central que moverá los enemigos (magia)
heartbeat_general:			DB		0;			;reloj central que moverá los enemigos (dracula, mano derecha, mano izquierda y jefes)

enemigo1:					DS		ESTRUCTURA_ENEMIGO
enemigo2:					DS		ESTRUCTURA_ENEMIGO
enemigo3:					DS		ESTRUCTURA_ENEMIGO
enemigo4:					DS		ESTRUCTURA_ENEMIGO
enemigo5:					DS		ESTRUCTURA_ENEMIGO
enemigo6:					DS		ESTRUCTURA_ENEMIGO
enemigo7:					DS		ESTRUCTURA_ENEMIGO

;;SPRITES GENERAL (PROTA +  ENEMIGOS)
;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:			DS		 2 * 4		;el punto de mira siempre tiene 2 sprites
array_sprites_enem:			DS		30 * 4		;resto de sprites


;;=====================================================
;;VARIABLES AYUDAS
;;=====================================================
hay_ayudas_en_pantalla:		DB	0		;1 => hay / 0 => no hay; variable que se actualiza cuando cambiemos de habitación para no mirar el bit de habitación cada vez

puntero_ayuda_actual:		DW	0		;puntero a ayuda que se muestra en pantalla (sólo se muestra una a la vez)

lista_ayudas:
ayuda_oracion:				DS		ESTRUCTURA_AYUDA		
ayuda_cruz:					DS		ESTRUCTURA_AYUDA
ayuda_aguabendita:			DS		ESTRUCTURA_AYUDA
ayuda_armadura:				DS		ESTRUCTURA_AYUDA
ayuda_planta:				DS		ESTRUCTURA_AYUDA
ayuda_vidaextra				DS		ESTRUCTURA_AYUDA
ayuda_ballesta:				DS		ESTRUCTURA_AYUDA


;;=====================================================
;;VARIABLES PINTA PANTALLAS + PUERTAS
;;=====================================================
;pinta_parte_superior_pantalla
tiles_patrones:				DW		0
tiles_colores:				DW		0
tiles_mapa:					DW		0

;pinta_array
wordaux1:					DW		0		;almacena la posición en el tilemap 0 al 675
wordaux2:					DW		0		;almacena puntero a array de tiles (posiciones en realidad) a pintar (posiciones repetidas en los 2 primeros bancos)
byteaux1:					DB		0		;nº filas Registro D
byteaux2:					DB		0		;nº columnas Registro E

lista_puertas:
puerta_arriba:				DS		ESTRUCTURA_PUERTA
puerta_derecha:				DS		ESTRUCTURA_PUERTA
puerta_abajo:				DS		ESTRUCTURA_PUERTA
puerta_izquierda:			DS		ESTRUCTURA_PUERTA
puerta_escalera:			DS		ESTRUCTURA_PUERTA

habitacion_actual:			DB		0		;habitación donde se encuentre el prota. Se mete en una varible par traer todos los datos de golpe y no buscarlos varias veces
habitacion_extras:			DB		0		;donde van las ayudas de una habitación
habitacion_terminada:		DB		0		;variable para consultar más rápido si se ha pasado (<>0 si se ha pasado y 0 no se ha pasado o no terminada)

puntero_extras_habitacion_actual:	DW	0		;puntero a los extras de la habitación actual para poder modificarlo (para que no salgan extras)
puntero_habitacion_actual:			DW	0		;puntero a la habitación actual para poder modificarlo 


;;=====================================================
;;VARIABLES PUNTO MIRA
;;=====================================================
puntomira:					DS		ESTRUCTURA_PUNTOMIRA


;;=====================================================
;;VARIABLES GLOBALES
;;=====================================================
dracula_muerto:				DB		NO					;equ 0


;;=====================================================
;;VARIABLES HABITACIONES
;;=====================================================
	include "datos/habitaciones.asm"


;~ ;;=====================================================
;~ ;;VARIABLES TIEMPO
;~ ;;=====================================================
;~ tiempo:
;~ contador:				DB	0
;~ segundos:				DB	0
;~ minutos:					DB	0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VARIABLES PARA SONIDO 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	map		#f000	;IMPRESCINDIBLE PARA MÚSICA Y SONIDO !!!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PT3 REPLAYER
PT3_SETUP:		#1	;set bit0 to 1, if you want to play without looping
					;bit7 is set each time, when loop point is passed
PT3_MODADDR:	#2
PT3_CrPsPtr:	#2
PT3_SAMPTRS:	#2
PT3_OrnPtrs:	#2
PT3_PDSP:		#2
PT3_CSP:		#2
PT3_PSP:		#2
PT3_PrNote:		#1
PT3_PrSlide:	#2
PT3_AdInPtA:	#2
PT3_AdInPtB:	#2
PT3_AdInPtC:	#2
PT3_LPosPtr:	#2
PT3_PatsPtr:	#2
PT3_Delay:		#1
PT3_AddToEn:	#1
PT3_Env_Del:	#1
PT3_ESldAdd:	#2
PT3_NTL3:		#2	; AND A / NOP (note table creator)

VARS:			#0

ChanA:			#29			;CHNPRM_Size
ChanB:			#29			;CHNPRM_Size
ChanC:			#29			;CHNPRM_Size

;GlobalVars
DelyCnt:		#1
CurESld:		#2
CurEDel:		#1
Ns_Base_AddToNs:	#0
Ns_Base:		#1
AddToNs:		#1

NT_:			#192	; Puntero a/tabla de frecuencias

AYREGS:			#0
VT_:			#14
EnvBase:		#2
VAR0END:		#0

T1_:			#0		
T_NEW_1:		#0
T_OLD_1:		#24
T_OLD_2:		#24
T_NEW_3:		#0
T_OLD_3:		#2
T_OLD_0:		#0
T_NEW_0:		#24
T_NEW_2:		#166
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PT3 REPLAYER END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ayFX REPLAYER 
ayFX_MODE:		#1			; ayFX mode
ayFX_BANK:		#2			; Current ayFX Bank
ayFX_PRIORITY:	#1			; Current ayFX stream priotity
ayFX_POINTER:	#2			; Pointer to the current ayFX stream
ayFX_TONE:		#2			; Current tone of the ayFX stream
ayFX_NOISE:		#1			; Current noise of the ayFX stream
ayFX_VOLUME:	#1			; Current volume of the ayFX stream
ayFX_CHANNEL:	#1			; PSG channel to play the ayFX stream

	;IF (AYFXRELATIVE == 1 ) 
;ayFX_VT:	ds	2			; ayFX relative volume table pointer
	;ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ayFX REPLAYER END