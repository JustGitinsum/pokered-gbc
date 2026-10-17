ItemIconPointers:
	table_width 2
	dw 0                 ; NO_ITEM
	dw MasterBallIcon    ; MASTER_BALL
	dw UltraBallIcon     ; ULTRA_BALL
	dw GreatBallIcon     ; GREAT_BALL
	dw PokeBallIcon      ; POKE_BALL
	dw TownMapIcon       ; TOWN_MAP
	dw BicycleIcon       ; BICYCLE
	dw 0                 ; SURFBOARD
	dw SafariBallIcon    ; SAFARI_BALL
	dw PokedexIcon       ; POKEDEX
	dw MoonStoneIcon     ; MOON_STONE
	dw LinkingCordIcon   ; LINK_STONE (LINK CABLE)
	dw ShinyStoneIcon    ; DAWN_STONE
	dw DuskStoneIcon     ; DUSK_STONE
	dw MetalCoatIcon     ; METAL_COAT
	dw RazorFangIcon     ; RAZOR_FANG
	dw MaxPotionIcon     ; FULL_RESTORE
	dw MaxPotionIcon     ; MAX_POTION
	dw PotionIcon        ; HYPER_POTION
	dw PotionIcon        ; SUPER_POTION
	dw PotionIcon        ; POTION
	dw 0                 ; BOULDERBADGE / SAFARI_BAIT
	dw 0                 ; CASCADEBADGE / SAFARI_ROCK
	dw 0                 ; THUNDERBADGE
	dw 0                 ; RAINBOWBADGE
	dw 0                 ; SOULBADGE
	dw 0                 ; MARSHBADGE
	dw 0                 ; VOLCANOBADGE
	dw 0                 ; EARTHBADGE
	dw EscapeRopeIcon    ; ESCAPE_ROPE
	dw RepelIcon         ; REPEL
	dw OldAmberIcon      ; OLD_AMBER
	dw FireStoneIcon     ; FIRE_STONE
	dw ThunderStoneIcon  ; THUNDER_STONE
	dw WaterStoneIcon    ; WATER_STONE
	dw HPUpIcon          ; HP_UP
	dw VitaminIcon       ; PROTEIN
	dw VitaminIcon       ; IRON
	dw VitaminIcon       ; CARBOS
	dw VitaminIcon       ; CALCIUM
	dw RareCandyIcon     ; RARE_CANDY
	dw DomeFossilIcon    ; DOME_FOSSIL
	dw HelixFossilIcon   ; HELIX_FOSSIL
	dw SecretKeyIcon     ; SECRET_KEY
	dw 0                 ; ITEM_2C (unused)
	dw BikeVoucherIcon   ; BIKE_VOUCHER
	dw BattleItemIcon    ; X_ACCURACY
	dw LeafStoneIcon     ; LEAF_STONE
	dw CardKeyIcon       ; CARD_KEY
	dw NuggetIcon        ; NUGGET
	dw 0                 ; ITEM_32 (unused)
	dw PokeDollIcon      ; POKE_DOLL
	dw FullHealIcon      ; FULL_HEAL
	dw ReviveIcon        ; REVIVE
	dw MaxReviveIcon     ; MAX_REVIVE
	dw JawFossilIcon     ; JAW_FOSSIL
	dw RepelIcon         ; SUPER_REPEL
	dw RepelIcon         ; MAX_REPEL
	dw SailFossilIcon    ; SAIL_FOSSIL
	dw 0                 ; COIN
	dw FreshWaterIcon    ; FRESH_WATER
	dw SodaPopIcon       ; SODA_POP
	dw LemonadeIcon      ; LEMONADE
	dw SSTicketIcon      ; S_S_TICKET
	dw GoldTeethIcon     ; GOLD_TEETH
	dw BattleItemIcon    ; X_ATTACK
	dw BattleItemIcon    ; X_DEFEND
	dw BattleItemIcon    ; X_SPEED
	dw BattleItemIcon    ; X_SPECIAL
	dw CoinCaseIcon      ; COIN_CASE
	dw OaksParcelIcon    ; OAKS_PARCEL
	dw ItemfinderIcon    ; ITEMFINDER
	dw SilphScopeIcon    ; SILPH_SCOPE
	dw PokeFluteIcon     ; POKE_FLUTE
	dw LiftKeyIcon       ; LIFT_KEY
	dw ExpShareIcon      ; EXP_ALL
	dw OldRodIcon        ; OLD_ROD
	dw GoodRodIcon       ; GOOD_ROD
	dw SuperRodIcon      ; SUPER_ROD
	dw PPMaxIcon         ; PP_MAX
	dw EtherIcon         ; ETHER
	dw EtherIcon         ; MAX_ETHER
	dw EtherIcon         ; ELIXER
	dw EtherIcon         ; MAX_ELIXER
	assert_table_length NUM_ITEMS + 1

	REPT HM01 - NUM_ITEMS - 1
		dw 0 ; elevator floors and unused IDs are not inventory items
	ENDR
	REPT NUM_HMS + NUM_TMS
		dw TMHMIcon
	ENDR
	REPT $100 - (TM01 + NUM_TMS)
		dw 0
	ENDR
	assert_table_length $100

ItemIconPalettes:
	table_width 1
	db PAL_BLACK     ; NO_ITEM
	db PAL_PURPLEMON ; MASTER_BALL
	db PAL_TENTACOOL ; ULTRA_BALL
	db PAL_TENTACRUEL ; GREAT_BALL
	db PAL_REDMON    ; POKE_BALL
	db PAL_GREENMON  ; TOWN_MAP
	db PAL_REDMON    ; BICYCLE
	db PAL_BLACK     ; SURFBOARD
	db PAL_GREENMON  ; SAFARI_BALL
	db PAL_REDMON    ; POKEDEX
	db PAL_GRAYMON     ; MOON_STONE
	db PAL_BLACK     ; LINK_STONE
	db PAL_CYANMON   ; DAWN_STONE
	db PAL_PURPLEMON ; DUSK_STONE
	db PAL_BADGE     ; METAL_COAT
	db PAL_BROWNMON  ; RAZOR_FANG
	db PAL_GREENMON  ; FULL_RESTORE
	db PAL_CYANMON   ; MAX_POTION
	db PAL_PINKMON   ; HYPER_POTION
	db PAL_REDMON    ; SUPER_POTION
	db PAL_PURPLEMON ; POTION
	db PAL_BLACK     ; BOULDERBADGE / SAFARI_BAIT
	db PAL_BLACK     ; CASCADEBADGE / SAFARI_ROCK
	db PAL_BLACK     ; THUNDERBADGE
	db PAL_BLACK     ; RAINBOWBADGE
	db PAL_BLACK     ; SOULBADGE
	db PAL_BLACK     ; MARSHBADGE
	db PAL_BLACK     ; VOLCANOBADGE
	db PAL_BLACK     ; EARTHBADGE
	db PAL_BROWNMON  ; ESCAPE_ROPE
	db PAL_GREENMON  ; REPEL
	db PAL_YELLOWMON ; OLD_AMBER
	db PAL_MOLTRES   ; FIRE_STONE
	db PAL_ZAPDOS    ; THUNDER_STONE
	db PAL_BLUEMON   ; WATER_STONE
	db PAL_PURPLEMON ; HP_UP
	db PAL_REDMON    ; PROTEIN
	db PAL_YELLOWMON ; IRON
	db PAL_GREENMON  ; CARBOS
	db PAL_CYANMON   ; CALCIUM
	db PAL_CYANMON   ; RARE_CANDY
	db PAL_BROWNMON  ; DOME_FOSSIL
	db PAL_BROWNMON  ; HELIX_FOSSIL
	db PAL_YELLOWMON ; SECRET_KEY
	db PAL_BLACK     ; ITEM_2C
	db PAL_YELLOWMON ; BIKE_VOUCHER
	db PAL_BLUEMON   ; X_ACCURACY
	db PAL_GREENMON  ; LEAF_STONE
	db PAL_YELLOWMON ; CARD_KEY
	db PAL_YELLOWMON ; NUGGET
	db PAL_BLACK     ; ITEM_32
	db PAL_PINKMON   ; POKE_DOLL
	db PAL_YELLOWMON ; FULL_HEAL
	db PAL_YELLOWMON ; REVIVE
	db PAL_YELLOWMON ; MAX_REVIVE
	db PAL_BROWNMON  ; JAW_FOSSIL
	db PAL_PURPLEMON  ; SUPER_REPEL
	db PAL_YELLOWMON  ; MAX_REPEL
	db PAL_BROWNMON  ; SAIL_FOSSIL
	db PAL_BLACK     ; COIN
	db PAL_CYANMON   ; FRESH_WATER
	db PAL_BLUEMON   ; SODA_POP
	db PAL_YELLOWMON ; LEMONADE
	db PAL_YELLOWMON ; S_S_TICKET
	db PAL_BELLSPROUT ; GOLD_TEETH
	db PAL_REDMON    ; X_ATTACK
	db PAL_YELLOWMON ; X_DEFEND
	db PAL_GREENMON  ; X_SPEED
	db PAL_CYANMON   ; X_SPECIAL
	db PAL_YELLOWMON ; COIN_CASE
	db PAL_BROWNMON  ; OAKS_PARCEL
	db PAL_YELLOWMON ; ITEMFINDER
	db PAL_BADGE     ; SILPH_SCOPE
	db PAL_REDMON ; POKE_FLUTE
	db PAL_BADGE     ; LIFT_KEY
	db PAL_BLUEMON   ; EXP_ALL
	db PAL_BROWNMON  ; OLD_ROD
	db PAL_BROWNMON  ; GOOD_ROD
	db PAL_REDMON    ; SUPER_ROD
	db PAL_PURPLEMON ; PP_MAX
	db PAL_PURPLEMON ; ETHER
	db PAL_GREENMON  ; MAX_ETHER
	db PAL_PINKMON   ; ELIXER
	db PAL_CYANMON   ; MAX_ELIXER
	assert_table_length NUM_ITEMS + 1
	REPT HM01 - NUM_ITEMS - 1
		db PAL_BLACK
	ENDR
	REPT NUM_HMS + NUM_TMS
		db PAL_BADGE ; TM/HM discs override this with their move's type palette
	ENDR
	REPT $100 - (TM01 + NUM_TMS)
		db PAL_BLACK
	ENDR
	assert_table_length $100

MasterBallIcon:   INCBIN "gfx/items/master_ball.2bpp"
UltraBallIcon:    INCBIN "gfx/items/ultra_ball.2bpp"
GreatBallIcon:    INCBIN "gfx/items/great_ball.2bpp"
PokeBallIcon:     INCBIN "gfx/items/poke_ball.2bpp"
TownMapIcon:      INCBIN "gfx/items/town_map.2bpp"
SecretKeyIcon:    INCBIN "gfx/items/secret_key.2bpp"
BikeVoucherIcon:  INCBIN "gfx/items/bike_voucher.2bpp"
BicycleIcon:      INCBIN "gfx/items/bicycle.2bpp"
SafariBallIcon:   INCBIN "gfx/items/safari_ball.2bpp"
PokedexIcon:      INCBIN "gfx/items/pokedex.2bpp"
MoonStoneIcon:    INCBIN "gfx/items/moon_stone.2bpp"
LinkingCordIcon:  INCBIN "gfx/items/linking_cord.2bpp"
ShinyStoneIcon:   INCBIN "gfx/items/shiny_stone.2bpp"
DuskStoneIcon:    INCBIN "gfx/items/dusk_stone.2bpp"
MetalCoatIcon:    INCBIN "gfx/items/metal_coat.2bpp"
RazorFangIcon:    INCBIN "gfx/items/razor_fang.2bpp"
MaxPotionIcon:    INCBIN "gfx/items/max_potion.2bpp"
PotionIcon:       INCBIN "gfx/items/potion.2bpp"
EscapeRopeIcon:   INCBIN "gfx/items/escape_rope.2bpp"
RepelIcon:        INCBIN "gfx/items/repel.2bpp"
OldAmberIcon:     INCBIN "gfx/items/old_amber.2bpp"
FireStoneIcon:    INCBIN "gfx/items/fire_stone.2bpp"
ThunderStoneIcon: INCBIN "gfx/items/thunderstone.2bpp"
WaterStoneIcon:   INCBIN "gfx/items/water_stone.2bpp"
HPUpIcon:         INCBIN "gfx/items/hp_up.2bpp"
VitaminIcon:      INCBIN "gfx/items/vitamin.2bpp"
RareCandyIcon:    INCBIN "gfx/items/rare_candy.2bpp"
DomeFossilIcon:   INCBIN "gfx/items/dome_fossil.2bpp"
HelixFossilIcon:  INCBIN "gfx/items/helix_fossil.2bpp"
JawFossilIcon:    INCBIN "gfx/items/jaw_fossil.2bpp"
SailFossilIcon:   INCBIN "gfx/items/sail_fossil.2bpp"
BattleItemIcon:   INCBIN "gfx/items/battle_item.2bpp"
LeafStoneIcon:    INCBIN "gfx/items/leaf_stone.2bpp"
CardKeyIcon:      INCBIN "gfx/items/card_key.2bpp"
NuggetIcon:       INCBIN "gfx/items/nugget.2bpp"
PokeDollIcon:     INCBIN "gfx/items/poke_doll.2bpp"
FullHealIcon:     INCBIN "gfx/items/full_heal.2bpp"
ReviveIcon:       INCBIN "gfx/items/revive.2bpp"
MaxReviveIcon:    INCBIN "gfx/items/max_revive.2bpp"
FreshWaterIcon:   INCBIN "gfx/items/fresh_water.2bpp"
SodaPopIcon:      INCBIN "gfx/items/soda_pop.2bpp"
LemonadeIcon:     INCBIN "gfx/items/lemonade.2bpp"
SSTicketIcon:     INCBIN "gfx/items/s_s_ticket.2bpp"
GoldTeethIcon:    INCBIN "gfx/items/gold_teeth.2bpp"
OaksParcelIcon:   INCBIN "gfx/items/oaks_parcel.2bpp"
PokeFluteIcon:    INCBIN "gfx/items/poke_flute.2bpp"
CoinCaseIcon:     INCBIN "gfx/items/coin_case.2bpp"
ItemfinderIcon:   INCBIN "gfx/items/itemfinder.2bpp"
SilphScopeIcon:   INCBIN "gfx/items/silphscope2.2bpp"
LiftKeyIcon:      INCBIN "gfx/items/lift_key.2bpp"
ExpShareIcon:     INCBIN "gfx/items/exp_share.2bpp"
OldRodIcon:       INCBIN "gfx/items/old_rod.2bpp"
GoodRodIcon:      INCBIN "gfx/items/good_rod.2bpp"
SuperRodIcon:     INCBIN "gfx/items/super_rod.2bpp"
PPMaxIcon:        INCBIN "gfx/items/pp_max.2bpp"
EtherIcon:        INCBIN "gfx/items/ether.2bpp"
TMHMIcon:         INCBIN "gfx/items/tm_hm.2bpp"
