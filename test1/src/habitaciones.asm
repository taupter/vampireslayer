;;=====================================================
;;DEFINICIÓN DE HABITACIONES x NIVEL
;;=====================================================	

; sólo voy a usar 7x7 pero como los arrays son lineales y voy a trabajar con matrices
; me interesa que seande  8x8 aunque sólo trabaje con 7x7

; ojo... la primera linea corresponderá a la primera linea del castillo no a la última

;; definición de estructura de bits
;16 bits por habitación

;NOTA: no es necesario asignar un bit para la puerta de arriba ya que en las habitaciones de la fila 7 sólo habrá una puerta que será una escalera

;~ 7 - sin asignar
;~ 6 - si 1 => ayudas usadas 0 => ayudas no usuadas (se inicializan al empezar la partida)
;~ 5 - esqueletos
;~ 4 - todos los enemigos muertos 0 no y 1 ó <>0 => toca la variable "is_habitacion_terminada" (se inicializan al empezar la partida)
;~ 0,1,2,3 - nº puertas 1 arriba 1 derecha 1 abajo 1 izquierda

;~ 7 - oracion
;~ 6 - cruz
;~ 5 - agua bendita
;~ 4 - armadura
;~ 3 - planta
;~ 2 - vida extra
;~ 1 - ballesta
;~ 0 - antorchas

;importante: el byte de la columna 15 indicará con 1 y 0 habitaciones por las que se haya pasado
;cuando se inicie la partida todos se pondrán a 0
;por ejemplo 01000000b se ha pasado por la hab. 2 de esa fila en el nivel que sea

habitacion_actual:
	db  0		;habitación donde se encuentre el prota. Se mete en una varible par traer todos los datos de golpe y no buscarlos varias veces
habitacion_extras:
	db	0		;donde van las ayudas de una habitación
habitacion_actual_puntero;
	dw	0		;puntero para actualizar la habitación cuando se maten todos los enemigos
is_habitacion_terminada:
	db	0		;variable para consultar más rápido si se ha pasado (<>0 si se ha pasado y 0 no se ha pasado)


habitaciones_juego:
habitaciones_nivel0:                              ;*  
	db  00000000b,#C0,00000000b,#C0,00000000b,#01,01001010b,11111110b,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00111010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila
	
habitaciones_nivel1:
	db  00000000b,#C0,00000000b,#C0,00000000b,#00,00011010b,#00,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00011010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila
	
habitaciones_nivel2:
	db  00000000b,#C0,00000000b,#C0,00000000b,#00,00011010b,#00,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00011010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila
	
habitaciones_nivel3:
	db  00000000b,#C0,00000000b,#C0,00000000b,#00,00011010b,#00,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00011010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila
	
habitaciones_nivel4:
	db  00000000b,#C0,00000000b,#C0,00000000b,#00,00011010b,#00,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00011010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila
	
habitaciones_nivel5:
	db  00000000b,#C0,00000000b,#C0,00000000b,#00,00011010b,#00,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00011010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila
	
habitaciones_nivel6:
	db  00000000b,#C0,00000000b,#C0,00000000b,#00,00011010b,#00,00010000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00 	;primera fila
	db  00000000b,#C0,00011100b,#C0,00011101b,#00,00011111b,#00,00011101b,#C0,00011001b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011110b,#C0,00011111b,#00,00011111b,#00,00011111b,#C0,00011011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011010b,#00,00010010b,#00,00011010b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00011010b,#C0,00011110b,#C0,00010101b,#C0,00011011b,#C0,00011010b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00010110b,#C0,00010111b,#C0,00011101b,#C0,00010111b,#C0,00010011b,#C0,00000000b,#C0,#00,#00
	db  00000000b,#C0,00000000b,#C0,00000000b,#C0,00011010b,#C0,00011000b,#C0,00000000b,#C0,00000000b,#C0,#00,#00	;última fila


