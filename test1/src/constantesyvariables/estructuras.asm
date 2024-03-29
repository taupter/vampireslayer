;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================
	STRUCT ESTRUCTURA_PUNTOMIRA
posx			DB		POSXPM
posy			DB		POSYPM
escena			DB		0	;valores porsibles 0 (blanco+rojo en punto de mira) y NEG 0 (al revés)
velocidad		DB		0
cadencia		DB		0	;velocidad de disparo si botón pulsado
spritea			DB		0	;valor en pos de memoria del sprite grande del punto de mira
spriteb			DB		0 	;valor en pos de memoria del sprite pequeño del punto de mira
	ENDSTRUCT;ESTRUCTURA_PUNTOMIRA
	

	STRUCT ESTRUCTURA_AYUDA	
activa				DB		0	;0 no activa <>0 activo (y muestra tiles ayudaoff)
posx				DB		0	;punto x de la ayuda para cuando se dispare encima
posy				DB		112	;punto y de la ayuda para cuando se dispare encima
radiox				DB		0	;radio x de la ayuda para cuando se dispare encima
radioy				DB		0	;radio y de la ayuda para cuando se dispare encima
accion				DW		0	;función para acción de cada tipo de ayuda
tiles_ayudaon		DW		0	;puntero al array con los tiles de las ayudas sin usar para wordaux2
tiles_ayudaoff		DW		0	;puntero al array con los tiles de las ayudas sin usar para wordaux2
pos_en_tilemap		DW		0	;calcula posición en tilemap para wordaux1
alto				DB		2	;alto en tiles del dibujo de la puerta (filas)
ancho				DB		2	;ancho en tiles del dibujo de la puerta (columnas)
	ENDSTRUCT;ESTRUCTURA_PUERTA


	STRUCT ESTRUCTURA_PUERTA	;también servirá para la escalera
activa				DB		0	;0 no activa <>0 activo
posx				DB		0	;punto x de la puerta para cuando se dispare encima
posy				DB		0	;punto y de la puerta para cuando se dispare encima
radiox				DB		0	;radio x de la puerta para cuando se dispare encima
radioy				DB		0	;radio y de la puerta para cuando se dispare encima
accion				DW		0	;función para acción de cada tipo de puerta
tiles_puerta		DW		0	;puntero al array con los tiles de las puertas para wordaux2
pos_en_tilemap		DW		0	;calcula posición en tilemap para wordaux1
alto				DB		0	;alto en tiles del dibujo de la puerta (filas)
ancho				DB		0	;ancho en tiles del dibujo de la puerta (columnas)
	ENDSTRUCT;ESTRUCTURA_PUERTA


;Tipo:
;	0  - inactivo
;	1  - muerto (se pone daño 0 y vida: el tiempo para desaparecer)
;	2  - ciempiés
;	3  - serpiente
;	4  - araña
;	5  - murciélago
;	6  - lobo
;	7  - esqueleto
;	8  - zombi
;	9  - fantasma
;	10 - caballero gris
;	11 - caballero negro
;	12 - fuego
;	13 - magia
;	14 - jefe lobo gigante
;	15 - jefe murciélago gigante
;	16 - jefe fantasma gigante
;	17 - jefe zombie gigante
;	18 - jefe caballero
;	19 - jefe beholder
;	20 - mano derecha conde drácula
;	21 - izquierda conde drácula
;	22 - conde drácula
;
;Sprites que usa (16x16):
;	2  - ciempiés: 1
;	3  - serpiente: 1
;	4  - araña: 1
;	5  - murciélago: 1
;	6  - lobo: 2 (horz)
;	7  - esqueleto: 2 (vert)
;	8  - zombi: 2 (vert)
;	9  - fantasma: 2 (horz)
;	10 - caballero gris: 2 (vert)
;	11 - caballero negro: 2 (vert)
;	12 - fuego: 2 (vert)
;	13 - magia: 2 (horz)
;	14 - jefe lobo gigante: 4
;	15 - jefe murciélago gigante: 4
;	16 - jefe fantasma gigante: 4
;	17 - jefe zombie gigante: 4
;	18 - jefe caballero: 4
;	19 - jefe beholder: 4
;	20 - mano derecha conde drácula: 2 (vert)
;	21 - mano izquierda conde drácula: 2 (vert)
;	22 - conde drácula: 2 (vert)
;		
;movimiento:
;	1 - fijo_aleatorio
;		ciempiés
;		beholder
;		posiciones aleatoriaas precalculadas (duran en posición cont_sig_escena)
;	2 - vertical
;		murciélago
;		araña 
;		"precalculadas en horizontal" de 8 posibles (para usar R) desde la parte superior e irán bajando y 
;		subiendo verticalmente y con pos aleatorias horizontales para que no vayan todos al unísono
;		NOTA: para el murciélado me gustaría una onda senoidal a la altura de un tercio 				?? investigar
;	3 - horizontal
;		serpiente
;		lobo
;		zombie
;		cabalero gris y negro
;		"precalculadas en vertical" de 8 posibles (para usar R) desde la parte izquierda a la derecha moviéndose
;		horizontalmente y con pos aleatorias verticales para que no vayan todos al unísono
;	4 - circular
;		fantasma
;		fuego
;		manos del conde drácula
;		describe círculos desde un punto central con radios (pseudoaleatorios) a cada vuelta
;	5 - variable_aleatorio
;		magia
;		conde drácula
;		posiciones "pseudoaleatorias (aleatorias precalculadas)" por pantalla estando un contador en cada posición (duran en posición cont_sig_escena)



	STRUCT ESTRUCTURA_ENEMIGO
activo_tipo			DB		0	;si inactivo = 0 si <> 0 es el tipo de enemigo
escena				DB		0	;sprite a mostrar 1/2 
cont_sig_escena		DB		0	;retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
energia				DB		0	;energía del enemigo antes de morir
;como será común la saco de la estructura y el daño está en un array
;ptr_accion_dano		DW		0	;realiza cambios en caso daño o de muerte (energía = 0)
posx				DB		0	;pos x para mover y punto central del sprite para revisar disparo
posy				DB		0	;pos y para mover y punto central del sprite para revisar disparo
incx				DB		0	;incremento x para mover
inxy				DB		0	;incremento y para mover
direccionx			DB		0	;0 derecha <> 1 izquierda // 0 abajo <> 1 arriba
direcciony			DB		0	;0 derecha <> 1 izquierda // 0 abajo <> 1 arriba
pasos				DB		0	;pasos para no comprobar los límites de pantalla, sólo si pasos ha llegado a 0
pocavida			DB		0	;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
;mezclo el ptr_sig_escena con el mover ya que son obligatorias no erece la pena tener 2
;ptr_sig_escena		DW		0	;funcion que cambia los sprites de la escena (según el nº de sprites será distinta)
ptr_mover			DW		0	;puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
;se pondrán 8 sprites: 4 por si hay enemigos de hasta 4 sprites y por 2 por usar 2 escenas... si se usan 3 habría que ampliar
;(en realidad estos son los nº de patrón 0 - 63)
sprite_a			DB		0	;izq arriba
sprite_b			DB		0	;izq abajo
sprite_c			DB		0	;der_arriba
sprite_d			DB		0	;der_abajo
dano				DB		0	;daño que hace el enemigo  si el daño es == 0 el enemigo está muerto
ptr_colision		DW		0	;puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
	ENDSTRUCT;ESTRUCTURA_ENEMIGO

