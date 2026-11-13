DEF W2_BgPaletteData  EQU $d000
DEF W2_SprPaletteData EQU $d040

DEF W2_LastBGP  EQU $d080
DEF W2_LastOBP0 EQU $d081
DEF W2_LastOBP1 EQU $d082

; If W2_TileBasedPalettes is set, each number corresponds to a tile. (takes $180 bytes)
; Otherwise this is a 20x18 map of palettes. (takes $168 bytes)
DEF W2_TilesetPaletteMap           EQU $d200

; Each number here corresponds to a tile, but this isn't used for
; overworld sprites. I've got a better system for that.
DEF W2_SpritePaletteMap            EQU $d400

; Palette calculations for wTileMap are stored here before vblank.
DEF W2_ScreenPalettesBuffer        EQU $d500 ; 32x6 bytes (DMA-able), $d500-$d5c0

DEF W2_TownMapLoaded               EQU $d700
DEF W2_TileBasedPalettes           EQU $d701
DEF W2_StaticPaletteMapChanged     EQU $d702 ; Set to a number >=3 if palette map is modified, since the window is drawn in thirds. Only for when TileBasedPalettes == 0.
DEF W2_UseOBP1                     EQU $d703 ; If set, sprite palettes 4-7 use OBP1 instead of OBP0

; These are like W2_BgPaletteData/SprPaletteData, but they account for BGP/OBP0/OBP1.
DEF W2_BgPaletteDataBuffer         EQU $d704
DEF W2_SprPaletteDataBuffer        EQU $d744

DEF W2_BgPaletteDataModified       EQU $d784
DEF W2_SprPaletteDataModified      EQU $d785

; Analagous to StaticPaletteMapChanged, but only used between Pre-vblank and
; actual-vblank routines.
DEF W2_StaticPaletteMapChanged_vbl EQU $d786

; Former value of [hAutoBGTransferDest + 1]. Should be $98 or $9c.
DEF W2_LastAutoCopyDest            EQU $d787

DEF W2_ForceBGPUpdate              EQU $d788
DEF W2_ForceOBPUpdate              EQU $d789

; Set to 0 when vblank has updated W2_PreVBlankWindowPortion. Used to make sure that the
; pre-vblank routines are in sync with the vblank routines.
DEF W2_UpdatedWindowPortion        EQU $d78a

; Set if a row or column on the map was drawn during the current vblank.
DEF W2_DrewRowOrColumn             EQU $d78b

; Palette of the current pokemon (remembered here so pokemon have correct palette when
; transformed)
DEF W2_BattleMonPalette            EQU $d78c

; Used by "WindowTransferBgRowsAndColors" function. Analagous to H_VBCOPYBGNUMROWS.
DEF W2_VBCOPYBGNUMROWS             EQU $d78d

; Item menus save BG palette slots 2-6:
; 2 = Bag pocket graphic, 3 = unchanged, 4 = TM type,
; 5 = TM category, 6 = item icon (or category in the house move lists).
DEF ITEM_MENU_FIRST_SAVED_PAL      EQU 2
DEF ITEM_MENU_NUM_SAVED_PALS       EQU 5

DEF W2_ItemMenuPalettesActive      EQU $d78e
DEF W2_ItemMenuTileBasedPalettes   EQU $d78f
DEF W2_BagPocketTilesActive        EQU $d791
DEF W2_PPRestoreSavedPaletteMap   EQU $d792 ; two current-PP tiles per move, 8 bytes
DEF W2_PPRestoreSavedPalettes     EQU $d79a ; BG slots 4-5, 16 bytes
DEF W2_BattlePaletteSplitActive  EQU $d7aa
DEF W2_BattleLowerPalette        EQU $d7ab ; slot 6 below scanline 110, 8 bytes
; LCD handlers are serialized: remap and immediately upload before reuse.
DEF W2_BattleSplitPaletteBuffer EQU $d7b3 ; shared BGP-remapped scratch, 8 bytes
DEF W2_BattlePictureSplitActive EQU $d7bb
DEF W2_BattlePicturePalette     EQU $d7bc ; slot 6 after the enemy status row, 8 bytes
DEF W2_BattlePictureReplaced    EQU $d7c4 ; current graphics are not the original front picture
DEF W2_BattlePictureSlot5Active EQU $d7c5 ; upward slide temporarily borrows category palette
DEF W2_BattlePictureTileAttrs   EQU $d7c6 ; 49 front-picture tiles, through $d7f6
DEF W2_BattleTypePalettePending EQU $d7f7 ; bit 0: palette; bit 1: move icon tiles
ASSERT HIGH(W2_BattleLowerPalette) == HIGH(W2_BattleLowerPalette + 7)
ASSERT HIGH(W2_BattlePicturePalette) == HIGH(W2_BattlePicturePalette + 7)
DEF W2_ItemMenuSavedBgPalettes     EQU $d800 ; slots 2-6, $28 bytes
DEF W2_ItemMenuSavedPaletteMap     EQU $d830 ; $180 bytes, through $d9af
DEF W2_BattleBagSavedBackPicTiles  EQU $d9b0 ; last two player-picture tiles, $20 bytes
DEF W2_BattleTypePalette          EQU $d9d0 ; queued shared EXP/type palette, 8 bytes
ASSERT HIGH(W2_BattleTypePalette) == HIGH(W2_BattleTypePalette + 7)
DEF W2_BattleTypeIconTiles        EQU $d9e0 ; 8 queued tiles, through $da5f
ASSERT W2_BattleTypeIconTiles % $10 == 0 ; GDMA source alignment
DEF W2_BagPocketSavedTiles         EQU $db50 ; 20 tiles, through $dc8f
ASSERT W2_BattleTypeIconTiles + 8 tiles <= W2_BagPocketSavedTiles

; Battle info borrows bank 3 only while the LCD is off. Keep clear of the stack.
DEF W3_BattleInfoSavedColorState EQU $d000 ; bank-2 $d000-$d7ff
DEF W3_BattleInfoSavedSprites    EQU $d800 ; sprite tiles $00-$2b
DEF W3_BattleInfoSavedTypes      EQU $dac0 ; BG tiles $40-$4f
DEF W3_BattleInfoSavedBalls      EQU $dbc0 ; BG tiles $60-$64
DEF W3_BattleInfoSavedTileMap    EQU $dc10 ; SCREEN_AREA
DEF W3_BattleInfoSavedOAM        EQU W3_BattleInfoSavedTileMap + SCREEN_AREA
ASSERT W3_BattleInfoSavedOAM + 40 * 4 < $df00

; Saved copy of an individual borrowed slot.
DEF W2_ItemMenuSavedPocketPalette  EQU W2_ItemMenuSavedBgPalettes + (2 - ITEM_MENU_FIRST_SAVED_PAL) * 8
DEF W2_ItemMenuSavedTMPalettes     EQU W2_ItemMenuSavedBgPalettes + (4 - ITEM_MENU_FIRST_SAVED_PAL) * 8 ; slots 4-5
DEF W2_ItemMenuSavedIconPalette    EQU W2_ItemMenuSavedBgPalettes + (6 - ITEM_MENU_FIRST_SAVED_PAL) * 8

; In bank 1, the stack starts at $dfff. So, that's also the stack here when bank 2 is
; loaded. Don't use anything too close to there.
