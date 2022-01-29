;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

;las posiciones iniciales dependerán de los últimos 3 bits del registro R
;nota: se pone un 0 de más para simplificar el bucle de selección
posiciones_iniciales_cienpies_x:
		DB			0,0,0,0,0,0,0,0,0

posiciones_iniciales_cienpies_y:
		DB			0,0,0,0,0,0,0,0,0

enemigo1			ESTRUCTURA_ENEMIGO
enemigo2			ESTRUCTURA_ENEMIGO
enemigo3			ESTRUCTURA_ENEMIGO
enemigo4			ESTRUCTURA_ENEMIGO
enemigo5			ESTRUCTURA_ENEMIGO
enemigo6			ESTRUCTURA_ENEMIGO
enemigo7			ESTRUCTURA_ENEMIGO
enemigo8			ESTRUCTURA_ENEMIGO
enemigo9			ESTRUCTURA_ENEMIGO


;;=====================================================
;;DATOS_ENEMIGOS (EQUIVALE A PLANTILLAS)
;;=====================================================
datos_cienpies:
					DB		2	;(activo_tipo)si inactivo = 0 si <> 0 es el tipo de enemigo
					;aquí se usará el xor
					DB		0	;(escena) sprite a mostrar 1/2 
					DB		0	;(cont_sig_escena)retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
					DB		0	;(tiemp_cam_escena)cada cuantas iteraciones se cambiará la escena
					DB		10	;(energia)energía del enemigo antes de morir
					DB		0	;(pos_x)pos x para mover y punto central del sprite para revisar disparo
					DB		0	;(pos_y)pos y para mover y punto central del sprite para revisar disparo
					DB		8	;(radiox)radio x del enemigo para cuando se dispare encima
					DB		8	;(radioy)radio y del enemigo para cuando se dispare encima
					DB		0	;(inc_x)incremento x para mover
					DB		0	;(inx_y)incremento y para mover
					DB		0	;(radio)radio para movimientos circulares
					DB		0	;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
					DB		0	;(pasos)pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
;mezclo el ptr_sig_escena con el mover ya que son obligatorias no merece la pena tener 2
;ptr_sig_escena		DW		0	;funcion que cambia los sprites de la escena (según el nº de sprites será distinta)
					DW		mover_cienpies	;(ptr_mover)puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
;se pondrán 8 sprites: 4 por si hay enemigos de hasta 4 sprites y por 2 por usar 2 escenas... si se usan 3 habría que ampliar
					DB		7 	;(sprite_1a)
					DB		0 	;(sprite_2a)
					DB		0 	;(sprite_3a)
					DB		0 	;(sprite_4a)
					DB		8 	;(sprite_1b)
					DB		0 	;(sprite_2b)
					DB		0 	;(sprite_3b)
					DB		0 	;(sprite_4b)
					DB		0 	;(sprite_1c)
					DB		0 	;(sprite_2c)
					DB		0 	;(sprite_3c)
					DB		0 	;(sprite_4c)
					DB		0 	;(sprite_1d)
					DB		0 	;(sprite_2d)
					DB		0 	;(sprite_3d)
					DB		0 	;(sprite_4d)
					DB		2	;(color1) color sprite 1
					DB		0	;(color2) color sprite 2
					DB		0	;(color3) color sprite 3
					DB		0	;(color4) color sprite 4
					DB		3	;(plano sprite_1)
					DB		0	;(plano sprite_2)
					DB		0	;(plano sprite_3)
					DB		0	;(plano sprite_4)
					


datos_serpiente:
datos_arana:
datos_murcielago:
datos_lobo:
datos_esqueleto:
datos_zombi:
datos_fantasma:
datos_caballerogris:
datos_caballeronegro:
datos_fuego:
datos_magia:
datos_jefelobo:
datos_jefemurcielago:
datos_jefefatasma:
datos_jefezombie:
datos_jefecaballero:
datos_jefebeholder:
datos_manoderecha:
datos_manoizquierda:
datos_conde:

					
;;=====================================================
;;SUBRUTINAS
;;=====================================================


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE1
;;=====================================================	
; función: 	inicializa las variables que serán usadas e el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase1:
		call		actualiza_valores_aleatorios_cienpies
		LD			HL, datos_cienpies
		LD			DE, enemigo1
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
		call		actualiza_valores_aleatorios_cienpies
		LD			HL, datos_cienpies
		LD			DE, enemigo2
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
		call		actualiza_valores_aleatorios_cienpies
		LD			HL, datos_cienpies
		LD			DE, enemigo3
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
		call		actualiza_valores_aleatorios_cienpies
		LD			HL, datos_cienpies
		LD			DE, enemigo4
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
		call		actualiza_valores_aleatorios_cienpies
		LD			HL, datos_cienpies
		LD			DE, enemigo5
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
		call		actualiza_valores_aleatorios_cienpies
		LD			HL, datos_cienpies
		LD			DE, enemigo6
		LD			BC, ESTRUCTURA_ENEMIGO
		call		actualiza_valores_aleatorios_cienpies
		LDIR
		LD			HL, datos_cienpies
		LD			DE, enemigo7
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_inicializa_enemigos_fase1:
		RET
		
;;=====================================================
;;ACTUALIZA_VALORES_ALEATORIOS_CIENPIES
;;=====================================================	
; función: 	inicializa valores aleatorios del cienpies: posicion inicial (posx, posy)
; entrada:	-
; salida: 	-
; toca:		-
actualiza_valores_aleatorios_cienpies:
		LD			IX, datos_cienpies
		
		LD			 A, R
		AND			00000111b
		LD			 B, A
		LD			 D, A
		LD			HL, posiciones_iniciales_cienpies_x
.incrementa_posx:
		INC			HL
		DJNZ		.incrementa_posx
		
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), (HL)
		
		LD			 B, D
		LD			HL, posiciones_iniciales_cienpies_y
.incrementa_posy:
		INC			HL
		DJNZ		.incrementa_posy	
		
		
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), (HL)
fin_actualiza_valores_aleatorios_cienpies:
		RET		


inicializa_enemigos_fase0_nivel1:
inicializa_enemigos_fase0_nivel2:
inicializa_enemigos_fase0_nivel3:
inicializa_enemigos_fase0_nivel4:
inicializa_enemigos_fase0_nivel5:
inicializa_enemigos_fase0_nivel6:
inicializa_enemigos_fase0_nivelboss:

inicializa_enemigos_fase1_nivel1:
inicializa_enemigos_fase1_nivel2:
inicializa_enemigos_fase1_nivel3:
inicializa_enemigos_fase1_nivel4:
inicializa_enemigos_fase1_nivel5:
inicializa_enemigos_fase1_nivel6:
inicializa_enemigos_fase1_nivelboss:

inicializa_enemigos_fase2_nivel1:
inicializa_enemigos_fase2_nivel2:
inicializa_enemigos_fase2_nivel3:
inicializa_enemigos_fase2_nivel4:
inicializa_enemigos_fase2_nivel5:
inicializa_enemigos_fase2_nivel6:
inicializa_enemigos_fase2_nivelboss:

inicializa_enemigos_fase3_nivel1:
inicializa_enemigos_fase3_nivel2:
inicializa_enemigos_fase3_nivel3:
inicializa_enemigos_fase3_nivel4:
inicializa_enemigos_fase3_nivel5:
inicializa_enemigos_fase3_nivel6:
inicializa_enemigos_fase3_nivelboss:

inicializa_enemigos_fase4_nivel1:
inicializa_enemigos_fase4_nivel2:
inicializa_enemigos_fase4_nivel3:
inicializa_enemigos_fase4_nivel4:
inicializa_enemigos_fase4_nivel5:
inicializa_enemigos_fase4_nivel6:
inicializa_enemigos_fase4_nivelboss:

inicializa_enemigos_fase5_nivel1:
inicializa_enemigos_fase5_nivel2:
inicializa_enemigos_fase5_nivel3:
inicializa_enemigos_fase5_nivel4:
inicializa_enemigos_fase5_nivel5:
inicializa_enemigos_fase5_nivel6:
inicializa_enemigos_fase5_nivelboss:

inicializa_enemigos_fase6_nivel1:
inicializa_enemigos_fase6_nivel2:
inicializa_enemigos_fase6_nivel3:
inicializa_enemigos_fase6_nivel4:
inicializa_enemigos_fase6_nivel5:
inicializa_enemigos_fase6_nivel6:
inicializa_enemigos_fase6_nivelboss:
