;;=====================================================
;;DEFINICIÓN DE HABITACIONES x NIVEL
;;=====================================================	

; sólo voy a usar 7x7 pero como los arrays son lineales y voy a trabajar con matrices
; me interesa que seande  8x8 aunque sólo trabaje con 7x7

; ojo... la primera linea corresponderá a la primera linea del castillo no a la última

;; definición de estructura de bits
;16 bits por habitación
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

habitacion_actual:
	db  #00,#00		;habitación donde se encuentre el prota. Se mete en una varible par traer todos los datos de golpe y no buscrlos varias veces

habitaciones_juego:
habitaciones_nivel0:
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila
	
habitaciones_nivel1:
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila
	
habitaciones_nivel2:
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila
	
habitaciones_nivel3:
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila
	
habitaciones_nivel4:
	db  00000001b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila
	
habitaciones_nivel5:
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00001010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila
	
habitaciones_nivel6:
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00 ;primera fila
	db  #17,#10,#11,#11,#12,#12,#13,#13,#14,#14,#15,#15,#16,#16,#FF,#00
	db  #20,#20,#21,#21,#22,#22,#23,#23,#24,#24,#25,#25,#26,#26,#FF,#00
	db  #30,#30,#31,#31,#32,#32,#33,#33,#34,#34,#35,#35,#36,#36,#FF,#00
	db  00000000b,#00,00000001b,#01,00001111b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00
	db  #50,#50,#51,#51,#52,#52,#53,#53,#54,#54,#55,#55,#56,#56,#FF,#00
	db  00000000b,#00,00000001b,#01,00000010b,#02,00000011b,#03,00001000b,#04,00001001b,#05,00001100b,#06,#FF,#00	;ultima fila


