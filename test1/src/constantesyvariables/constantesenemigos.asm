;;=====================================================
;; FICHERO constantesenemigos.asm
;;=====================================================

;;GENERAL
INACTIVA				equ		0
ACTIVA					equ		1
OCULTA					equ		209
DIRABAJO				equ		0
DIRDERECHA				equ		0
DIRARRIBA				equ		1
DIRIZQUIERDA			equ		1
LIMITEPANTALLASUP		equ		0
LIMITEPANTALLAINF		equ		112
LIMITEPANTALLAIZQ		equ		0
LIMITEPANTALLADER		equ		240

;;ETIQUETAS/CONSTANTES CIENPIES
TIPOCIEMPIES			equ		2
CIENPIES_COLOR			equ		#000C	;12 - VERDE OSCURO
CIENPIES_SPRITE1A		equ		#0018	;24
CIENPIES_SPRITE1B		equ		#001C	;28
CIENPIES_VELESCENA		equ		00010000b

;;ETIQUETAS/CONSTANTES ARANA
TIPOARANA				equ		4
ARANA_COLOR				equ		1;#0005	;5 - CYAN
ARANA_SPRITE1A			equ		#0030	;48
ARANA_SPRITE2A			equ		#0034	;52
ARANA_VELESCENA			equ		00010000b

;;ETIQUETAS/CONSTANTES SERPIENTE
TIPOSERPIENTE			equ		3
SERPIENTE_COLOR			equ		#000C	;12 - VERDE OSCURO
SERPIENTE_SPRITE1A		equ		#0020	;32
SERPIENTE_SPRITE2A		equ		#0024	;36
SERPIENTE_SPRITE1B		equ		#0028	;40
SERPIENTE_SPRITE2B		equ		#002C	;44
SERPIENTE_POSY			equ		#0048	;72
SERPIENTE_POSX			equ		40
SERPIENTE_PASOS			equ		160
SERPIENTE_LIMIZQ		equ		#0028	;40
SERPIENTE_LIMDER		equ		#00C8	;200
SERPIENTE_VELESCENA		equ		00010000b

;;ETIQUETAS/CONSTANTES MURCIELAGO
TIPOMURCIELAGO			equ		5
MURCIELAGO_COLOR		equ		#0001	;1 - NEGRO
MURCIELAGO_SPRITE1A		equ		#0038	;56
MURCIELAGO_SPRITE1B		equ		#003C	;60
MURCIELAGO_LIMIZQ		equ		#0020	;16
MURCIELAGO_LIMDER		equ		#00DE	;232
MURCIELAGO_HORIZON		equ		#0018	;24
MURCIELAGO_PASOS  		equ		192
MURCIELAGO_VELESCENA 	equ	00010000b

;;ETIQUETAS/CONSTANTES LOBO
TIPOLOBO				equ		6
LOBO_COLOR				equ		#01		;1 - NEGRO
LOBO_SPRITE1A			equ		64
LOBO_SPRITE2A			equ		68
LOBO_SPRITE3A			equ		72
LOBO_SPRITE4A			equ		76
LOBO_SPRITE1B			equ		80
LOBO_SPRITE2B			equ		84
LOBO_SPRITE3B			equ		88
LOBO_SPRITE4B			equ		92
LOBO_POSX				equ		8
LOBO_PASOS				equ		208
LOBO_POSY				equ		95
LOBO_VELESCENA 			equ		00010000b

;;ETIQUETAS/CONSTANTES JEFELOBO
TIPOJEFELOBO			equ		14
JEFELOBO_COLOR			equ		#01		;1 - NEGRO
JEFELOBO_LIM_PASOS1 	equ		205
JEFELOBO_LIM_PASOS2 	equ		40
JEFELOBO_LIM_PASOS3 	equ		117
JEFELOBO_LIM_PASOS4 	equ		40
JEFELOBO_X				equ		8
JEFELOBO_Y				equ		92
JEFELOBO_SPRITE1A		equ		192
JEFELOBO_SPRITE2A		equ		196
JEFELOBO_SPRITE3A		equ		200
JEFELOBO_SPRITE4A		equ		204
JEFELOBO_SPRITE1B		equ		208
JEFELOBO_SPRITE2B		equ		212
JEFELOBO_SPRITE3B		equ		216
JEFELOBO_SPRITE4B		equ		220
JEFELOBO_SPRITE1C		equ		224
JEFELOBO_SPRITE2C		equ		228
JEFELOBO_SPRITE3C		equ		232
JEFELOBO_SPRITE4C		equ		236
JEFELOBO_SPRITE1D		equ		240
JEFELOBO_SPRITE2D		equ		244
JEFELOBO_SPRITE3D		equ		248
JEFELOBO_SPRITE4D		equ		252
JEFELOBO_VELESCENA 		equ		00010000b

;;ETIQUETAS/CONSTANTES ESQUELETO
TIPOESQUELETO			equ		7
ESQUELETO_COLOR			equ		15		;15 - BLANCO
ESQUELETO_SPRITE1A		equ		96
ESQUELETO_SPRITE2A		equ		100
ESQUELETO_SPRITE3A		equ		104
ESQUELETO_SPRITE4A		equ		108
ESQUELETO_SPRITE1B		equ		112
ESQUELETO_SPRITE2B		equ		116
ESQUELETO_SPRITE3B		equ		120
ESQUELETO_SPRITE4B		equ		124
ESQUELETO_POSX			equ		0
ESQUELETO_POSY			equ		96
ESQUELETO_VELESCENA 	equ		00010000b

;;ETIQUETAS/CONSTANTES ZOMBI
TIPOZOMBI				equ		8
ZOMBI_COLOR_A			equ		15		;15 - BLANCO
ZOMBI_COLOR_B			equ		15		;15 - BLANCO
ZOMBI_SPRITE1A			equ		128
ZOMBI_SPRITE2A			equ		132
ZOMBI_SPRITE3A			equ		136
ZOMBI_SPRITE4A			equ		140
ZOMBI_SPRITE1B			equ		144
ZOMBI_SPRITE2B			equ		148
ZOMBI_SPRITE3B			equ		152
ZOMBI_SPRITE4B			equ		156
ZOMBI_LIMX_DER			equ		216
ZOMBI_LIMX_IZQ			equ		32
ZOMBI_POSX				equ		72
ZOMBI_POSY				equ		64
ZOMBI_PASOS				equ		150
ZOMBI_VELESCENA			equ		00010000b

;;ETIQUETAS/CONSTANTES JEFEMURCIELAGO
TIPOJEFEMURCIELAGO		equ		15
JEFEMURCIELAGO_COLOR	equ		#01		;1 - NEGRO
JEFEMURCIELAGO_LIMIARR	equ		0
JEFEMURCIELAGO_LIMIABA	equ		96
JEFEMURCIELAGO_SPRITE1A	equ		224
JEFEMURCIELAGO_SPRITE2A	equ		228
JEFEMURCIELAGO_SPRITE3A	equ		232
JEFEMURCIELAGO_SPRITE4A	equ		236
JEFEMURCIELAGO_SPRITE1B	equ		240
JEFEMURCIELAGO_SPRITE2B	equ		244
JEFEMURCIELAGO_SPRITE3B	equ		248
JEFEMURCIELAGO_SPRITE4B	equ		252
JEFEMURCIELAGO_VELESCENA equ	00010000b

;;ETIQUETAS/CONSTANTES FANTASMA
TIPOFANTASMA			equ		9
FANTASMA_COLOR			equ		1		;15 - BLANCO
FANTASMA_SPRITE1A		equ		160
FANTASMA_SPRITE2A		equ		164
FANTASMA_SPRITE1B		equ		168
FANTASMA_SPRITE2B		equ		172
FANTASMA_LIM_PASOS 		equ		100
FANTASMA_X1				equ		64
FANTASMA_Y1				equ		24
FANTASMA_X2				equ		160
FANTASMA_Y2				equ		24
FANTASMA_X3				equ		40
FANTASMA_Y3				equ		64
FANTASMA_X4				equ		184
FANTASMA_Y4				equ		64
FANTASMA_VELESCENA		equ		00010000b

;;ETIQUETAS/CONSTANTES JEFEFANTASMA
TIPOJEFEFANTASMA		equ		16
JEFEFANTASMA_COLOR		equ		1		;15 - BLANCO
JEFEFANTASMA_SPRITE1A	equ		224
JEFEFANTASMA_SPRITE2A	equ		228
JEFEFANTASMA_SPRITE3A	equ		232
JEFEFANTASMA_SPRITE4A	equ		236
JEFEFANTASMA_SPRITE1B	equ		240
JEFEFANTASMA_SPRITE2B	equ		244
JEFEFANTASMA_SPRITE3B	equ		248
JEFEFANTASMA_SPRITE4B	equ		252
JEFEFANTASMA_LIM_PASOS  equ		100
JEFEFANTASMA_X1			equ		8
JEFEFANTASMA_Y1			equ		8
JEFEFANTASMA_X2			equ		104
JEFEFANTASMA_Y2			equ		8
JEFEFANTASMA_X3			equ		224
JEFEFANTASMA_Y3			equ		16
JEFEFANTASMA_X4			equ		24
JEFEFANTASMA_Y4			equ		48
JEFEFANTASMA_X5			equ		168
JEFEFANTASMA_Y5			equ		24
JEFEFANTASMA_X6			equ		192
JEFEFANTASMA_Y6			equ		88
JEFEFANTASMA_X7			equ		128
JEFEFANTASMA_Y7			equ		72
JEFEFANTASMA_X8			equ		64
JEFEFANTASMA_Y8			equ		88
JEFEFANTASMA_VELESCENA	equ		00010000b

;;ETIQUETAS/CONSTANTES CABALLEROG
TIPOCABALLEROGRIS		equ		10
CABALLERO_COLOR			equ		1		;15 - BLANCO
CABALLERO_SPRITE1A		equ		64
CABALLERO_SPRITE2A		equ		68
CABALLERO_SPRITE3A		equ		72
CABALLERO_SPRITE4A		equ		76
CABALLERO_SPRITE1B		equ		80
CABALLERO_SPRITE2B		equ		84
CABALLERO_SPRITE3B		equ		88
CABALLERO_SPRITE4B		equ		92
CABALLERO_POSYINI		equ		48
CABALLERO_POSXINI		equ		192
CABALLERO_PASOS  		equ		144
CABALLERO_VELESCENA		equ		00010000b

;;ETIQUETAS/CONSTANTES ZOMBI
TIPOJEFEZOMBI			equ		17
JEFEZOMBI_COLOR_A		equ		1		;15 - BLANCO
JEFEZOMBI_COLOR_B		equ		1		;15 - BLANCO
JEFEZOMBI_COLOR_C		equ		1		;15 - BLANCO
JEFEZOMBI_COLOR_D		equ		1		;15 - BLANCO
JEFEZOMBI_SPRITE1A		equ		192
JEFEZOMBI_SPRITE2A		equ		196
JEFEZOMBI_SPRITE3A		equ		200
JEFEZOMBI_SPRITE4A		equ		204
JEFEZOMBI_SPRITE1B		equ		208
JEFEZOMBI_SPRITE2B		equ		212
JEFEZOMBI_SPRITE3B		equ		216
JEFEZOMBI_SPRITE4B		equ		220
JEFEZOMBI_SPRITE1C		equ		224
JEFEZOMBI_SPRITE2C		equ		228
JEFEZOMBI_SPRITE3C		equ		232
JEFEZOMBI_SPRITE4C		equ		236
JEFEZOMBI_SPRITE1D		equ		240
JEFEZOMBI_SPRITE2D		equ		244
JEFEZOMBI_SPRITE3D		equ		248
JEFEZOMBI_SPRITE4D		equ		252
JEFEZOMBI_LIMX_DER		equ		216
JEFEZOMBI_LIMX_IZQ		equ		32
JEFEZOMBI_POSX			equ		200
JEFEZOMBI_POSY			equ		64
JEFEZOMBI_PASOS			equ		150
JEFEZOMBI_VELESCENA		equ		00010000b

;;ETIQUETAS/CONSTANTES FUEGO
TIPOFUEGO				equ		12
FUEGO_COLOR1			equ		1		;15 - BLANCO
FUEGO_COLOR2			equ		1		;15 - BLANCO
FUEGO_PASOSX			equ		208
FUEGO_PASOSY			equ		64
FUEGO_SPRITE1A			equ		176
FUEGO_SPRITE2A			equ		180
FUEGO_SPRITE1B			equ		184
FUEGO_SPRITE2B			equ		188
FUEGO_POS1X				equ		15
FUEGO_POS1Y				equ		15
FUEGO_POS2X				equ		223
FUEGO_POS2Y				equ		15
FUEGO_POS3X				equ		223
FUEGO_POS3Y				equ		79
FUEGO_POS4X				equ		15
FUEGO_POS4Y				equ		79
FUEGO_VELESCENA			equ		000100000b

;;ETIQUETAS/CONSTANTES JEFECABALLERO
TIPOJEFECABALLERO		equ		18
JCABALLERO_COLOR		equ		1		;15 - BLANCO
JCABALLERO_SPRITE1A		equ		192
JCABALLERO_SPRITE2A		equ		196
JCABALLERO_SPRITE3A		equ		200
JCABALLERO_SPRITE4A		equ		204
JCABALLERO_SPRITE1B		equ		208
JCABALLERO_SPRITE2B		equ		212
JCABALLERO_SPRITE3B		equ		216
JCABALLERO_SPRITE4B		equ		220
JCABALLERO_SPRITE1C		equ		224
JCABALLERO_SPRITE2C		equ		228
JCABALLERO_SPRITE3C		equ		232
JCABALLERO_SPRITE4C		equ		236
JCABALLERO_SPRITE1D		equ		240
JCABALLERO_SPRITE2D		equ		244
JCABALLERO_SPRITE3D		equ		248
JCABALLERO_SPRITE4D		equ		252
JCABALLERO_POSYINI		equ		48
JCABALLERO_POSXINI		equ		192
JCABALLERO_PASOS  		equ		182
JCABALLERO_VELESCENA 	equ		00010000b

;;ETIQUETAS/CONSTANTES MAGIA
TIPOMAGIA				equ		13
MAGIA_COLOR				equ		1		;15 - BLANCO
MAGIA_SPRITE1A			equ		32
MAGIA_SPRITE1B			equ		36
MAGIA_SPRITE2A			equ		40
MAGIA_SPRITE2B			equ		44
MAGIA_PASOS				equ		35
MAGIA_POSX				equ		64
MAGIA_POSY				equ		55
MAGIA_INCREMENTO		equ		5
MAGIA_VELESCENA			equ		00010000b

;;ETIQUETAS/CONSTANTES JEFEBEHOLDER
TIPOJEFEBEHOLDER		equ		19
JEFEBEHOLDER_COLOR		equ		1		;15 - BLANCO
JEFEBEHOLDER_SPRITE1A	equ		224
JEFEBEHOLDER_SPRITE2A	equ		228
JEFEBEHOLDER_SPRITE3A	equ		232
JEFEBEHOLDER_SPRITE4A	equ		236
JEFEBEHOLDER_SPRITE1B	equ		240
JEFEBEHOLDER_SPRITE2B	equ		244
JEFEBEHOLDER_SPRITE3B	equ		248
JEFEBEHOLDER_SPRITE4B	equ		252
JEFEBEHOLDER_PASOS		equ		55 ; PROBAR CON 56
JEFEBEHOLDER_POSX		equ		64
JEFEBEHOLDER_POSY		equ		55
JEFEBEHOLDER_INCREMENTO	equ		3
JEFEBEHOLDER_VELESCENA	equ		00010000b

;;ETIQUETAS/CONSTANTES DRACULA
TIPODRACULA				equ		22
DRACULA_COLOR  	 		equ		1		; negro
DRACULA_PASOS			equ		100
DRACULA_Y				equ		64
DRACULA_X1				equ		47
DRACULA_X2				equ		95
DRACULA_X3				equ		143
DRACULA_X4				equ		191
DRACULA_SPRITE1A		equ		240
DRACULA_SPRITE1B		equ		244
DRACULA_SPRITE2A		equ		248
DRACULA_SPRITE2B		equ		252
DRACULA_VELESCENA		equ		00010000b

;;ETIQUETAS/CONSTANTES MANOIZQIERDA
TIPOMANOIZQUIERDA		equ		21
MANOI_COLOR   			equ		1		; negro
MANOI_SPRITE1A			equ		224
MANOI_SPRITE1B			equ		228
MANOI_PASOS				equ		35
MANOI_POSY				equ		64
MANOI_POSX				equ		47
MANOI_INCREMENTO		equ		5
MANOI_VELESCENA			equ		00010000b

;;ETIQUETAS/CONSTANTES MANODERECHA
TIPOMANODERECHA			equ		20
MANOD_COLOR   			equ		1		; negro
MANOD_SPRITE1A			equ		232
MANOD_SPRITE1B			equ		236
MANOD_PASOS				equ		35
MANOD_POSY				equ		64
MANOD_POSX				equ		47
MANOD_INCREMENTO		equ		5
MANOD_VELESCENA			equ		00010000b

