;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	

;sprites_pantantalla

;; PARTE 1: SPRITES COMUNES
sprites_comunes:
sprite_punto_mira_1:			;color 8
	DB #00,#06,#18,#21,#20,#40,#40,#11
	DB #11,#40,#40,#20,#21,#18,#06,#00
	DB #00,#60,#18,#84,#04,#02,#02,#88
	DB #88,#02,#02,#04,#84,#18,#60,#00 
	
sprite_punto_mira_2: 			;color 15
	DB #00,#00,#00,#00,#03,#04,#08,#08
	DB #08,#08,#04,#03,#00,#00,#00,#00
	DB #00,#00,#00,#00,#C0,#20,#10,#10
	DB #10,#10,#20,#C0,#00,#00,#00,#00
	
sprite_punto_mira_1_mejorado:	;color 8
	DB #00,#06,#19,#21,#20,#41,#41,#36
	DB #36,#41,#41,#20,#21,#19,#06,#00
	DB #00,#60,#98,#84,#04,#82,#82,#6C
	DB #6C,#82,#82,#04,#84,#98,#60,#00 

sprite_punto_mira_2_mejorado:	;color 15
	DB #00,#41,#00,#00,#03,#04,#08,#49
	DB #49,#08,#04,#03,#00,#00,#41,#00
	DB #00,#82,#00,#00,#C0,#20,#10,#92
	DB #92,#10,#20,#C0,#00,#00,#82,#00 
	
sprite_explosion:				;color 8
	DB  #00,#00,#00,#00,#00,#00,#00,#00
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #00,#00,#00,#00,#00,#00,#00,#00	
fin_sprites_comunes:

;; PARTE 2: SPRITES NO COMUNES
;; CIENPIÉS 2
sprite_cienpies:
sprite_cienpies_1:
	DB #82,#44,#24,#9F,#BF,#74,#62,#75
	DB #E8,#E0,#F8,#65,#32,#3F,#4F,#83
	DB #00,#3C,#D2,#F2,#F0,#52,#3C,#00
	DB #00,#00,#00,#44,#08,#FC,#FE,#F8
	
sprite_cienpies_2:
	DB #21,#22,#24,#9F,#7F,#74,#63,#F0
	DB #EC,#60,#39,#61,#32,#BF,#4F,#13
	DB #04,#3A,#D0,#F0,#F0,#50,#3A,#04
	DB #00,#00,#28,#44,#24,#FC,#FE,#F8
fin_sprite_cienpies:


;; SERPIENTE 2 + 2
sprite_serpiente:
sprite_serpiente1_1:
	DB #00,#00,#00,#00,#40,#20,#30,#10
	DB #10,#30,#60,#60,#70,#78,#3F,#1F
	DB #00,#0E,#1B,#3B,#7E,#38,#3C,#1E
	DB #0F,#07,#07,#0F,#3E,#FE,#F8,#F0
	
sprite_serpiente1_2:
	DB #00,#01,#03,#33,#41,#20,#40,#60
	DB #60,#E0,#C0,#C0,#E0,#F1,#7F,#3F
	DB #00,#C0,#6A,#75,#C0,#E0,#78,#3C
	DB #1C,#1E,#1E,#1C,#7C,#FC,#F0,#E0
	
sprite_serpiente2_1:
	DB #00,#70,#D8,#DC,#7E,#1C,#3C,#78
	DB #F0,#E0,#E0,#F0,#7C,#7F,#1F,#0F
	DB #00,#00,#00,#00,#02,#04,#0C,#08
	DB #08,#0C,#06,#06,#0E,#1E,#FC,#F8
	
sprite_serpiente2_2:
	DB #00,#03,#56,#AE,#03,#07,#1E,#3C
	DB #38,#78,#78,#38,#3E,#3F,#0F,#07
	DB #00,#80,#C0,#CC,#82,#04,#02,#06
	DB #06,#07,#03,#03,#07,#8F,#FE,#FC
fin_sprite_serpiente:


;; ARAÑA 2
sprite_arana:
sprite_arana_1:
	DB #00,#01,#03,#05,#07,#75,#8F,#04
	DB #1D,#27,#4B,#91,#20,#10,#00,#00
	DB #00,#80,#C0,#A0,#E0,#AE,#F1,#20
	DB #B8,#E4,#D2,#89,#04,#08,#00,#00
	
sprite_arana_2:
	DB #00,#01,#03,#05,#77,#8D,#07,#1C
	DB #25,#C7,#0B,#31,#40,#00,#00,#00
	DB #00,#80,#C0,#A0,#EE,#B1,#E0,#38
	DB #A4,#E3,#D0,#8C,#02,#00,#00,#00
fin_sprite_arana:


;; MURCIELAGO 2
sprite_murcielago:
sprite_murcielago_1:
	DB #08,#0E,#02,#05,#0F,#0C,#0D,#07
	DB #1B,#3F,#5F,#FB,#F3,#65,#21,#00
	DB #10,#70,#40,#A0,#F0,#30,#B0,#E0
	DB #D8,#FC,#FA,#DF,#CF,#A6,#84,#00
	
sprite_murcielago_2:
	DB #08,#0E,#02,#05,#0F,#0E,#4D,#E7
	DB #FB,#FF,#7F,#7B,#33,#05,#01,#00
	DB #10,#70,#40,#A0,#F0,#70,#B2,#E7
	DB #DF,#FF,#FE,#DE,#CC,#A0,#80,#00
fin_sprite_murcielago:


;; LOBO 4 + 4 (dos escenas derecha y dos escenas izquierda)
sprite_lobo:
sprite_lobo1_1:
	DB #00,#00,#01,#07,#0F,#1F,#1F,#3F
	DB #77,#E7,#EF,#0E,#1C,#18,#0C,#0E
	DB #00,#00,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FF,#79,#70,#E0,#60,#30,#18

sprite_lobo1_2:
	DB #01,#01,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FE,#F6,#E7,#C3,#C1,#40,#60
	DB #00,#C0,#E0,#F0,#D8,#FE,#FE,#E0
	DB #80,#00,#00,#00,#00,#80,#C0,#C0

sprite_lobo1_3:
	DB #00,#00,#01,#07,#0F,#1F,#3F,#7F
	DB #F7,#C7,#83,#06,#07,#03,#03,#01
	DB #00,#00,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FF,#39,#30,#60,#60,#30,#B8

sprite_lobo1_4:
	DB #06,#03,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FE,#76,#66,#EE,#EE,#66,#77
	DB #00,#C0,#E0,#F0,#D8,#FE,#FE,#E0
	DB #80,#00,#00,#00,#00,#00,#00,#00
	
sprite_lobo2_1:
	DB #00,#03,#07,#0F,#1B,#7F,#7F,#07
	DB #01,#00,#00,#00,#00,#01,#03,#03
	DB #80,#80,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#7F,#6F,#E7,#C3,#83,#02,#06 
	
sprite_lobo2_2:
	DB #00,#00,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FF,#9E,#0E,#07,#06,#0C,#18
	DB #00,#00,#80,#E0,#F0,#F8,#F8,#FC
	DB #EE,#E7,#F7,#70,#38,#18,#30,#70

sprite_lobo2_3:
	DB #00,#03,#07,#0F,#1B,#7F,#7F,#07
	DB #01,#00,#00,#00,#00,#00,#00,#00
	DB #60,#C0,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#7F,#6E,#66,#77,#77,#66,#EE 

sprite_lobo2_4:
	DB #00,#00,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FF,#9C,#0C,#06,#06,#0C,#1D
	DB #00,#00,#80,#E0,#F0,#F8,#FC,#FE
	DB #EF,#E3,#C1,#60,#E0,#C0,#C0,#80
fin_sprite_lobo:
	
;; ESQUELETO 4 + 4 (dos escenas derecha y dos escenas izquierda)
sprite_esqueleto:
sprite_esqueleto1_1:
	DB  #00,#00,#39,#39,#20,#20,#20,#38
	DB  #38,#20,#20,#20,#38,#39,#00,#00
	DB  #00,#00,#9E,#92,#92,#92,#92,#92
	DB  #9E,#92,#92,#92,#92,#D2,#00,#00

sprite_esqueleto1_2:
	DB  #00,#00,#39,#39,#20,#20,#20,#38
	DB  #38,#20,#20,#20,#38,#39,#00,#00
	DB  #00,#00,#9C,#92,#92,#92,#92,#92
	DB  #9E,#92,#92,#92,#92,#DC,#00,#00

sprite_esqueleto1_3:
	DB  #00,#00,#3B,#3B,#20,#20,#20,#38
	DB  #3B,#22,#22,#22,#3B,#3B,#00,#00
	DB  #00,#00,#DE,#D2,#52,#52,#52,#52
	DB  #DE,#12,#12,#12,#D2,#D2,#00,#00

sprite_esqueleto1_4:
	DB  #00,#00,#3B,#3B,#20,#20,#20,#38
	DB  #3B,#22,#22,#22,#3B,#3B,#00,#00
	DB  #00,#00,#DC,#D2,#52,#52,#52,#52
	DB  #DE,#12,#12,#12,#D2,#DC,#00,#00
	
sprite_esqueleto2_1:
	DB  #00,#00,#79,#49,#49,#49,#49,#49
	DB  #79,#49,#49,#49,#49,#4B,#00,#00
	DB  #00,#00,#9C,#9C,#04,#04,#04,#1C
	DB  #1C,#04,#04,#04,#1C,#9C,#00,#00

sprite_esqueleto2_2:
	DB  #00,#00,#39,#49,#49,#49,#49,#49
	DB  #79,#49,#49,#49,#49,#3B,#00,#00
	DB  #00,#00,#9C,#9C,#04,#04,#04,#1C
	DB  #1C,#04,#04,#04,#1C,#9C,#00,#00

sprite_esqueleto2_3:
	DB  #00,#00,#7B,#4B,#4A,#4A,#4A,#4A
	DB  #7B,#48,#48,#48,#4B,#4B,#00,#00
	DB  #00,#00,#DC,#DC,#04,#04,#04,#1C
	DB  #DC,#44,#44,#44,#DC,#DC,#00,#00

sprite_esqueleto2_4:
	DB  #00,#00,#3B,#4B,#4A,#4A,#4A,#4A
	DB  #7B,#48,#48,#48,#4B,#3B,#00,#00
	DB  #00,#00,#DC,#DC,#04,#04,#04,#1C
	DB  #DC,#44,#44,#44,#DC,#DC,#00,#00
fin_sprite_esqueleto:
	
;; ZOMBI 4 + 4
sprite_zombi:
sprite_zombi1_1:
	DB  #00,#F8,#09,#08,#18,#30,#20,#20
	DB  #60,#40,#80,#80,#80,#80,#F9,#00
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00

sprite_zombi1_2:
	DB  #00,#F8,#09,#08,#18,#30,#20,#20
	DB  #60,#40,#80,#80,#80,#80,#F9,#00
	DB  #00,#8E,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#CE,#00

sprite_zombi1_3:
	DB  #00,#FB,#0A,#0A,#18,#30,#20,#20
	DB  #61,#41,#83,#82,#82,#82,#FB,#00
	DB  #00,#EF,#29,#29,#29,#29,#69,#EF
	DB  #8F,#09,#09,#09,#09,#09,#E9,#00

sprite_zombi1_4:
	DB  #00,#FB,#0A,#0A,#18,#30,#20,#20
	DB  #61,#41,#83,#82,#82,#82,#FB,#00
	DB  #00,#EE,#29,#29,#29,#29,#69,#EF
	DB  #8F,#09,#09,#09,#09,#09,#EE,#00
	
sprite_zombi2_1:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #00,#1F,#90,#10,#18,#0C,#04,#04
	DB  #06,#02,#01,#01,#01,#01,#9F,#00

sprite_zombi2_2:
	DB  #00,#71,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#73,#00
	DB  #00,#1F,#90,#10,#18,#0C,#04,#04
	DB  #06,#02,#01,#01,#01,#01,#9F,#00

sprite_zombi2_3:
	DB  #00,#F7,#94,#94,#94,#94,#96,#F7
	DB  #F1,#90,#90,#90,#90,#90,#97,#00
	DB  #00,#DF,#50,#50,#18,#0C,#04,#04
	DB  #86,#82,#C1,#41,#41,#41,#DF,#00

sprite_zombi2_4:
	DB  #00,#77,#94,#94,#94,#94,#96,#F7
	DB  #F1,#90,#90,#90,#90,#90,#77,#00
	DB  #00,#DF,#50,#50,#18,#0C,#04,#04
	DB  #86,#82,#C1,#41,#41,#41,#DF,#00
fin_sprite_zombi:
	
;; FANTASMA 5: 2 en horizotal con 2 escenas
sprite_fantasma:
sprite_fantasma_1:
	DB  #00,#F1,#83,#80,#80,#80,#80,#F0
	DB  #F0,#80,#80,#80,#80,#80,#81,#00
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00

sprite_fantasma_2:
	DB  #00,#F1,#83,#80,#80,#80,#80,#F0
	DB  #F0,#80,#80,#80,#80,#80,#81,#00
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00

sprite_fantasma_3:
	DB  #00,#F3,#87,#84,#80,#80,#80,#F0
	DB  #F0,#80,#81,#83,#86,#84,#87,#00
	DB  #00,#CF,#C9,#49,#49,#49,#C9,#8F
	DB  #8F,#89,#89,#09,#09,#09,#C9,#00

sprite_fantasma_4:
	DB  #00,#F3,#87,#84,#80,#80,#80,#F0
	DB  #F0,#80,#81,#83,#86,#84,#87,#00
	DB  #00,#CE,#CB,#49,#49,#49,#C9,#8F
	DB  #8F,#89,#89,#09,#09,#0B,#CE,#00
fin_sprite_fantasma:


;; CABALLERO 4 + 4: es el mismo sprite... cambia el color
sprite_caballero:
sprite_caballero1_1:
	DB  #F8,#81,#80,#80,#80,#80,#80,#80
	DB  #80,#80,#80,#80,#80,#80,#80,#F9
	DB  #8F,#89,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#89,#C9

sprite_caballero1_2:
	DB  #F8,#81,#80,#80,#80,#80,#80,#80
	DB  #80,#80,#80,#80,#80,#80,#80,#F9
	DB  #8E,#89,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#89,#CE

sprite_caballero1_3:
	DB  #FB,#82,#80,#80,#80,#80,#80,#81
	DB  #83,#82,#82,#82,#82,#82,#82,#FB
	DB  #CF,#49,#49,#49,#49,#49,#49,#CF
	DB  #0F,#09,#09,#09,#09,#09,#09,#C9

sprite_caballero1_4:
	DB  #FB,#82,#80,#80,#80,#80,#80,#81
	DB  #83,#82,#82,#82,#82,#82,#82,#FB
	DB  #CE,#4B,#49,#49,#49,#49,#49,#CF
	DB  #0F,#09,#09,#09,#09,#09,#0B,#CE
	
sprite_caballero2_1:
	DB  #F1,#91,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#91,#93
	DB  #1F,#81,#01,#01,#01,#01,#01,#01
	DB  #01,#01,#01,#01,#01,#01,#01,#9F

sprite_caballero2_2:
	DB  #71,#91,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#91,#73
	DB  #1F,#81,#01,#01,#01,#01,#01,#01
	DB  #01,#01,#01,#01,#01,#01,#01,#9F

sprite_caballero2_3:
	DB  #F3,#92,#92,#92,#92,#92,#92,#F3
	DB  #F0,#90,#90,#90,#90,#90,#90,#93
	DB  #DF,#41,#01,#01,#01,#01,#01,#81
	DB  #C1,#41,#41,#41,#41,#41,#41,#DF

sprite_caballero2_4:
	DB  #73,#D2,#92,#92,#92,#92,#92,#F3
	DB  #F0,#90,#90,#90,#90,#90,#D0,#73
	DB  #DF,#41,#01,#01,#01,#01,#01,#81
	DB  #C1,#41,#41,#41,#41,#41,#41,#DF
fin_sprite_caballero:
	
;; FUEGO 4 (2 escenas 2 sprites vert)
sprite_fuego:
sprite_fuego_1:
	DB  #00,#F1,#83,#80,#80,#80,#80,#F0
	DB  #F0,#80,#80,#80,#A8,#A8,#B9,#00
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_fuego_2:
	DB  #00,#F1,#83,#80,#80,#80,#80,#F0
	DB  #F0,#80,#80,#80,#A8,#A8,#B9,#00
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_fuego_3:
	DB  #00,#F3,#84,#84,#80,#80,#80,#F0
	DB  #F1,#82,#82,#82,#AA,#AA,#BB,#00
	DB  #00,#CF,#49,#49,#49,#49,#49,#8F
	DB  #8F,#09,#09,#09,#09,#09,#C9,#00
	
sprite_fuego_4:
	DB  #00,#F3,#84,#84,#80,#80,#80,#F0
	DB  #F1,#82,#82,#82,#AA,#AA,#BB,#00
	DB  #00,#CE,#4B,#49,#49,#49,#49,#8F
	DB  #8F,#09,#09,#09,#09,#0B,#CE,#00
fin_sprite_fuego:
	
;; MAGIA 4 (2 escenas 2 sprites hort)
sprite_magia:
sprite_magia_1:
	DB  #00,#D9,#FB,#A8,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#88,#89,#00
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_magia_2:
	DB  #00,#D9,#FB,#A8,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#88,#89,#00
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_magia_3:
	DB  #00,#D9,#FA,#AA,#88,#88,#88,#88
	DB  #89,#8B,#8A,#8A,#8A,#8A,#8B,#00
	DB  #00,#CF,#69,#29,#29,#29,#29,#CF
	DB  #8F,#09,#09,#09,#09,#09,#C9,#00
	
sprite_magia_4:
	DB  #00,#D9,#FA,#AA,#88,#88,#88,#88
	DB  #89,#8B,#8A,#8A,#8A,#8A,#8B,#00
	DB  #00,#CE,#6B,#29,#29,#29,#29,#CF
	DB  #8F,#09,#09,#09,#09,#0B,#CE,#00
fin_sprite_magia:
	
;; JEFE LOBO (4 sprites 2 escenas 2 direcciones)
sprite_jefelobo:
sprite_jefelobo1_1:
	DB  00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,00000011b,00001111b,00011111b,00111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,11111000b,11111111b,11111111b,11111111b

sprite_jefelobo1_2:
	DB	01111111b,11111111b,11111111b,11111111b,10011111b,10011111b,10111111b,10111111b
	DB	00111111b,01111111b,01111111b,01101110b,01100110b,01100110b,00100010b,00110011b
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,10001111b
	DB	10000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b

sprite_jefelobo1_3:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000001b,00000011b,00111111b,11111111b,11111111b,11111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	01000010b,01100110b,11111110b,11111110b,11111111b,11001011b,11111111b,11111110b

sprite_jefelobo1_4:
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b
	DB	01111111b,00111011b,00111000b,00011000b,00011000b,00011000b,00011100b,00000110b
	DB	11110010b,11111100b,11111000b,01110000b,11100000b,11000000b,11000000b,10000000b
	DB	10000000b,11000000b,11000000b,11000000b,11000000b,01100000b,00110000b,00011000b

sprite_jefelobo1_5:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00001111b,00011111b,00111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,11111111b,11111111b,11111111b

sprite_jefelobo1_6:
	DB	01111111b,11111111b,11111111b,11111111b,11111111b,10111111b,10111111b,10111111b
	DB	00111111b,00111111b,00111011b,00111001b,00110000b,00110000b,00110000b,00011000b
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b
	DB	10000000b,11000000b,11000000b,11000000b,11000000b,01100000b,01100001b,00110001b

sprite_jefelobo1_7:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000001b,00000011b,00111111b,11111111b,11111111b,11111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00100010b,01100110b,11111110b,01111111b,11111111b,10110111b,11111111b,01100111b

sprite_jefelobo1_8:
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b
	DB	01111111b,01110011b,01110011b,01110011b,11100011b,11000001b,11000001b,10000001b
	DB	10110110b,11111100b,11111000b,11110000b,11100000b,11000000b,11000000b,10000000b
	DB	10000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,10000000b

sprite_jefelobo2_1:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	01000010b,01100110b,01111111b,01111111b,11111111b,11010011b,11111111b,11111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,10000000b,11000000b,11111100b,11111111b,11111111b,11111111b

sprite_jefelobo2_2:
	DB	01001111b,00111111b,00011111b,00001111b,00000000b,00000000b,00000000b,00000000b
	DB	00000001b,00000011b,00000011b,00000011b,00000011b,00000110b,00001100b,00011000b
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b
	DB	11111110b,11011100b,00011100b,00011000b,00011000b,00011000b,00111000b,01100000b
	
sprite_jefelobo2_3:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,00001111b,11111111b,11111111b,11111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,11000000b,11110000b,11111000b,11111100b

sprite_jefelobo2_4:
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11110001b
	DB	00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	11111110b,11111111b,11111111b,11111111b,11111001b,11111001b,11111101b,11111101b
	DB	11111100b,11111110b,11111110b,01110110b,01100110b,01100110b,01000100b,11001100b

sprite_jefelobo2_5:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	01000100b,01100110b,01111111b,01111111b,11111111b,11101101b,11111111b,11110011b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,10000000b,11000000b,11111100b,11111111b,11111111b,11111111b

sprite_jefelobo2_6:
	DB	01101101b,00111111b,00011111b,00001111b,00000000b,00000000b,00000000b,00000000b
	DB	00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000001b
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b
	DB	11111110b,11001110b,11001110b,11000110b,11000111b,10000011b,10000011b,10000001b

sprite_jefelobo2_7:
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,11111111b,11111111b,11111111b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b
	DB	00000000b,00000000b,00000000b,00000000b,00000000b,11110000b,11111000b,11111100b

sprite_jefelobo2_8:
	DB	11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b,11111111b
	DB	00000001b,00000011b,00000011b,00000011b,00000011b,00000110b,10000110b,10011000b
	DB	11111110b,11111111b,11111111b,11111111b,11111111b,11111101b,11111101b,11111101b
	DB	11111100b,11111100b,11011100b,10011100b,00001100b,00001100b,00001100b,00011000b
fin_sprite_jefelobo:


	
;; JEFE MURCIËLAGO (4 sprites 2 escenas)
sprite_jefemurcielago:
sprite_jefemurcielago_1:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#00,#88,#D8,#A8,#89,#88
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_jefemurcielago_2:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#00,#88,#D8,#A8,#89,#88
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefemurcielago_3:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#00,#88,#D8,#A8,#89,#88
	DB  #00,#8F,#89,#88,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#89,#CF,#00
	
sprite_jefemurcielago_4:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#00,#88,#D8,#A8,#89,#88
	DB  #00,#8E,#8B,#89,#89,#89,#89,#89
	DB  #89,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefemurcielago_5:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#00,#11,#1B,#15,#91,#11
	
sprite_jefemurcielago_6:
	DB  #00,#71,#D1,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#00,#11,#1B,#15,#91,#11
	
sprite_jefemurcielago_7:
	DB  #00,#F1,#91,#11,#11,#11,#11,#11
	DB  #11,#11,#11,#11,#11,#91,#F3,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#00,#11,#1B,#15,#91,#11
	
sprite_jefemurcielago_8:
	DB  #00,#71,#D1,#91,#91,#91,#91,#91
	DB  #91,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#00,#11,#1B,#15,#91,#11
fin_sprite_jefemurcielago:
	
;; JEFE FANTASMA (4 sprites 2 escenas)
sprite_jefefantasma:
sprite_jefefantasma_1:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#F0,#80,#E0,#80,#81,#80
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_jefefantasma_2:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#F0,#80,#E0,#80,#81,#80
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefefantasma_3:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#F0,#80,#E0,#80,#81,#80
	DB  #00,#8E,#89,#88,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#89,#CE,#00

sprite_jefefantasma_4:
	DB  #70,#11,#13,#10,#10,#10,#90,#90
	DB  #70,#00,#F0,#80,#E0,#80,#81,#80
	DB  #00,#8E,#8B,#89,#89,#89,#89,#89
	DB  #89,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefefantasma_5:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#0F,#01,#07,#01,#81,#01
	
sprite_jefefantasma_6:
	DB  #00,#71,#D1,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#0F,#01,#07,#01,#81,#01
	
sprite_jefefantasma_7:
	DB  #00,#71,#91,#11,#11,#11,#11,#11
	DB  #11,#11,#11,#11,#11,#91,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#0F,#01,#07,#01,#81,#01
	
sprite_jefefantasma_8:
	DB  #00,#71,#D1,#91,#91,#91,#91,#91
	DB  #91,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#09
	DB  #0E,#00,#0F,#01,#07,#01,#81,#01
fin_sprite_jefefantasma:
	
;; JEFE ZOMBI (4 sprites 2 escenas 2 direcciones)
sprite_jefezombi:
sprite_jefezombi1_1:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#FC,#0C,#18,#70,#40,#85,#FC
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00 

sprite_jefezombi1_2:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#FC,#0C,#18,#70,#40,#85,#FC
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefezombi1_3:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#FC,#0C,#18,#70,#40,#85,#FC
	DB  #00,#8F,#89,#88,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#89,#89,#CF,#00
	
sprite_jefezombi1_4:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#FC,#0C,#18,#70,#40,#85,#FC
	DB  #00,#8E,#8B,#89,#89,#89,#89,#89
	DB  #89,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefezombi1_5:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#FC,#0D,#19,#71,#41,#85,#FC
	DB  #00,#EF,#29,#29,#29,#29,#29,#6F
	DB  #CF,#89,#89,#09,#09,#09,#E9,#00
	
sprite_jefezombi1_6:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#FC,#0D,#19,#71,#41,#85,#FC
	DB  #00,#EE,#2B,#29,#29,#29,#29,#6F
	DB  #CF,#89,#89,#09,#09,#0B,#EE,#00
	
sprite_jefezombi1_7:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#FC,#0D,#19,#71,#41,#85,#FC
	DB  #00,#EF,#29,#29,#28,#28,#28,#68
	DB  #C8,#88,#88,#08,#08,#09,#EF,#00
	
sprite_jefezombi1_8:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#FC,#0D,#19,#71,#41,#85,#FC
	DB  #00,#EE,#2B,#29,#29,#29,#29,#69
	DB  #C9,#89,#89,#09,#09,#0B,#EE,#00
	
sprite_jefezombi2_1:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#3F,#30,#18,#0E,#02,#A1,#3F
	
sprite_jefezombi2_2:
	DB  #00,#71,#D1,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#3F,#30,#18,#0E,#02,#A1,#3F
	
sprite_jefezombi2_3:
	DB  #00,#F1,#91,#11,#11,#11,#11,#11
	DB  #11,#11,#11,#11,#91,#91,#F3,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#3F,#30,#18,#0E,#02,#A1,#3F
	
sprite_jefezombi2_4:
	DB  #00,#71,#D1,#91,#91,#91,#91,#91
	DB  #91,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#3F,#30,#18,#0E,#02,#A1,#3F
	
sprite_jefezombi2_5:
	DB  #00,#F7,#94,#94,#94,#94,#94,#F6
	DB  #F3,#91,#91,#90,#90,#90,#97,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3F,#B0,#98,#8E,#82,#A1,#3F
	
sprite_jefezombi2_6:
	DB  #00,#77,#D4,#94,#94,#94,#94,#F6
	DB  #F3,#91,#91,#90,#90,#D0,#77,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3F,#B0,#98,#8E,#82,#A1,#3F
	
sprite_jefezombi2_7:
	DB  #00,#F7,#94,#94,#14,#14,#14,#16
	DB  #13,#11,#11,#10,#10,#90,#F7,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3F,#B0,#98,#8E,#82,#A1,#3F
	
sprite_jefezombi2_8:
	DB  #00,#77,#D4,#94,#94,#94,#94,#96
	DB  #93,#91,#91,#90,#90,#D0,#77,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3F,#B0,#98,#8E,#82,#A1,#3F 	
fin_sprite_jefezombi:
	
;; JEFE CABALLERO (4 sprites 2 escenas 2 direcciones)
sprite_jefecaballero:
sprite_jefecaballero1_1:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#78,#84,#80,#80,#80,#85,#78
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_jefecaballero1_2:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#78,#84,#80,#80,#80,#85,#78
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefecaballero1_3:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#78,#84,#80,#80,#80,#85,#78
	DB  #00,#87,#89,#89,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#89,#C7,#00
	
sprite_jefecaballero1_4:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#78,#84,#80,#80,#80,#85,#78
	DB  #00,#8E,#8B,#89,#89,#89,#89,#89
	DB  #89,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefecaballero1_5:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#7C,#85,#81,#81,#81,#85,#7C
	DB  #00,#EF,#29,#29,#29,#29,#29,#6F
	DB  #CF,#89,#89,#09,#09,#09,#E9,#00
	
sprite_jefecaballero1_6:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#7C,#85,#81,#81,#81,#85,#7C
	DB  #00,#EE,#2B,#29,#29,#29,#29,#6F
	DB  #CF,#89,#89,#09,#09,#0B,#EE,#00
	
sprite_jefecaballero1_7:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#7C,#85,#81,#81,#81,#85,#7C
	DB  #00,#EF,#29,#28,#28,#28,#28,#68
	DB  #C8,#88,#88,#08,#08,#09,#EF,#00
	
sprite_jefecaballero1_8:
	DB  #70,#11,#12,#12,#10,#10,#90,#60
	DB  #00,#7C,#85,#81,#81,#81,#85,#7C
	DB  #00,#EE,#2B,#29,#29,#29,#29,#69
	DB  #C9,#89,#89,#09,#09,#0B,#EE,#00
	
sprite_jefecaballero2_1:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#1E,#21,#01,#01,#01,#A1,#1E
	
sprite_jefecaballero2_2:
	DB  #00,#71,#D1,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#1E,#21,#01,#01,#01,#A1,#1E
	
sprite_jefecaballero2_3:
	DB  #00,#E1,#91,#91,#11,#11,#11,#11
	DB  #11,#11,#11,#11,#11,#91,#E3,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#1E,#21,#01,#01,#01,#A1,#1E
	
sprite_jefecaballero2_4:
	DB  #00,#71,#D1,#91,#91,#91,#91,#91
	DB  #91,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#1E,#21,#01,#01,#01,#A1,#1E
	
sprite_jefecaballero2_5:
	DB  #00,#F7,#94,#94,#94,#94,#94,#F6
	DB  #F3,#91,#91,#90,#90,#90,#97,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3E,#A1,#81,#81,#81,#A1,#3E
	
sprite_jefecaballero2_6:
	DB  #00,#77,#D4,#94,#94,#94,#94,#F6
	DB  #F3,#91,#91,#90,#90,#D0,#77,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3E,#A1,#81,#81,#81,#A1,#3E
	
sprite_jefecaballero2_7:
	DB  #00,#F7,#94,#14,#14,#14,#14,#16
	DB  #13,#11,#11,#10,#10,#90,#F7,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3E,#A1,#81,#81,#81,#A1,#3E
	
sprite_jefecaballero2_8:
	DB  #00,#77,#D4,#94,#94,#94,#94,#96
	DB  #93,#91,#91,#90,#90,#D0,#77,#00
	DB  #0E,#88,#48,#48,#08,#08,#09,#06
	DB  #00,#3E,#A1,#81,#81,#81,#A1,#3E
fin_sprite_jefecaballero:
	
;; JEFE BEHOLDER (4 sprites 2 escenas)
sprite_jefebeholder:
sprite_jefebeholder_1:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#F0,#88,#88,#F8,#88,#89,#F0
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_jefebeholder_2:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#F0,#88,#88,#F8,#88,#89,#F0
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefebeholder_3:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#F0,#88,#88,#F8,#88,#89,#F0
	DB  #00,#8F,#89,#89,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#89,#89,#CF,#00
	
sprite_jefebeholder_4:
	DB  #70,#11,#13,#10,#10,#10,#90,#60
	DB  #00,#F0,#88,#88,#F8,#88,#89,#F0
	DB  #00,#8E,#8B,#89,#89,#89,#89,#89
	DB  #89,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_jefebeholder_5:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#0F,#11,#11,#1F,#11,#91,#0F
	
sprite_jefebeholder_6:
	DB  #00,#71,#D1,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#0F,#11,#11,#1F,#11,#91,#0F
	
sprite_jefebeholder_7:
	DB  #00,#F1,#91,#91,#11,#11,#11,#11
	DB  #11,#11,#11,#11,#91,#91,#F3,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#0F,#11,#11,#1F,#11,#91,#0F
	
sprite_jefebeholder_8:
	DB  #00,#71,#D1,#91,#91,#91,#91,#91
	DB  #91,#91,#91,#91,#91,#D1,#73,#00
	DB  #0E,#88,#C8,#08,#08,#08,#09,#06
	DB  #00,#0F,#11,#11,#1F,#11,#91,#0F	
fin_sprite_jefebeholder:

;; MANOIZQ 4 (2 escenas 2 sprites vert)
sprite_manoizquierda:
sprite_manoizquierda_1:
	DB  #00,#D9,#FB,#A8,#88,#88,#88,#88
	DB  #88,#88,#A8,#A8,#A8,#A8,#AD,#00
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_manoizquierda_2:
	DB  #00,#D9,#FB,#A8,#88,#88,#88,#88
	DB  #88,#88,#A8,#A8,#A8,#A8,#AD,#00
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_manoizquierda_3:
	DB  #00,#DB,#FA,#AA,#88,#88,#88,#88
	DB  #88,#89,#A9,#A9,#A9,#A9,#AD,#00
	DB  #00,#CF,#29,#29,#29,#29,#29,#6F
	DB  #CF,#89,#09,#09,#09,#09,#E9,#00
	
sprite_manoizquierda_4:
	DB  #00,#DB,#FA,#AA,#88,#88,#88,#88
	DB  #88,#89,#A9,#A9,#A9,#A9,#AD,#00
	DB  #00,#CE,#2B,#29,#29,#29,#29,#6F
	DB  #CF,#89,#09,#09,#09,#0B,#EE,#00
fin_sprite_manoizquierda:
	
;; MANODER 4 (2 escenas 2 sprites vert)
sprite_manoderecha:
sprite_manoderecha_1:
	DB  #00,#F1,#91,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#91,#93,#00
	DB  #00,#9B,#DF,#15,#11,#11,#11,#11
	DB  #11,#11,#15,#15,#15,#15,#B5,#00
	
sprite_manoderecha_2:
	DB  #00,#71,#D1,#91,#91,#91,#91,#F1
	DB  #F1,#91,#91,#91,#91,#D1,#73,#00
	DB  #00,#9B,#DF,#15,#11,#11,#11,#11
	DB  #11,#11,#15,#15,#15,#15,#B5,#00
	
sprite_manoderecha_3:
	DB  #00,#F3,#94,#94,#94,#94,#94,#F6
	DB  #F3,#91,#90,#90,#90,#90,#97,#00
	DB  #00,#DB,#5F,#55,#11,#11,#11,#11
	DB  #11,#91,#95,#95,#95,#95,#B5,#00
	
sprite_manoderecha_4:
	DB  #00,#73,#D4,#94,#94,#94,#94,#F6
	DB  #F3,#91,#90,#90,#90,#D0,#77,#00
	DB  #00,#DB,#5F,#55,#11,#11,#11,#11
	DB  #11,#91,#95,#95,#95,#95,#B5,#00
fin_sprite_manoderecha:
	
;; CONDE 4 (2 escenas 2 sprites vert)
sprite_conde:
sprite_conde_1:
	DB  #00,#E1,#93,#88,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#88,#F1,#00
	DB  #00,#8F,#89,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#89,#C9,#00
	
sprite_conde_2:
	DB  #00,#E1,#93,#88,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#88,#F1,#00
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00
	
sprite_conde_3:
	DB  #00,#E1,#93,#88,#88,#88,#88,#88
	DB  #88,#88,#88,#88,#88,#88,#F1,#00
	DB  #00,#8E,#8B,#89,#89,#89,#89,#8F
	DB  #8F,#89,#89,#89,#89,#8B,#CE,#00 
	
sprite_conde_4:
	DB  #00,#E3,#92,#8A,#88,#88,#88,#88
	DB  #88,#88,#89,#89,#8B,#8A,#F3,#00
	DB  #00,#CE,#4B,#49,#49,#49,#49,#4F
	DB  #4F,#C9,#89,#09,#09,#0B,#CE,#00
fin_sprite_conde:


;;=====================================================
;;CARGA PATRONES SPRITES
;;=====================================================	
carga_patrones_cienpies:
		LD			HL, sprite_cienpies
		LD			DE, #38C0
		LD			BC, fin_sprite_cienpies - sprite_cienpies			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
fin_carga_patrones_cienpies:
		RET

carga_patrones_serpiente:
		LD			HL, sprite_serpiente
		LD			DE, #3900
		LD			BC, fin_sprite_serpiente - sprite_serpiente			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
fin_carga_patrones_serpiete:
		RET

carga_patrones_arana:
		LD			HL, sprite_arana
		LD			DE, #3980
		LD			BC, fin_sprite_arana - sprite_arana					;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
fin_carga_patrones_arana:
		RET

carga_patrones_murcielago:
		LD			HL, sprite_murcielago
		LD			DE, #39C0
		LD			BC, fin_sprite_murcielago - sprite_murcielago
		CALL		LDIRVM
fin_carga_patrones_murcielago:
		RET

carga_patrones_lobo:
		LD			HL, sprite_lobo
		LD			DE, #3A00
		LD			BC, fin_sprite_lobo - sprite_lobo
		CALL		LDIRVM
fin_carga_patrones_lobo:
		RET

carga_patrones_lobo_fase5:
		LD			HL, sprite_lobo
		LD			DE, #3B00
		LD			BC, fin_sprite_lobo - sprite_lobo
		CALL		LDIRVM
fin_carga_patrones_lobo_fase5:
		RET

carga_patrones_esqueleto:
		LD			HL, sprite_esqueleto
		LD			DE, #3B00
		LD			BC, fin_sprite_esqueleto - sprite_esqueleto
		CALL		LDIRVM
fin_carga_patrones_esqueleto:
		RET

carga_patrones_zombi:
		LD			HL, sprite_zombi
		LD			DE, #3C00
		LD			BC, fin_sprite_zombi - sprite_zombi
		CALL		LDIRVM
fin_carga_patrones_zombi:
		RET

carga_patrones_fantasma:
		LD			HL, sprite_fantasma
		LD			DE, #3D00
		LD			BC, fin_sprite_fantasma - sprite_fantasma
		CALL		LDIRVM
fin_carga_patrones_fantasma:
		RET

carga_patrones_caballero:
		LD			HL, sprite_caballero
		LD			DE, #3A00
		LD			BC, fin_sprite_caballero - sprite_caballero
		CALL		LDIRVM
fin_carga_patrones_caballero:
		RET

carga_patrones_fuego:
		LD			HL, sprite_fuego
		LD			DE, #3D80
		LD			BC, fin_sprite_fuego - sprite_fuego
		CALL		LDIRVM
fin_carga_patrones_fuego:
		RET

carga_patrones_magia:
		LD			HL, sprite_magia
		LD			DE, #3900
		LD			BC, fin_sprite_magia - sprite_magia
		CALL		LDIRVM
fin_carga_patrones_magia:
		RET

carga_patrones_jefelobo:
		LD			HL, sprite_jefelobo
		LD			DE, #3E00
		LD			BC, fin_sprite_jefelobo - sprite_jefelobo
		CALL		LDIRVM
fin_carga_patrones_jefelobo:
		RET

carga_patrones_jefemurcielago:
		LD			HL, sprite_jefemurcielago
		LD			DE, #3F00
		LD			BC, fin_sprite_jefemurcielago - sprite_jefemurcielago
		CALL		LDIRVM
fin_carga_patrones_jefemurcielago:
		RET

carga_patrones_jefefantasma:
		LD			HL, sprite_jefefantasma
		LD			DE, #3F00
		LD			BC, fin_sprite_jefefantasma - sprite_jefefantasma
		CALL		LDIRVM
fin_carga_patrones_jefefantasma:
		RET

carga_patrones_jefezombi:
		LD			HL, sprite_jefezombi
		LD			DE, #3E00
		LD			BC, fin_sprite_jefezombi - sprite_jefezombi
		CALL		LDIRVM
fin_carga_patrones_jefezombi:
		RET

carga_patrones_jefecaballero:
		LD			HL, sprite_jefecaballero
		LD			DE, #3E00
		LD			BC, fin_sprite_jefecaballero - sprite_jefecaballero
		CALL		LDIRVM
fin_carga_patrones_jefecaballero:
		RET

carga_patrones_jefebeholder:
		LD			HL, sprite_jefebeholder
		LD			DE, #3F00
		LD			BC, fin_sprite_jefebeholder - sprite_jefebeholder
		CALL		LDIRVM
fin_carga_patrones_jefebeholder:
		RET

carga_patrones_condecompleto:
		LD			HL, sprite_manoizquierda
		LD			DE, #3F00
		LD			BC, fin_sprite_conde - sprite_manoizquierda
		CALL		LDIRVM
fin_carga_patrones_condecompleto
		RET
