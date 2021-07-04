;;=====================================================
;;DEFINICIÓN DE HABITACIONES x NIVEL
;;=====================================================	

; sólo voy a usar 7x7 pero como los arrays son lineales y voy a trabajar con matrices
; me interesa que seande  8x8 aunque sólo trabaje con 7x7

; ojo... la primera linea corresponderá a la primera linea del castillo no a la última

;; definición de estructura de bits
;Tipo DB pero serán 2 bytes por habitación byte primero (habitaciones etc) + byte 2º. Los bytes 15 y 16 se usan para información extra
;los 7 primeros bits del byte 15 indican si se ha pasado/limpiado una habitación o no
;~ 0 - lleno o vacío (si ya se ha pasado)
;~ 0000 - nº puertas 1 arriba 1 derecha 1 abajo 1 izquierda
;~ 1 - hay reliquia?
;~ 1 - hay vida extra
;~ 1 - hay arma extra (durará 6 pantallas - sonido distinto)
;~ 1 - hay energía? (sobran bits ... se puede usar otro como carga energía +)
;~ 1 - es pantalla de mostruo fin de fase?
;~ 1 - es pantalla inicial (equivaldría a la puerta de un castillo)?
;~ 1 - es pantalla final?


;importante: el byte de la columna 15 indicará con 1 y 0 habitaciones por las que se haya pasado
;cuando se inicie la partida todos se pondrán a 0


habitaciones_juego:
habitaciones_nivel1:
;---------------------------------* habitación inicial
	db  #00,#00,#00,#00,#00,#00,#03,#00,#00,#00,#00,#00,#00,#00,#FF,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#FF,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#FF,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#FF,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#FF,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#FF,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#FF,#00	;ultima fila
	
habitaciones_nivel2:
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00	;ultima fila
	
habitaciones_nivel3:
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00	;ultima fila
	
habitaciones_nivel4:
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00	;ultima fila
	
habitaciones_nivel5:
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00	;ultima fila
	
habitaciones_nivel6:
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00	;ultima fila
	
habitaciones_nivel7:
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00 ;primera fila
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
	db  #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00	;ultima fila


