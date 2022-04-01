;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

;las posiciones iniciales dependerán de los últimos 3 bits del registro R
;nota: se pone un 0 de más para simplificar el bucle de selección
posiciones_cienpies_x:
		DB			240,100,175,150,200,75,0,125,25
posiciones_cienpies_y:
		DB			 60,72,24,36,108,84,12,96,48
posiciones_arana_x: 	;16 posisiones iniciales posibles
		DB			 0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240
posiciones_serpiente_y:	;16 posisiones iniciales posibles
		DB			80,83,86,89,92,95,98,101,104,107,110,113,116,119,122,125
variacion_murcielagoy:
		DB			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1


enemigo1			DS	ESTRUCTURA_ENEMIGO
enemigo2			DS	ESTRUCTURA_ENEMIGO
enemigo3			DS	ESTRUCTURA_ENEMIGO
enemigo4			DS	ESTRUCTURA_ENEMIGO
enemigo5			DS	ESTRUCTURA_ENEMIGO
enemigo6			DS	ESTRUCTURA_ENEMIGO


;;=====================================================
;;DATOS_ENEMIGOS (EQUIVALE A PLANTILLAS)
;;=====================================================
datos_cienpies:	
			DB		2		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_cienpies	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo

datos_serpiente:
			DB		3		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_serpiente	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo

datos_arana:
			DB		4		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_arana	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo
			
datos_murcielago:
			DB		5		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		MURCIELAGO_LIMIZQ	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		24		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA			;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_murcielago	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo

datos_lobo:
			DB		TIPOLOBO		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		LOBO_LIMIZQ		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		LOBO_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_lobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		LOBO_SPRITE1A	;izq arriba
			DB		LOBO_SPRITE2A	;der_arriba
			DB		LOBO_SPRITE3A	;izq abajo
			DB		LOBO_SPRITE4A	;der_abajo
			
datos_esqueleto:
datos_zombi:
datos_fantasma:
datos_caballerogris:
datos_caballeronegro:
datos_fuego:
datos_magia:

datos_jefelobo:
			DB		TIPOLOBO		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		LOBO_LIMIZQ		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		LOBO_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_lobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		LOBO_SPRITE1A	;izq arriba
			DB		LOBO_SPRITE2A	;der_arriba
			DB		LOBO_SPRITE3A	;izq abajo
			DB		LOBO_SPRITE4A	;der_abajo
			
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
;;RESETEA_ENEMIGOS
;;=====================================================	
; función: 	inicializa todos los enemigos a tipo 0 (muerto) ... incluso los que no van a salir porque se verifican todos
;			también los oculta sacándolos de pantalla (y = 208)
; entrada:	-
; salida: 	-
; toca:		-
resetea_enemigos:
;resetea tipo (no activo)
;y de paso los oculta
;nota: si cuando se matan se ocultan ya no hace falta... hay que estudiarlo porque para enemigos de más de 1 sprite hará falta
		LD			IX, enemigo1
		LD			(IX), INACTIVA ; 0
		LD			IX, enemigo2
		LD			(IX), INACTIVA
		LD			IX, enemigo3
		LD			(IX), INACTIVA
		LD			IX, enemigo4
		LD			(IX), INACTIVA
		LD			IX, enemigo5
		LD			(IX), INACTIVA
		LD			IX, enemigo6
		LD			(IX), INACTIVA
		
		XOR			 A
		LD			 B, 127
		LD			HL, array_sprites
.loop:
		LD			(HL), A
		INC			HL
		DJNZ		.loop
		
		CALL		render_sprites
fin_resetea_enemigos:
		RET


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE X
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase0:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase0_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase0_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase0_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase0_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase0_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase0_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase0_nivel6
fin_inicializa_enemigos_fase0:


		
inicializa_enemigos_fase1:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase1_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase1_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase1_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase1_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase1_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase1_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase1_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase1_nivelboss
fin_inicializa_enemigos_fase1:
		RET
		
inicializa_enemigos_fase2:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase2_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase2_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase2_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase2_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase2_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase2_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase2_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase2_nivelboss
fin_inicializa_enemigos_fase2:
		RET

inicializa_enemigos_fase3:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase3_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase3_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase3_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase3_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase3_nivel4
		RET
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase3_nivel5
		RET
.nivel6:
		CALL		inicializa_enemigos_fase3_nivel6
		JP			fin_inicializa_enemigos_fase1
fin_inicializa_enemigos_fase3:
		
		
inicializa_enemigos_fase4:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase4_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase4_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase4_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase4_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase4_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase4_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase4_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase3_nivelboss
fin_inicializa_enemigos_fase4:
		RET

inicializa_enemigos_fase5:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase5_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase5_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase5_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase5_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase5_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase5_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase5_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase5_nivelboss
fin_inicializa_enemigos_fase5:
		RET

inicializa_enemigos_fase6:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase6_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase6_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase6_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase6_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase6_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase6_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase6_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase6_nivelboss
fin_inicializa_enemigos_fase6:
		RET

;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE0_NIVELX
;;=====================================================	
inicializa_enemigos_fase0_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel0:

inicializa_enemigos_fase0_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		JP			actualiza_valores_arana
fin_inicializa_enemigos_fase0_nivel1:

inicializa_enemigos_fase0_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo3
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase0_nivel2:

inicializa_enemigos_fase0_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase0_nivel3:

inicializa_enemigos_fase0_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo		
fin_inicializa_enemigos_fase0_nivel4:

inicializa_enemigos_fase0_nivel5:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo3
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo3
		CALL		actualiza_valores_cienpies

		LD			DE, enemigo4
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo4
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo5
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo5
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo6
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo6
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel5:

inicializa_enemigos_fase0_nivel6:
		LD			DE, enemigo1
		CALL		anade_enemigo_jefelobo
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel6:




;;=====================================================
;;ANADE_ENEMIGO_CIENPIES/ARANA/SERPIENTE/MURCIELAGO/LOBO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del cienpies en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_cienpies:
		LD			HL, datos_cienpies
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_cienpies:
		RET

anade_enemigo_arana:
		LD			HL, datos_arana
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_arana:
		RET

anade_enemigo_serpiente:
		LD			HL, datos_serpiente
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_serpiente:
		RET
		
anade_enemigo_murcielago:
		LD			HL, datos_murcielago
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_murcielago:
		RET

anade_enemigo_lobo:
		LD			HL, datos_lobo
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_lobo:
		RET

anade_enemigo_jefelobo:
		LD			HL, datos_jefelobo
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefelobo:
		RET

;;=====================================================
;;ACTUALIZA_VALORES_CIENPIES
;;=====================================================	
; función: 	inicializa valores aleatorios del cienpies
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1), posiciones_iniciales_cienpies_x, posiciones_iniciales_cienpies_y
; salida: 	posicion_anterior_cienpies
; toca:		-
actualiza_valores_cienpies:
;actualiza_valores_aleatorios_cienpies
		EXX
.calcula_posicion:
		;calcula posición de 0 a 8 porque es el primer cienpies
		LD			 A, R
		AND			00000111b
		LD			 B, A ; dejo un copia en B del valor de A 
		
.asigna_valores_posicion_x:
		LD			HL, posiciones_cienpies_x
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

.asigna_valores_posicion_y:
		LD			 A, B
		LD			HL, posiciones_cienpies_y
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

		EXX
fin_actualiza_valores_cienpies:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_ARANA
;;=====================================================	
; función: 	inicializa valores aleatorios de la arana
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1), posiciones_iniciales_arana_x
; salida: 	posicion_anterior_cienpies
; toca:		-
actualiza_valores_arana:
		EXX
;actualiza_valores_aleatorios_arana
.calcula_posicion:
		;calcula posición de 0 a 16
		LD			 A, R
		AND			00001111b
		LD			 B, A ; dejo un copia en B del valor de A 
		
.asigna_valores_posicion_x:
		LD			HL, posiciones_arana_x
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
.asigna_valores_posicion_y:		
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), LIMITEPANTALLASUP

		EXX
fin_actualiza_valores_arana:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_SERPIENTE
;;=====================================================	
; función: 	inicializa valores aleatorios de la serpiente
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1), posiciones_iniciales_serpiente_y
; salida: 	posicion_anterior_cienpies
; toca:		-
actualiza_valores_serpiente:
		EXX
;actualiza_valores_aleatorios_serpiente
.calcula_posicion:
.asigna_valores_posicion_x:		
		;calcula posición inicial sumando a su líete izq un offset
		LD			 A, R
		AND			00011111b
		LD			 B, A ; dejo un copia en B del valor de A 
		LD			 A, SERPIENTE_LIMIZQ
		ADD			 B
		
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), SERPIENTE_POSY

		EXX
fin_actualiza_valores_serpiente:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_LOBO
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1), posiciones_iniciales_serpiente_y
; salida: 	posicion_anterior_cienpies
; toca:		-
actualiza_valores_lobo:
		EXX
;actualiza_valores_aleatorios_serpiente
.calcula_posicion:
.asigna_valores_posicion_x:		
		;calcula posición inicial sumando a su líete izq un offset
		LD			 A, R
		AND			00111111b
		ADD			LOBO_LIMIZQ
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), LOBO_POSY
		
.asigna_valores_sprite_inicial:		
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE1A

		EXX
fin_actualiza_valores_lobo:
		RET


;;=====================================================
;;MOVER_CIENPIES
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_cienpies:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
.cambiando_posx:		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A

		
		CALL		calcula_cienpies_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A		
		LD			(IY + 3), CIENPIES_COLOR
fin_mover_cienpies:
		RET

calcula_cienpies_escena:
		LD			 A, (heartbeat)
		OR			00000001b
		RET			 Z	   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, CIENPIES_SPRITE1A			
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, CIENPIES_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
.fin_cambia_escena_enemigo1:							; END IF	
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_cienpies_escena:
		RET


;;=====================================================
;;MOVER_ARANA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_arana:
		CALL		calcula_arana_incrementoy		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		
		CALL		calcula_arana_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A		
		
		LD			(IY + 3), ARANA_COLOR
fin_mover_arana:
		RET

calcula_arana_escena:
		LD			 A, (heartbeat)
		OR			00000001b
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, ARANA_SPRITE1A			
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, ARANA_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
.fin_cambia_escena_enemigo1:							; END IF			
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_arana_escena:
		RET

calcula_arana_incrementoy:
		;SI DIRECCION = ABAJO
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccion)
		OR			 A
		JP			 Z, .arana_baja
.arana_sube:
		;DECREMENTA Y => ARANA SUBE
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		;SI Y = LIMITE SUPERIOR = 0 = LIMITEPANTALLASUP
		OR			 A
		RET			NZ
		;DIRECCION = ABAJO
			LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRABAJO
		;FIN SI
		RET
;SINO
.arana_baja:
		;INCREMENTA Y => ARANA BAJA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		;SI Y = LIMITE INFERIOR
		OR			 A
		CP			LIMITEPANTALLAINF
		RET			NZ
		;DIRECCION = ARRIBA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRARRIBA
	;FIN SI
;FIN SI
fin_calcula_arana_incrementoy:
		RET



;;=====================================================
;;MOVER_SERPIENTE
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: E (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_serpiente:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		CALL		calcula_serpiente_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		
		CALL		calcula_serpiente_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)

		LD			(IY + 2), A		
		LD			(IY + 3), SERPIENTE_COLOR
fin_mover_serpiente:
		RET

calcula_serpiente_incrementox:
;SI DIRECCION = DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccion)
		OR			 A
		JP			 Z, .serpiente_derecha
.serpiente_izquierda:
		;DECREMENTA X => ARANA IZQUIERDA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI X = SERPIENTE_LIMIZQ 
		CP			SERPIENTE_LIMIZQ
		RET			NZ
		;DIRECCION = DERECHA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRDERECHA
		;FIN SI
		RET
;SINO
.serpiente_derecha:
		;INCREMENTA X => ARANA DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI Y = SERPIENTE_LIMDER
		CP			SERPIENTE_LIMDER
		RET			NZ
		;DIRECCION = IZQUIERDA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRIZQUIERDA
	;FIN SI
;FIN SI
fin_calcula_serpiente_incrementox:
		RET
		
calcula_serpiente_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z
			
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccion)
		OR			 A
		JP			 Z, .direccion_derecha
.direccion_izquierda:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_izquierda2
.escena_izquierda1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE1B
			RET
.escena_izquierda2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE2B
			RET
			
.direccion_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE1A
			RET
.escena_derecha2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE2A
			RET
fin_calcula_serpiente_escena:


;;=====================================================
;;ACTUALIZA_VALORES_MURCIELAGO
;;=====================================================	
; función: 	inicializa valores aleatorios de la serpiente
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1), posiciones_iniciales_serpiente_y
; salida: 	posicion_anterior_cienpies
; toca:		-
actualiza_valores_murcielago:
		EXX
;actualiza_valores_aleatorios_serpiente
.calcula_posicion:
		EXX
		
.asigna_valores_posicion_x:
		LD			 A, R
		AND			01111111b
		ADD			MURCIELAGO_LIMIZQ
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), MURCIELAGO_HORIZON
		
		EXX
fin_actualiza_valores_murcielago:
		RET


;=====================================================
;;MOVER_MURCIELAGO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_murcielago:
		CALL		calcula_murcielago_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A

		CALL		calcula_murcielago_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		CALL		calcula_murcielago_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		
		LD			(IY + 3), MURCIELAGO_COLOR
fin_mover_murcielago:
		RET

calcula_murcielago_incrementox:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccion)
		OR			 A
		JP			 Z, .mueve_derecha
.mueve_izquierda:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
			DEC			 A
			JP			.fin_mueve
.mueve_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
			INC			 A
.fin_mueve:		
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

		CP			MURCIELAGO_LIMIZQ
		JP			NZ, .no_gira_derecha
		LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRDERECHA
.no_gira_derecha:

		CP			MURCIELAGO_LIMDER
		JP			NZ, .no_gira_izquierda
		LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRIZQUIERDA
.no_gira_izquierda:
fin_calcula_murcielago_incrementox:
		RET

calcula_murcielago_incrementoy:
		LD			HL, variacion_murcielagoy
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		AND			00011111b
		CALL		suma_A_HL
		
		LD			 B, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			 A, (HL)
		ADD			 B
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
fin_calcula_murcielago_incrementoy:
		RET

calcula_murcielago_escena:
		LD			 A, (heartbeat)
		OR			00000001b
		JP			 Z, .fin_cambia_escena_enemigo1   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, MURCIELAGO_SPRITE1A
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, MURCIELAGO_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
.fin_cambia_escena_enemigo1:							; END IF	
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_murcielago_escena:
		RET


;;=====================================================
;;MOVER_LOBO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_lobo:	
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		CALL		calcula_lobo_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		CALL		calcula_lobo_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		LD			(IY + 3), LOBO_COLOR
		LD			(IY + 7), LOBO_COLOR
fin_mover_lobo:
		RET

calcula_lobo_incrementox:
;SI DIRECCION = DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccion)
		OR			 A
		JP			 Z, .lobo_derecha
.lobo_izquierda:
		;DECREMENTA X => LOBO IZQUIERDA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI X = LOBO_LIMIZQ 
		CP			LOBO_LIMIZQ
			RET			NZ
		;DIRECCION = DERECHA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRDERECHA
		;FIN SI
		RET
;SINO
.lobo_derecha:
		;INCREMENTA X => LOBO DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI Y = SERPIENTE_LIMDER
		CP			LOBO_LIMDER
			RET			NZ
		;DIRECCION = LOBO
			LD			(IX + ESTRUCTURA_ENEMIGO.direccion), DIRIZQUIERDA
	;FIN SI
;FIN SI
fin_calcula_lobo_incrementox:
		RET
		
calcula_lobo_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z
			
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccion)
		OR			 A
		JP			 Z, .direccion_derecha
.direccion_izquierda:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_izquierda2
.escena_izquierda1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE1B
			RET
.escena_izquierda2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE3B
			RET
			
.direccion_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE1A
			RET
.escena_derecha2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE3A
			RET
fin_calcula_lobo_escena:
		RET


inicializa_enemigos_fase1_nivel0:
inicializa_enemigos_fase1_nivel1:
inicializa_enemigos_fase1_nivel2:
inicializa_enemigos_fase1_nivel3:
inicializa_enemigos_fase1_nivel4:
inicializa_enemigos_fase1_nivel5:
inicializa_enemigos_fase1_nivel6:
inicializa_enemigos_fase1_nivelboss:

inicializa_enemigos_fase2_nivel0:
inicializa_enemigos_fase2_nivel1:
inicializa_enemigos_fase2_nivel2:
inicializa_enemigos_fase2_nivel3:
inicializa_enemigos_fase2_nivel4:
inicializa_enemigos_fase2_nivel5:
inicializa_enemigos_fase2_nivel6:
inicializa_enemigos_fase2_nivelboss:

inicializa_enemigos_fase3_nivel0:
inicializa_enemigos_fase3_nivel1:
inicializa_enemigos_fase3_nivel2:
inicializa_enemigos_fase3_nivel3:
inicializa_enemigos_fase3_nivel4:
inicializa_enemigos_fase3_nivel5:
inicializa_enemigos_fase3_nivel6:
inicializa_enemigos_fase3_nivelboss:

inicializa_enemigos_fase4_nivel0:
inicializa_enemigos_fase4_nivel1:
inicializa_enemigos_fase4_nivel2:
inicializa_enemigos_fase4_nivel3:
inicializa_enemigos_fase4_nivel4:
inicializa_enemigos_fase4_nivel5:
inicializa_enemigos_fase4_nivel6:
inicializa_enemigos_fase4_nivelboss:

inicializa_enemigos_fase5_nivel0:
inicializa_enemigos_fase5_nivel1:
inicializa_enemigos_fase5_nivel2:
inicializa_enemigos_fase5_nivel3:
inicializa_enemigos_fase5_nivel4:
inicializa_enemigos_fase5_nivel5:
inicializa_enemigos_fase5_nivel6:
inicializa_enemigos_fase5_nivelboss:

inicializa_enemigos_fase6_nivel0:
inicializa_enemigos_fase6_nivel1:
inicializa_enemigos_fase6_nivel2:
inicializa_enemigos_fase6_nivel3:
inicializa_enemigos_fase6_nivel4:
inicializa_enemigos_fase6_nivel5:
inicializa_enemigos_fase6_nivel6:
inicializa_enemigos_fase6_nivelboss:






check_enemigos_fase0: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem

		CALL		mover_cienpies

		;acciones enemigos
		
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4

		CALL		mover_arana

		;acciones enemigos

.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8

		CALL		mover_serpiente

		;acciones enemigos

.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 12

		CALL		mover_murcielago

		;acciones enemigos
		
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 16

		CALL		mover_lobo

		;acciones enemigos
.check_enemigo6:
		;~ LD			IX, enemigo6
		;~ LD			 A, (IX)
		;~ OR			 A
		;~ JP			 Z, .check_enemigo7
		
		;~ LD			IY, array_sprites_enem + 24

		;~ CALL		mover_cienpies

		;acciones enemigos
.check_enemigo7:
		;~ LD			IX, enemigo7
		;~ LD			 A, (IX)
		;~ OR			 A
		;~ JP			 Z, .check_enemigo8
		
		;~ LD			IY, array_sprites_enem + 24

		;~ CALL		mover_cienpies

		;acciones enemigos
.check_enemigo8:
		;~ LD			IX, enemigo8
		;~ LD			 A, (IX)
		;~ OR			 A
		;~ JP			 Z, .check_enemigo9
		
		;~ LD			IY, array_sprites_enem + 28

		;~ CALL		mover_cienpies

		;acciones enemigos
.check_enemigo9:
fin_check_enemigos_fase0:
		RET			





