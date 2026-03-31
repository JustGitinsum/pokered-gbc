; Evos+moves data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, min level (1), species
;    * db EVOLVE_TRADE, min level (1), species
;	 * db EVOLVE_MOVE, MOVE, min level (1)
;	 * dw species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

EvosMovesPointerTable:
	table_width 2
	dw RhydonEvosMoves
	dw KangaskhanEvosMoves
	dw NidoranMEvosMoves
	dw ClefairyEvosMoves
	dw SpearowEvosMoves
	dw VoltorbEvosMoves
	dw NidokingEvosMoves
	dw SlowbroEvosMoves
	dw IvysaurEvosMoves
	dw ExeggutorEvosMoves
	dw LickitungEvosMoves
	dw ExeggcuteEvosMoves
	dw GrimerEvosMoves
	dw GengarEvosMoves
	dw NidoranFEvosMoves
	dw NidoqueenEvosMoves
	dw CuboneEvosMoves
	dw RhyhornEvosMoves
	dw LaprasEvosMoves
	dw ArcanineEvosMoves
	dw MewEvosMoves
	dw GyaradosEvosMoves
	dw ShellderEvosMoves
	dw TentacoolEvosMoves
	dw GastlyEvosMoves
	dw ScytherEvosMoves
	dw StaryuEvosMoves
	dw BlastoiseEvosMoves
	dw PinsirEvosMoves
	dw TangelaEvosMoves
	dw MissingNo1FEvosMoves
	dw MissingNo20EvosMoves
	dw GrowlitheEvosMoves
	dw OnixEvosMoves
	dw FearowEvosMoves
	dw PidgeyEvosMoves
	dw SlowpokeEvosMoves
	dw KadabraEvosMoves
	dw GravelerEvosMoves
	dw ChanseyEvosMoves
	dw MachokeEvosMoves
	dw MrMimeEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw ArbokEvosMoves
	dw ParasectEvosMoves
	dw PsyduckEvosMoves
	dw DrowzeeEvosMoves
	dw GolemEvosMoves
	dw MissingNo32EvosMoves
	dw MagmarEvosMoves
	dw MissingNo34EvosMoves
	dw ElectabuzzEvosMoves
	dw MagnetonEvosMoves
	dw KoffingEvosMoves
	dw MissingNo38EvosMoves
	dw MankeyEvosMoves
	dw SeelEvosMoves
	dw DiglettEvosMoves
	dw TaurosEvosMoves
	dw MissingNo3DEvosMoves
	dw MissingNo3EEvosMoves
	dw MissingNo3FEvosMoves
	dw FarfetchdEvosMoves
	dw VenonatEvosMoves
	dw DragoniteEvosMoves
	dw MissingNo43EvosMoves
	dw MissingNo44EvosMoves
	dw MissingNo45EvosMoves
	dw DoduoEvosMoves
	dw PoliwagEvosMoves
	dw JynxEvosMoves
	dw MoltresEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw DittoEvosMoves
	dw MeowthEvosMoves
	dw KrabbyEvosMoves
	dw MissingNo4FEvosMoves
	dw MissingNo50EvosMoves
	dw MissingNo51EvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw MissingNo56EvosMoves
	dw MissingNo57EvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw MissingNo5EEvosMoves
	dw MissingNo5FEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw EeveeEvosMoves
	dw FlareonEvosMoves
	dw JolteonEvosMoves
	dw VaporeonEvosMoves
	dw MachopEvosMoves
	dw ZubatEvosMoves
	dw EkansEvosMoves
	dw ParasEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw MissingNo73EvosMoves
	dw DodrioEvosMoves
	dw PrimeapeEvosMoves
	dw DugtrioEvosMoves
	dw VenomothEvosMoves
	dw DewgongEvosMoves
	dw MissingNo79EvosMoves
	dw MissingNo7AEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw MachampEvosMoves
	dw MissingNo7FEvosMoves
	dw GolduckEvosMoves
	dw HypnoEvosMoves
	dw GolbatEvosMoves
	dw MewtwoEvosMoves
	dw SnorlaxEvosMoves
	dw MagikarpEvosMoves
	dw MissingNo86EvosMoves
	dw MissingNo87EvosMoves
	dw MukEvosMoves
	dw MissingNo8AEvosMoves
	dw KinglerEvosMoves
	dw CloysterEvosMoves
	dw MissingNo8CEvosMoves
	dw ElectrodeEvosMoves
	dw ClefableEvosMoves
	dw WeezingEvosMoves
	dw PersianEvosMoves
	dw MarowakEvosMoves
	dw MissingNo92EvosMoves
	dw HaunterEvosMoves
	dw AbraEvosMoves
	dw AlakazamEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw StarmieEvosMoves
	dw BulbasaurEvosMoves
	dw VenusaurEvosMoves
	dw TentacruelEvosMoves
	dw MissingNo9CEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw MissingNo9FEvosMoves
	dw MissingNoA0EvosMoves
	dw MissingNoA1EvosMoves
	dw MissingNoA2EvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw NidorinoEvosMoves
	dw NidorinaEvosMoves
	dw GeodudeEvosMoves
	dw PorygonEvosMoves
	dw AerodactylEvosMoves
	dw MissingNoACEvosMoves
	dw MagnemiteEvosMoves
	dw MissingNoAEEvosMoves
	dw MissingNoAFEvosMoves
	dw CharmanderEvosMoves
	dw SquirtleEvosMoves
	dw CharmeleonEvosMoves
	dw WartortleEvosMoves
	dw CharizardEvosMoves
	dw MissingNoB5EvosMoves
	dw FossilKabutopsEvosMoves
	dw FossilAerodactylEvosMoves
	dw MonGhostEvosMoves
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

RhydonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 30, STOMP
	db 35, TAIL_WHIP
	db 40, FURY_ATTACK
	db 48, PLAY_ROUGH
	db 55, LEER
	db 64, BODY_SLAM
	db 0

KangaskhanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TAIL_WHIP
	db 13, BITE
	db 19, BULLDOZE
	db 25, BODY_SLAM
	db 34, DIZZY_PUNCH
	db 37, CRUNCH
	db 43, REST
	db 46, OUTRAGE
	db 0

NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset LGPE
	db 3, FOCUS_ENERGY
	db 6, POISON_FANG
	db 9, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 21, FURY_ATTACK
	db 28, SUCKER_PUNCH
	db 30, POISON_JAB
	db 35, PLAY_ROUGH
	db 40, EARTH_POWER
	db 0

ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
; Learnset ZA
	db 5, DEFENSE_CURL
	db 8, DOUBLESLAP
	db 13, SING
	db 16, DRAIN_KISS
	db 20, MAGICAL_LEAF
	db 23, METRONOME
	db 25, BUBBLEBEAM
	db 27, LIGHT_SCREEN
	db 31, AMNESIA
	db 35, MINIMIZE
;;;	db 40, MYSTICAL_FIRE
	db 48, MOONBLAST
	db 0

SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
	db 0
; Learnset
	db 9, LEER
	db 15, FURY_ATTACK
	db 22, MIRROR_MOVE
	db 29, DRILL_PECK
	db 36, AGILITY
	db 0

VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0
; Learnset
	db 14, SWIFT
	db 19, SHOCK_WAVE
	db 24, SCREECH
	db 28, ROLLOUT
	db 31, THUNDERBOLT
	db 45, EXPLOSION
	db 0

NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 3, FOCUS_ENERGY
	db 6, POISON_FANG
	db 9, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 21, FURY_ATTACK
	db 28, SUCKER_PUNCH
	db 30, POISON_JAB
	db 35, PLAY_ROUGH
	db 40, EARTH_POWER
	db 0

SlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, WATER_GUN
	db 12, CONFUSION
	db 15, DISABLE
	db 18, BUBBLEBEAM
	db 21, HEADBUTT
	db 24, ZEN_HEADBUTT
	db 27, AMNESIA
	db 30, ANCIENTPOWER
	db 36, PSYCHIC_M
	db 0

IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db  6, VINE_WHIP
	db  9, LEECH_SEED
	db 12, POISONPOWDER
	db 16, SLEEP_POWDER
	db 19, MAGICAL_LEAF
	db 25, BODY_SLAM
	db 40, AMNESIA
	db 45, DOUBLE_EDGE
	db 55, ENERGY_BALL
	db 0

ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, MEGA_DRAIN
	db 19, STUN_SPORE
	db 20, CONFUSION
	db 28, STOMP
	db 35, GIGA_DRAIN
	db 40, EXTRASENSORY
	db 0

LickitungEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, STOMP
	db 9, SUPERSONIC
	db 12, BULLDOZE
	db 18, ZEN_HEADBUTT
	db 24, DISABLE
	db 31, ROLLOUT
	db 36, BODY_SLAM
	db 39, SCREECH
	db 0

ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
	db 15, MEGA_DRAIN
	db 19, STUN_SPORE
	db 20, CONFUSION
	db 35, GIGA_DRAIN
	db 40, EXTRASENSORY
	db 0

GrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 38, MUK
	db 0
; Learnset
	db 30, POISON_GAS
	db 33, MINIMIZE
	db 37, SLUDGE
	db 42, HARDEN
	db 48, SCREECH
	db 55, ACID_ARMOR
	db 0

GengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, HYPNOSIS
	db 11, CONFUSION
	db 27, HAZE
	db 36, SUCKER_PUNCH
	db 48, SHADOW_BALL
	db 60, DREAM_EATER
	db 0

NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
	db 3, TAIL_WHIP
	db 6, POISON_FANG
	db 9, DOUBLE_KICK
	db 13, BITE
	db 21, FURY_SWIPES
	db 24, CRUNCH
	db 27, SUPER_FANG
	db 35, PLAY_ROUGH
	db 40, EARTH_POWER
	db 0

NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 3, TAIL_WHIP
	db 6, POISON_FANG
	db 9, DOUBLE_KICK
	db 13, BITE
	db 21, FURY_SWIPES
	db 24, CRUNCH
	db 27, SUPER_FANG
	db 35, PLAY_ROUGH
	db 40, EARTH_POWER
	db 0

CuboneEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0
; Learnset ;from ZA
	db 12, HEADBUTT
	db 24, BULLDOZE
	db 28, SUCKER_PUNCH
	db 32, FOCUS_ENERGY
	db 38, THRASH
	db 40, BONEMERANG
	db 44, SWORDS_DANCE
	db 48, DOUBLE_EDGE
	db 0

RhyhornEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 42, RHYDON
	db 0
; Learnset
	db 30, STOMP
	db 35, TAIL_WHIP
	db 40, FURY_ATTACK
	db 45, PLAY_ROUGH
	db 50, LEER
	db 55, BODY_SLAM
	db 0

LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, SING
	db 20, MIST
	db 25, BODY_SLAM
	db 31, CONFUSE_RAY
	db 38, ICE_BEAM
	db 46, HYDRO_PUMP
	db 0

ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, BITE
	db 12, POUNCE
	db 20, AGILITY
	db 24, FIRE_FANG
	db 32, CRUNCH
	db 36, BODY_SLAM
	db 40, HEAT_CRASH
	db 43, OUTRAGE
	db 50, EXTREMESPEED
	db 0

MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TRANSFORM
	db 20, AMNESIA
	db 30, ANCIENTPOWER
	db 60, METRONOME
	db 90, AURA_SPHERE
	db 100, PSYCHIC_M
	db 0

GyaradosEvosMoves:
; Evolutions
	db 0
; Learnset ;from SM mix LGPE
	db 11, DRAGON_RAGE
	db 20, BITE
	db 24, DRAGONBREATH
	db 27, ICE_FANG
	db 31, WATERFALL
	db 36, CRUNCH
	db 41, OUTRAGE
	db 46, HYDRO_PUMP
	db 51, HYPER_BEAM
	db 0

ShellderEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
; Learnset
	db 18, SUPERSONIC
	db 23, CLAMP
	db 30, AURORA_BEAM
	db 39, LEER
	db 50, ICE_BEAM
	db 0

TentacoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0
; Learnset
	db 7, SUPERSONIC
	db 13, WRAP
	db 18, POISON_FANG
	db 22, WATER_GUN
	db 27, CONSTRICT
	db 33, BARRIER
	db 40, SCREECH
	db 48, HYDRO_PUMP
	db 0

GastlyEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, HAUNTER
	db EVOLVE_LEVEL, 33, HAUNTER
	db 0
; Learnset ;from gen9
	db 4, HYPNOSIS
	db 8, CONFUSION
	db 27, HAZE
	db 32, SUCKER_PUNCH
	db 40, SHADOW_BALL
	db 48, DREAM_EATER
	db 0

ScytherEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, WING_ATTACK
	db 16, DOUBLE_TEAM
	db 24, SLASH
	db 28, FOCUS_ENERGY
	db 32, AGILITY
	db 36, AIR_SLASH
	db 40, X_SCISSOR
	db 44, SWORDS_DANCE
	db 0

StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
	db 0
; Learnset
	db 12, RAPID_SPIN
	db 16, MINIMIZE
	db 20, SWIFT
	db 24, PSYBEAM
	db 28, BUBBLEBEAM
	db 32, LIGHT_SCREEN
	db 36, POWER_GEM
	db 40, PSYCHIC_M
	db 48, RECOVER
	db 56, HYDRO_PUMP
	db 0

BlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db  6, WATER_GUN
	db  9, WITHDRAW
	db 12, BITE
	db 16, RAPID_SPIN
	db 22, AURORA_BEAM
	db 27, BUBBLEBEAM
	db 33, HEADBUTT
	db 36, FLASH_CANNON
	db 44, HYDRO_PUMP
	db 0

PinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, FOCUS_ENERGY
	db 11, SEISMIC_TOSS
	db 19, SUCKER_PUNCH
	db 23, DISABLE
	db 27, BODY_SLAM
	db 36, X_SCISSOR
	db 40, SWORDS_DANCE
	db 50, CLOSE_COMBAT
	db 0

TangelaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 29, MEGA_DRAIN
	db 32, POISONPOWDER
	db 36, STUN_SPORE
	db 39, SLEEP_POWDER
	db 45, SLAM
	db 49, GROWTH
	db 0

MissingNo1FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo20EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
; Learnset
	db 8, BITE
	db 12, POUNCE
	db 20, AGILITY
	db 24, FIRE_FANG
	db 32, CRUNCH
	db 36, BODY_SLAM
	db 40, HEAT_CRASH
	db 43, OUTRAGE
	db 50, EXTREMESPEED
	db 0

OnixEvosMoves:
; Evolutions
	db 0
; Learnset ;From ZA and PLA Mix
	db 11, BULLDOZE
	db 16, DRAGONBREATH
	db 22, HEADBUTT
	db 24, SCREECH
	db 44, DIG
	db 48, IRON_HEAD
	db 52, ROCK_SLIDE
	db 0

FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LEER
	db 15, FURY_ATTACK
	db 25, MIRROR_MOVE
	db 34, DRILL_PECK
	db 43, AGILITY
	db 0

PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 21, WING_ATTACK
	db 25, SILVER_WIND
	db 29, AGILITY
	db 44, MIRROR_MOVE
	db 0

SlowpokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0
; Learnset
	db 6, WATER_GUN
	db 12, CONFUSION
	db 15, DISABLE
	db 18, BUBBLEBEAM
	db 21, HEADBUTT
	db 24, ZEN_HEADBUTT
	db 27, AMNESIA
	db 36, PSYCHIC_M
	db 0

KadabraEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, ALAKAZAM
	db EVOLVE_LEVEL, 33, ALAKAZAM
	db 0
; Learnset
	db 16, PSYBEAM
	db 20, REFLECT
	db 25, RECOVER
	db 31, TRI_ATTACK
	db 35, PSYCHIC_M
	db 42, AMNESIA
	db 0

GravelerEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GOLEM
	db EVOLVE_LEVEL, 33, GOLEM
	db 0
; Learnset ;From BD/SP
	db 1, DEFENSE_CURL
	db 10, ROCK_TOMB
	db 22, BULLDOZE
	db 24, BODY_SLAM
	db 28, ROLLOUT
	db 34, EARTHQUAKE
	db 36, EXPLOSION
	db 40, DOUBLE_EDGE
	db 42, ROCK_SLIDE
	db 0

ChanseyEvosMoves:
; Evolutions
	db 0
; Learnset PLA
	db 16, SING
	db 18, DRAIN_KISS
	db 24, BODY_SLAM
	db 28, MINIMIZE
	db 36, LIGHT_SCREEN
	db 40, DOUBLE_EDGE
	db 44, SOFTBOILED
	db 0

MachokeEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, MACHAMP
	db EVOLVE_LEVEL, 33, MACHAMP
	db 0
; Learnset ;From ZA
;;;	db 16, BULLET_PUNCH
	db 18, SUCKER_PUNCH
	db 25, BRICK_BREAK
	db 30, BULLDOZE
	db 36, SEISMIC_TOSS
	db 44, DOUBLE_EDGE
	db 54, CLOSE_COMBAT
	db 0

MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, MIMIC
	db 12, CONFUSION
	db 18, ANCIENTPOWER
	db 23, BARRIER
	db 28, PSYBEAM
	db 31, DOUBLESLAP
	db 39, MEDITATE
	db 47, SUBSTITUTE
	db 48, PSYCHIC_M
	db 0

HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 33, BRICK_BREAK
	db 38, JUMP_KICK
	db 43, FOCUS_ENERGY
	db 48, HI_JUMP_KICK
	db 53, CLOSE_COMBAT
	db 0

HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 33, FIRE_PUNCH
	db 38, ICE_PUNCH
	db 43, THUNDERPUNCH
	db 48, AERIAL_ACE
	db 53, COUNTER
	db 0

ArbokEvosMoves:
; Evolutions
	db 0
; Learnset from gen9
	db 4, POISON_FANG
	db 9, BITE
	db 12, GLARE
	db 17, SCREECH
	db 20, ACID
	db 22, CRUNCH
	db 33, LEECH_LIFE
	db 39, SLUDGE_BOMB
	db 51, HAZE
	db 0

ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, POISONPOWDER
	db 13, STUN_SPORE
	db 17, SPORE
	db 20, LEECH_LIFE
	db 22, SLASH
	db 33, GIGA_DRAIN
	db 38, GROWTH
	db 43, X_SCISSOR
	db 0

PsyduckEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0
; Learnset
	db 9, FURY_SWIPES
	db 12, BUBBLEBEAM
	db 15, DISABLE
	db 18, ZEN_HEADBUTT
	db 21, SCREECH
	db 34, AMNESIA
	db 0

DrowzeeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
	db 0
; Learnset ;from gen9
	db 9, CONFUSION
	db 13, HEADBUTT
	db 17, POISON_GAS
	db 21, PSYBEAM
	db 25, MEDITATE
	db 29, ZEN_HEADBUTT
	db 33, ANCIENTPOWER
	db 37, PSYCHIC_M
	db 41, AMNESIA
	db 0

GolemEvosMoves:
; Evolutions
	db 0
; Learnset ;From BD/SP
	db 1, DEFENSE_CURL
	db 10, ROCK_TOMB
	db 22, BULLDOZE
	db 24, BODY_SLAM
	db 28, ROLLOUT
	db 34, EARTHQUAKE
	db 36, EXPLOSION
	db 40, DOUBLE_EDGE
	db 42, ROCK_SLIDE
	db 0

MissingNo32EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MagmarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 36, LEER
	db 39, CONFUSE_RAY
	db 43, FIRE_PUNCH
	db 48, SMOKESCREEN
	db 52, SMOG
	db 55, FLAMETHROWER
	db 0

MissingNo34EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

ElectabuzzEvosMoves:
; Evolutions
	db 0
; Learnset
	db 22, LOW_SWEEP
	db 25, SHOCK_WAVE
	db 28, LIGHT_SCREEN
	db 33, THUNDERPUNCH
	db 39, SCREECH
	db 44, THUNDERBOLT
	db 50, THUNDER
	db 0

MagnetonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, SONICBOOM
	db 20, SHOCK_WAVE
	db 24, SCREECH
	db 32, THUNDERBOLT
	db 36, FLASH_CANNON
	db 40, TRI_ATTACK
	db 44, LIGHT_SCREEN
	db 52, THUNDER
	db 0

KoffingEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 35, WEEZING
	db 0
; Learnset
	db 32, SLUDGE
	db 37, SMOKESCREEN
	db 40, SELFDESTRUCT
	db 45, HAZE
	db 48, EXPLOSION
	db 0

MissingNo38EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MankeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0
; Learnset
	db 6, KARATE_CHOP
	db 10, ROCK_TOMB
	db 16, LOW_SWEEP
	db 18, SUCKER_PUNCH
	db 22, BULLDOZE
	db 28, HEADBUTT
	db 40, SCREECH
	db 44, CLOSE_COMBAT
	db 50, OUTRAGE
	db 0

SeelEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0
; Learnset
	db 30, GROWL
	db 35, AURORA_BEAM
	db 40, REST
	db 45, BODY_SLAM
	db 50, ICE_BEAM
	db 0

DiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0
; Learnset Gen9
	db 12, BULLDOZE
	db 16, METAL_CLAW
	db 20, SUCKER_PUNCH
	db 24, SLASH
	db 29, IRON_HEAD
	db 32, DIG
	db 36, EARTH_POWER
	db 40, EARTHQUAKE
	db 0

TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, DOUBLE_KICK
	db 15, BULLDOZE
	db 20, HORN_ATTACK
	db 30, ZEN_HEADBUTT
	db 35, BODY_SLAM
	db 40, REST
	db 46, OUTRAGE
	db 50, THRASH
	db 55, DOUBLE_EDGE
	db 0

MissingNo3DEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEER
	db 15, FURY_ATTACK
	db 23, SWORDS_DANCE
	db 31, AGILITY
	db 39, SLASH
	db 0

VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0
; Learnset
	db 5, POUNCE
	db 13, POISONPOWDER
	db 17, PSYBEAM
	db 23, STUN_SPORE
	db 29, SLEEP_POWDER
	db 35, LEECH_LIFE
	db 37, ZEN_HEADBUTT
	db 41, POISON_FANG
	db 47, PSYCHIC_M
	db 0

DragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 15, DRAGONBREATH
	db 20, AGILITY
	db 24, WING_ATTACK
	db 35, SLAM
	db 45, DRAGON_RAGE
	db 50, EXTREMESPEED
	db 56, OUTRAGE
	db 60, HYPER_BEAM
	db 0

MissingNo43EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo44EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo45EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

DoduoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, DODRIO
	db 0
; Learnset
	db 20, GROWL
	db 24, FURY_ATTACK
	db 30, DRILL_PECK
	db 36, RAGE
	db 40, TRI_ATTACK
	db 44, AGILITY
	db 0

PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0
; Learnset
	db 16, HYPNOSIS
	db 19, WATER_GUN
	db 25, DOUBLESLAP
	db 31, BODY_SLAM
	db 38, AMNESIA
	db 45, HYDRO_PUMP
	db 0

JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, CONFUSION
	db 20, SING
	db 23, DOUBLESLAP
	db 28, ICE_PUNCH
	db 31, BODY_SLAM
	db 34, PSYCHIC_M
	db 40, LOVELY_KISS
	db 58, BLIZZARD
	db 0

MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 60, SKY_ATTACK
	db 0

ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 60, HAZE
	db 65, BLIZZARD
	db 0

ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 60, LIGHT_SCREEN
	db 65, THUNDER
	db 0

DittoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0
; Learnset
	db 8, POUNCE
	db 10, BITE
	db 15, METAL_CLAW
	db 17, SCREECH
	db 22, FURY_SWIPES
	db 32, SLASH
	db 36, CRUNCH
	db 48, PLAY_ROUGH
	db 0

KrabbyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, KINGLER
	db 0
; Learnset SWSH
	db 4, HARDEN
	db 8, METAL_CLAW
	db 12, VICEGRIP
	db 20, BUBBLEBEAM
	db 24, STOMP
	db 29, LUNGE
	db 36, SLAM
	db 40, SWORDS_DANCE
	db 44, CRABHAMMER
	db 0

MissingNo4FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo50EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo51EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

VulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
	db 0
; Learnset
	db 16, QUICK_ATTACK
	db 20, CONFUSE_RAY
	db 28, EXTRASENSORY
	db 32, FLAMETHROWER
	db 40, FIRE_SPIN
	db 0

NinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, QUICK_ATTACK
	db 20, CONFUSE_RAY
	db 32, EXTRASENSORY
	db 36, FLAMETHROWER
	db 44, FIRE_SPIN
	db 0

PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
; Learnset
	db 9, DOUBLE_KICK
	db 12, DOUBLE_TEAM
	db 15, THUNDER_WAVE
	db 18, LIGHT_SCREEN
	db 21, SHOCK_WAVE
	db 24, SLAM
	db 27, AGILITY
	db 32, THUNDERBOLT
	db 43, THUNDER
	db 0

RaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, DOUBLE_KICK
	db 12, DOUBLE_TEAM
	db 15, THUNDER_WAVE
	db 18, LIGHT_SCREEN
	db 21, SHOCK_WAVE
	db 24, SLAM
	db 27, AGILITY
	db 32, THUNDERBOLT
	db 43, THUNDER
	db 0

MissingNo56EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo57EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

DratiniEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 15, DRAGONBREATH
	db 20, AGILITY
	db 30, SLAM
	db 40, DRAGON_RAGE
	db 55, OUTRAGE
	db 60, HYPER_BEAM
	db 0

DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 20, AGILITY
	db 35, SLAM
	db 45, DRAGON_RAGE
	db 56, OUTRAGE
	db 60, HYPER_BEAM
	db 0

KabutoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0
; Learnset
	db 34, MEGA_DRAIN
	db 39, SLASH
	db 44, LEER
	db 49, HYDRO_PUMP
	db 0

KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 34, MEGA_DRAIN
	db 39, SLASH
	db 46, LEER
	db 53, HYDRO_PUMP
	db 0

HorseaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, SEADRA
	db 0
; Learnset
	db 15, SMOKESCREEN
	db 20, DRAGONBREATH
	db 25, BUBBLEBEAM
	db 28, AURORA_BEAM
	db 30, AGILITY
	db 45, HYDRO_PUMP
	db 0

SeadraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, SMOKESCREEN
	db 20, DRAGONBREATH
	db 25, BUBBLEBEAM
	db 28, AURORA_BEAM
	db 30, AGILITY
	db 45, HYDRO_PUMP
	db 0

MissingNo5EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo5FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

SandshrewEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0
; Learnset
	db 3, POISON_FANG
	db 6, SAND_ATTACK
	db 9, BULLDOZE
	db 15, RAPID_SPIN
	db 18, METAL_CLAW
	db 24, FURY_SWIPES
	db 27, AGILITY
	db 30, SLASH
	db 33, DIG
	db 36, ROLLOUT
	db 39, SWORDS_DANCE
	db 45, EARTHQUAKE
	db 0

SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 3, POISON_FANG
	db 6, SAND_ATTACK
	db 9, BULLDOZE
	db 15, RAPID_SPIN
	db 18, METAL_CLAW
	db 24, FURY_SWIPES
	db 27, AGILITY
	db 30, SLASH
	db 33, DIG
	db 36, ROLLOUT
	db 39, SWORDS_DANCE
	db 45, EARTHQUAKE
	db 0

OmanyteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0
; Learnset
	db 34, HORN_ATTACK
	db 39, LEER
	db 46, SPIKE_CANNON
	db 53, HYDRO_PUMP
	db 0

OmastarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 34, HORN_ATTACK
	db 39, LEER
	db 44, SPIKE_CANNON
	db 49, HYDRO_PUMP
	db 0

JigglypuffEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
; Learnset
	db 10, DOUBLESLAP
	db 12, DRAIN_KISS
	db 14, DISABLE
	db 16, CONFUSION
	db 19, BODY_SLAM
	db 24, ROLLOUT
	db 28, MIMIC
	db 36, PSYCHIC_M
	db 40, REST
	db 44, DOUBLE_EDGE
	db 53, MOONBLAST
	db 0

WigglytuffEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, DOUBLESLAP
	db 12, DRAIN_KISS
	db 14, DISABLE
	db 16, CONFUSION
	db 19, BODY_SLAM
	db 24, ROLLOUT
	db 28, MIMIC
	db 36, PSYCHIC_M
	db 40, REST
	db 44, DOUBLE_EDGE
	db 53, MOONBLAST
	db 0

EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db 0
; Learnset
	db 27, QUICK_ATTACK
	db 31, TAIL_WHIP
	db 37, BITE
	db 45, BODY_SLAM
	db 0

FlareonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, QUICK_ATTACK
	db 1, EMBER
	db 20, FIRE_FANG
	db 25, BITE
	db 29, SMOG
	db 36, FLAMETHROWER
	db 50, HEAT_CRASH
	db 0

JolteonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, QUICK_ATTACK
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 20, THUNDER_WAVE
	db 25, DOUBLE_KICK
	db 30, THUNDERFANG
	db 35, PIN_MISSILE
	db 45, AGILITY
	db 50, THUNDER
	db 0

VaporeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 27, QUICK_ATTACK
	db 31, WATER_GUN
	db 37, TAIL_WHIP
	db 40, BITE
	db 42, ACID_ARMOR
	db 44, HAZE
	db 48, MIST
	db 54, HYDRO_PUMP
	db 0

MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset ;From ZA
;;;	db 16, BULLET_PUNCH
	db 18, SUCKER_PUNCH
	db 25, BRICK_BREAK
	db 30, BULLDOZE
	db 36, SEISMIC_TOSS
	db 44, DOUBLE_EDGE
	db 54, CLOSE_COMBAT
	db 0

ZubatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0
; Learnset
	db 12, WING_ATTACK
	db 15, QUICK_ATTACK
	db 18, SILVER_WIND
	db 22, HYPNOSIS
	db 26, HAZE
	db 30, CONFUSE_RAY
	db 34, POISON_FANG
	db 50, LEECH_LIFE
	db 0

EkansEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
	db 0
; Learnset from gen9
	db 4, POISON_FANG
	db 9, BITE
	db 12, GLARE
	db 17, SCREECH
	db 20, ACID
	db 33, SLUDGE_BOMB
	db 41, HAZE
	db 0

ParasEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 24, PARASECT
	db 0
; Learnset
	db 6, POISONPOWDER
	db 13, STUN_SPORE
	db 17, SPORE
	db 20, LEECH_LIFE
	db 22, SLASH
	db 33, GIGA_DRAIN
	db 38, GROWTH
	db 43, X_SCISSOR
	db 0

PoliwhirlEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
	db 0
; Learnset
	db 16, HYPNOSIS
	db 19, WATER_GUN
	db 26, DOUBLESLAP
	db 33, BODY_SLAM
	db 41, AMNESIA
	db 49, HYDRO_PUMP
	db 0

PoliwrathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, HYPNOSIS
	db 19, WATER_GUN
	db 0

WeedleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0
; Learnset
	db 4, POUNCE
	db 0

KakunaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0
; Learnset
	db 7, HARDEN
	db 9, ELECTROWEB
	db 0

BeedrillEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TWINEEDLE
	db 14, FOCUS_ENERGY
	db 17, FURY_ATTACK
	db 20, PIN_MISSILE
	db 23, SLUDGE
	db 30, X_SCISSOR
	db 38, POISON_JAB
	db 43, AGILITY
	db 0

MissingNo73EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

DodrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, GROWL
	db 24, FURY_ATTACK
	db 30, DRILL_PECK
	db 39, RAGE
	db 45, TRI_ATTACK
	db 51, AGILITY
	db 0

PrimeapeEvosMoves:
; Evolutions
;	db EVOLVE_MOVE, RAGE_FIST, 1
;	dw ANILAPE
	db 0
; Learnset
	db 6, KARATE_CHOP
	db 10, ROCK_TOMB
	db 16, LOW_SWEEP
	db 18, SUCKER_PUNCH
	db 22, BULLDOZE
	db 28, HEADBUTT
	db 35, RAGE_FIST
	db 40, SCREECH
	db 44, CLOSE_COMBAT
	db 50, OUTRAGE
	db 0

DugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, BULLDOZE
	db 16, METAL_CLAW
	db 20, SUCKER_PUNCH
	db 24, SLASH
	db 29, IRON_HEAD
	db 32, DIG
	db 38, EARTH_POWER
	db 44, EARTHQUAKE
	db 0

VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, POISONPOWDER
	db 17, PSYBEAM
	db 23, STUN_SPORE
	db 29, SLEEP_POWDER
	db 37, LEECH_LIFE
	db 41, ZEN_HEADBUTT
	db 47, POISON_FANG
	db 55, PSYCHIC_M
	db 0

DewgongEvosMoves:
; Evolutions
	db 0
; Learnset
	db 30, GROWL
	db 35, AURORA_BEAM
	db 44, REST
	db 50, BODY_SLAM
	db 56, ICE_BEAM
	db 0

MissingNo79EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo7AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

CaterpieEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, METAPOD
	db 0
; Learnset
	db 4, POUNCE
	db 0

MetapodEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0
; Learnset
	db 7, HARDEN
	db 9, ELECTROWEB
	db 0

ButterfreeEvosMoves:
; Evolutions
	db 0
; Learnset ;from gen 6
	db 10, CONFUSION
	db 12, POISONPOWDER
	db 13, SLEEP_POWDER
	db 14, STUN_SPORE
	db 16, GUST
	db 22, SUPERSONIC
	db 24, PSYBEAM
	db 28, SILVER_WIND
	db 36, SIGNAL_BEAM
	db 0

MachampEvosMoves:
; Evolutions
	db 0
; Learnset
;;;	db 16, BULLET_PUNCH
	db 18, SUCKER_PUNCH
	db 25, BRICK_BREAK
	db 30, BULLDOZE
	db 36, SEISMIC_TOSS
	db 44, DOUBLE_EDGE
	db 54, CLOSE_COMBAT
	db 0

MissingNo7FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GolduckEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, FURY_SWIPES
	db 12, BUBBLEBEAM
	db 15, DISABLE
	db 18, ZEN_HEADBUTT
	db 21, SCREECH
	db 36, AMNESIA
	db 40, HYDRO_PUMP
	db 0

HypnoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, CONFUSION
	db 13, HEADBUTT
	db 17, POISON_GAS
	db 21, PSYBEAM
	db 25, MEDITATE
	db 32, ZEN_HEADBUTT
	db 37, ANCIENTPOWER
	db 42, PSYCHIC_M
	db 47, AMNESIA
	db 0

GolbatEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, WING_ATTACK
	db 15, QUICK_ATTACK
	db 18, SILVER_WIND
	db 22, HYPNOSIS
	db 26, HAZE
	db 30, CONFUSE_RAY
	db 34, POISON_FANG
	db 50, LEECH_LIFE
	db 0

MewtwoEvosMoves:
; Evolutions
	db 0
; Learnset ;from gen9
	db 8, ANCIENTPOWER
	db 16, PSYCHO_CUT
	db 32, AMNESIA
	db 40, AURA_SPHERE
	db 48, PSYCHIC_M
	db 56, BARRIER
	db 64, RECOVER
	db 80, MIST
	db 0

SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset ;from PLA
	db 1, ROLLOUT
	db 5, TACKLE
	db 9, REST
	db 15, BULLDOZE
	db 21, BODY_SLAM
	db 29, ZEN_HEADBUTT
	db 35, CRUNCH
	db 46, DOUBLE_EDGE
	db 57, HYPER_BEAM
	db 0

MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
	db 15, TACKLE
	db 0

MissingNo86EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo87EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 30, POISON_GAS
	db 33, MINIMIZE
	db 37, SLUDGE
	db 45, HARDEN
	db 53, SCREECH
	db 60, ACID_ARMOR
	db 0

MissingNo8AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

KinglerEvosMoves:
; Evolutions
	db 0
; Learnset
	db 4, HARDEN
	db 8, METAL_CLAW
	db 12, VICEGRIP
	db 20, BUBBLEBEAM
	db 24, STOMP
	db 29, LUNGE
	db 36, SLAM
	db 40, SWORDS_DANCE
	db 44, CRABHAMMER
	db 0

CloysterEvosMoves:
; Evolutions
	db 0
; Learnset
	db 50, SPIKE_CANNON
	db 0

MissingNo8CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, SWIFT
	db 19, SHOCK_WAVE
	db 24, SCREECH
	db 28, ROLLOUT
	db 31, THUNDERBOLT
	db 45, EXPLOSION
	db 0

ClefableEvosMoves:
; Evolutions
	db 0
; Learnset ZA
	db 5, DEFENSE_CURL
	db 8, DOUBLESLAP
	db 13, SING
	db 16, DRAIN_KISS
	db 20, MAGICAL_LEAF
	db 23, METRONOME
	db 25, BUBBLEBEAM
	db 27, LIGHT_SCREEN
	db 31, AMNESIA
	db 35, MINIMIZE
;;;	db 40, MYSTICAL_FIRE
	db 48, MOONBLAST
	db 0

WeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 32, SLUDGE
	db 39, SMOKESCREEN
	db 43, SELFDESTRUCT
	db 49, HAZE
	db 53, EXPLOSION
	db 0

PersianEvosMoves:
; Evolutions
	db 0
; Learnset Gen9
	db 8, POUNCE
	db 10, BITE
	db 15, METAL_CLAW
	db 17, SCREECH
	db 22, FURY_SWIPES
	db 28, POWER_GEM
	db 32, SLASH
	db 36, CRUNCH
	db 48, PLAY_ROUGH
	db 0

MarowakEvosMoves:
; Evolutions
	db 0
; Learnset ;from ZA
	db 12, HEADBUTT
	db 24, BULLDOZE
	db 28, SUCKER_PUNCH
	db 30, SHADOW_BONE
	db 32, FOCUS_ENERGY
	db 38, THRASH
	db 40, BONEMERANG
	db 44, SWORDS_DANCE
	db 0

MissingNo92EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

HaunterEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GENGAR
	db 0
; Learnset
	db 7, HYPNOSIS
	db 11, CONFUSION
	db 27, HAZE
	db 36, SUCKER_PUNCH
	db 48, SHADOW_BALL
	db 60, DREAM_EATER
	db 0

AbraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, KADABRA
	db 0
; Learnset
	db 6, CONFUSION
	db 9, DISABLE
	db 14, ANCIENTPOWER
	db 0

AlakazamEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, PSYBEAM
	db 20, REFLECT
	db 25, RECOVER
	db 31, TRI_ATTACK
	db 35, PSYCHIC_M
	db 42, AMNESIA
	db 0

PidgeottoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 21, WING_ATTACK
	db 25, SILVER_WIND
	db 29, AGILITY
	db 44, MIRROR_MOVE
	db 0

PidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 21, WING_ATTACK
	db 25, SILVER_WIND
	db 29, AGILITY
	db 44, MIRROR_MOVE
	db 0

StarmieEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, RAPID_SPIN
	db 16, MINIMIZE
	db 20, SWIFT
	db 24, PSYBEAM
	db 28, BUBBLEBEAM
	db 32, LIGHT_SCREEN
	db 36, POWER_GEM
	db 40, PSYCHIC_M
	db 48, RECOVER
	db 56, HYDRO_PUMP
	db 0

BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
	db  6, VINE_WHIP
	db  9, LEECH_SEED
	db 12, POISONPOWDER
	db 16, SLEEP_POWDER
	db 19, MAGICAL_LEAF
	db 25, BODY_SLAM
	db 40, AMNESIA
	db 45, DOUBLE_EDGE
	db 55, ENERGY_BALL
	db 0

VenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db  6, VINE_WHIP
	db  9, LEECH_SEED
	db 12, POISONPOWDER
	db 16, SLEEP_POWDER
	db 19, MAGICAL_LEAF
	db 25, BODY_SLAM
	db 40, AMNESIA
	db 45, DOUBLE_EDGE
	db 55, ENERGY_BALL
	db 0

TentacruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, SUPERSONIC
	db 13, WRAP
	db 18, POISON_FANG
	db 22, WATER_GUN
	db 27, CONSTRICT
	db 35, BARRIER
	db 43, SCREECH
	db 50, HYDRO_PUMP
	db 0

MissingNo9CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GoldeenEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, SEAKING
	db 0
; Learnset
	db 19, SUPERSONIC
	db 24, HORN_ATTACK
	db 30, FURY_ATTACK
	db 37, WATERFALL
	db 45, PLAY_ROUGH
	db 54, AGILITY
	db 0

SeakingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, SUPERSONIC
	db 24, HORN_ATTACK
	db 30, FURY_ATTACK
	db 39, WATERFALL
	db 48, PLAY_ROUGH
	db 54, AGILITY
	db 0

MissingNo9FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA0EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA1EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA2EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

PonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0
; Learnset
	db 11, DOUBLE_KICK
	db 17, STOMP
	db 21, FLAME_WHEEL
	db 30, BOUNCE
	db 34, FLAMETHROWER
	db 37, AGILITY
	db 44, FIRE_SPIN
	db 49, HEAT_CRASH
	db 0

RapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, DOUBLE_KICK
	db 17, STOMP
	db 21, FLAME_WHEEL
	db 30, BOUNCE
	db 34, FLAMETHROWER
	db 37, AGILITY
	db 40, HORN_ATTACK
	db 44, FIRE_SPIN
	db 49, HEAT_CRASH
	db 0

RattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
	db 0
; Learnset
	db 4, QUICK_ATTACK
	db 10, BITE
	db 16, HYPER_FANG
	db 23, FOCUS_ENERGY
	db 28, SUPER_FANG
	db 31, BODY_SLAM
	db 0

RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 4, QUICK_ATTACK
	db 10, BITE
	db 16, HYPER_FANG
	db 23, FOCUS_ENERGY
	db 28, SUPER_FANG
	db 31, BODY_SLAM
	db 0

NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset Gen8
	db 3, FOCUS_ENERGY
	db 6, POISON_FANG
	db 9, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 21, FURY_ATTACK
	db 28, SUCKER_PUNCH
	db 30, POISON_JAB
	db 35, PLAY_ROUGH
	db 40, EARTH_POWER
	db 0

NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 3, TAIL_WHIP
	db 6, POISON_FANG
	db 9, DOUBLE_KICK
	db 13, BITE
	db 21, FURY_SWIPES
	db 24, CRUNCH
	db 27, SUPER_FANG
	db 35, PLAY_ROUGH
	db 40, EARTH_POWER
	db 0

GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0
; Learnset ;From BD/SP
	db 1, DEFENSE_CURL
	db 10, ROCK_TOMB
	db 22, BULLDOZE
	db 24, BODY_SLAM
	db 28, ROLLOUT
	db 34, EARTHQUAKE
	db 36, EXPLOSION
	db 42, ROCK_SLIDE
	db 0

PorygonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 23, PSYBEAM
	db 28, RECOVER
	db 35, AGILITY
	db 42, TRI_ATTACK
	db 0

AerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 33, SUPERSONIC
	db 38, BITE
	db 45, BODY_SLAM
	db 54, HYPER_BEAM
	db 0

MissingNoACEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MagnemiteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0
; Learnset
	db 16, SONICBOOM
	db 20, SHOCK_WAVE
	db 24, SCREECH
	db 32, THUNDERBOLT
	db 36, FLASH_CANNON
	db 44, LIGHT_SCREEN
	db 52, THUNDER
	db 0

MissingNoAEEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoAFEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
	db  6, EMBER
	db  8, SMOKESCREEN
	db 12, DRAGONBREATH
	db 17, METAL_CLAW
	db 24, FIRE_FANG
	db 30, SLASH
	db 34, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
	db  6, WATER_GUN
	db  9, WITHDRAW
	db 12, BITE
	db 16, RAPID_SPIN
	db 20, AURORA_BEAM
	db 25, BUBBLEBEAM
	db 31, HEADBUTT
	db 42, HYDRO_PUMP
	db 0

CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db  6, EMBER
	db  8, SMOKESCREEN
	db 12, DRAGONBREATH
	db 17, METAL_CLAW
	db 24, FIRE_FANG
	db 30, SLASH
	db 34, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0
; Learnset
	db  6, WATER_GUN
	db  9, WITHDRAW
	db 12, BITE
	db 16, RAPID_SPIN
	db 22, AURORA_BEAM
	db 27, BUBBLEBEAM
	db 33, HEADBUTT
	db 44, HYDRO_PUMP
	db 0

CharizardEvosMoves:
; Evolutions
	db 0
; Learnset
	db  6, EMBER
	db  8, SMOKESCREEN
	db 12, DRAGONBREATH
	db 17, METAL_CLAW
	db 24, FIRE_FANG
	db 30, SLASH
	db 34, FLAMETHROWER
	db 36, WING_ATTACK
	db 56, FIRE_SPIN
	db 0

MissingNoB5EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FossilKabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FossilAerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MonGhostEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, GLOOM
	db 0
; Learnset
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 19, SLEEP_POWDER
	db 24, ACID
	db 33, MAGICAL_LEAF
	db 46, ENERGY_BALL
	db 0

GloomEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
	db 0
; Learnset
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 19, SLEEP_POWDER
	db 28, ACID
	db 38, MAGICAL_LEAF
	db 52, ENERGY_BALL
	db 0

VileplumeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 19, SLEEP_POWDER
	db 0

BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
	db 10, VINE_WHIP
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 19, SLUDGE
	db 23, MAGICAL_LEAF
	db 33, LEECH_LIFE
	db 40, SLUDGE_BOMB
	db 44, LEAF_BLADE
	db 0

WeepinbellEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
; Learnset
	db 10, VINE_WHIP
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 19, SLUDGE
	db 23, MAGICAL_LEAF
	db 33, LEECH_LIFE
	db 40, SLUDGE_BOMB
	db 44, LEAF_BLADE
	db 0

VictreebelEvosMoves:
; Evolutions
	db 0
; Learnset from gen9
	db 10, VINE_WHIP
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 19, SLUDGE
	db 23, MAGICAL_LEAF
	db 33, LEECH_LIFE
	db 40, SLUDGE_BOMB
	db 44, LEAF_BLADE
	db 0
