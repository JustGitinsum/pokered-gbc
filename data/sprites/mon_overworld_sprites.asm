; Overworld sprites used by the player while flying or surfing on a Pokemon.
;
; To add a new Pokemon, add one mon_sprite line to the matching table below
; (above the default entry). The gfx can live in any bank.
; Gfx for new sprites can be added to the "Mon Overworld Sprites" section
; in gfx/sprites.asm, which shares this bank.
;
; The callers are in other banks and reach these routines with farcall.

MACRO mon_sprite ; species, sprite gfx, SPR_PAL_* palette
	db \1, \3, BANK(\2)
	dw \2
ENDM

DEF MON_SPRITE_DEFAULT EQU -1 ; terminates the tables, and is used when no species matches

FlyingMonSprites:
	mon_sprite CHARIZARD, CharizardSprite,      SPR_PAL_ORANGE
	mon_sprite GYARADOS,  GyaradosFlySprite,    SPR_PAL_BLUE
	mon_sprite SCYTHER,    ScytherFlySprite,    SPR_PAL_GREEN
	mon_sprite SCIZOR,     ScizorFlySprite,     SPR_PAL_ORANGE
	mon_sprite CROBAT,     CrobatFlySprite,     SPR_PAL_PURPLE
	mon_sprite BEEDRILL,   BeedrillFlySprite,   SPR_PAL_ORANGE
	mon_sprite BUTTERFREE, ButterfreeFlySprite, SPR_PAL_PURPLE
	mon_sprite VENOMOTH,   VenomothFlySprite,   SPR_PAL_PURPLE
	mon_sprite AERODACTYL, AerodactylFlySprite, SPR_PAL_PURPLE
	mon_sprite DRAGONITE,  DragoniteFlySprite,  SPR_PAL_ORANGE
	mon_sprite PIKACHU,    PikachuFlySprite,    SPR_PAL_ORANGE
	mon_sprite RAICHU,     PikachuFlySprite,    SPR_PAL_ORANGE
	mon_sprite FEAROW,    FearowSprite,        SPR_PAL_BROWN
	mon_sprite MEW,        MewFlySprite,        SPR_PAL_PURPLE
	mon_sprite MEWTWO,     MewtwoSprite,        SPR_PAL_PURPLE
	mon_sprite PIDGEOT,   PidgeotSprite,        SPR_PAL_BROWN
	mon_sprite ARTICUNO,  ArticunoSprite,       SPR_PAL_BLUE
	mon_sprite ZAPDOS,    ZapdosSprite,         SPR_PAL_PURPLE
	mon_sprite MOLTRES,   MoltresSprite,        SPR_PAL_ORANGE
	mon_sprite MON_SPRITE_DEFAULT, BirdSprite,  SPR_PAL_BROWN

SurfingMonSprites:
	mon_sprite BLASTOISE, BlastoiseSurfSprite,   SPR_PAL_BLUE
	mon_sprite LAPRAS,    LaprasSprite,          SPR_PAL_BLUE
	mon_sprite GYARADOS,  GyaradosSurfSprite,    SPR_PAL_BLUE
	mon_sprite TENTACRUEL, TentacruelSurfSprite, SPR_PAL_BLUE
	mon_sprite STARMIE,   StarmieSurfSprite,     SPR_PAL_PURPLE
	mon_sprite MEW,       MewFlySprite,          SPR_PAL_PURPLE
	mon_sprite PIKACHU,   PikachuSurfSprite,     SPR_PAL_ORANGE
	mon_sprite RAICHU,    PikachuSurfSprite,     SPR_PAL_ORANGE
	mon_sprite KINGDRA,   KingdraSurfSprite,     SPR_PAL_BLUE
	mon_sprite SEADRA,    KingdraSurfSprite,     SPR_PAL_BLUE
	mon_sprite NIDOKING,  NidoSurfSprite,        SPR_PAL_PURPLE
	mon_sprite NIDOQUEEN, NidoSurfSprite,        SPR_PAL_BLUE
	mon_sprite OMASTAR,   OmastarSurfSprite,     SPR_PAL_BLUE
	mon_sprite KINGLER,   KinglerSurfSprite,     SPR_PAL_ORANGE
	mon_sprite SNORLAX,   SnorlaxSurfSprite,     SPR_PAL_BLUE
	mon_sprite GOLDUCK,   GolduckSurfSprite,     SPR_PAL_BLUE
	mon_sprite VAPOREON,  VaporeonSurfSprite,    SPR_PAL_BLUE
	mon_sprite RHYDON,    RhydonSurfSprite,      SPR_PAL_BROWN
	mon_sprite DRAGONAIR, DragonairSurfSprite,   SPR_PAL_BLUE
	mon_sprite DRATINI,   DragonairSurfSprite,   SPR_PAL_BLUE
	mon_sprite DRAGONITE, DragoniteSurfSprite,   SPR_PAL_ORANGE
	mon_sprite SLOWBRO,   SlowbroSurfSprite,     SPR_PAL_ORANGE
	mon_sprite TAUROS,    TaurosSurfSprite,      SPR_PAL_BROWN
	mon_sprite SEAKING,   SeakingSurfSprite,     SPR_PAL_ORANGE
	mon_sprite CLOYSTER,  CloysterSurfSprite,    SPR_PAL_PURPLE
	mon_sprite MON_SPRITE_DEFAULT, SeelSprite,   SPR_PAL_EMOJI

; The species IDs are in switchable WRAM, which is hidden while the color code
; has WRAM bank 2 selected (e.g. SetPal_TownMap). Each routine selects the
; default bank only for the read, without touching the stack.

GetFlyingMonSpriteData::
; Looks up [wFlyingPokemonID]. Returns h = gfx bank, de = gfx, l = palette.
; (Only hl, de and a survive a farcall, so the bank is returned in h.)
	ldh a, [rWBK]
	ld b, a
	xor a
	ldh [rWBK], a
	ld a, [wFlyingPokemonID]
	ld c, a
	ld a, b
	ldh [rWBK], a
	ld a, c
	ld hl, FlyingMonSprites
	jr GetMonSpriteData

GetSurfingMonSpriteData::
; Looks up [wSurfingPokemonID]. Returns h = gfx bank, de = gfx, l = palette.
	ldh a, [rWBK]
	ld b, a
	xor a
	ldh [rWBK], a
	ld a, [wSurfingPokemonID]
	ld c, a
	ld a, b
	ldh [rWBK], a
	ld a, c
	ld hl, SurfingMonSprites
	; fallthrough

GetMonSpriteData:
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .found
	cp MON_SPRITE_DEFAULT
	jr z, .found
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop
.found
	ld a, [hli]
	ld b, a ; palette
	ld a, [hli]
	ld c, a ; bank
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld h, c
	ld l, b
	ret
