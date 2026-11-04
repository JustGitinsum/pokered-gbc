# pokered-gbc

The Pokemon status screen displays Attack, Defense, Sp.Atk, Sp.Def, and Speed
in the right-hand panel, with types and trainer details on the left without
a vertical divider.
STATUS/OK is omitted; ailments and fainting appear beside the level.
SELECT still toggles stat experience in the same layout. The STATS/STAT EXP
indicator appears in the panel's top border, including when first opened.
RIGHT (or A) opens the moves page; LEFT returns to stats from the moves page.
Returning with LEFT redraws the page without fading or replaying the cry.
The Pokedex shows compact four-tile type badges below the name, with base
stats in two columns and the six-stat total beside the Base Stats heading.
Pokemon base data stores HP, Attack, Defense, Speed, Special Attack, and
Special Defence, in that order. All six base stats use current main-series
(Gen IX) values, including Hisuian values for Hisuian Zorua and Zoroark.
Special damage selects the attacker's Special Attack and defender's Special
Defence. Light Screen doubles Special Defence; critical hits select the
corresponding unmodified stats.
Status, stat-experience, Pokedex, and level-up/Rare Candy panels show both stats.
Growth raises Special Attack, Amnesia sharply raises Special Defence, and
Psychic, Energy Ball, and Flash Cannon can lower Special Defence. Moonblast
and Mystical Fire can lower Special Attack. Existing side-effect chances
are unchanged. Transform and Haze include both stats.
The Volcano Badge still boosts only Special Attack. Calcium and X Special
affect Special Attack; Zinc and X Sp. Def are not added.
Save files and link partners from before the split are incompatible because
Pokemon records and PC box layouts have changed. Start a new save; do not
reuse old saves or save states. PC boxes now hold 18 Pokemon.

LevelUp and TM/HM learnsets show move names only for Pokemon registered as
owned in the Pokedex. Seen-but-unowned Pokemon show dashed move names and
`----` in place of TM/HM labels; learn levels remain visible. Start opens the
selected move's Movedex entry only for owned Pokemon.
All three Learnset pages display the Pokemon's menu icon to the left of its
species name. On Game Boy Color, the icon uses its species palette from
`MonsterPalettes`; the rest of the menu retains its usual colors.
Opening Movedex clears the icon's palette assignments; returning restores them.
The same species palettes color menu icons in the party list, nickname/Name
Rater screen, Bill's PC lists, and the link-trade animation. Each visible
Pokemon has its own palette, including both animation frames; scrolling,
swapping party positions, and returning from other screens restore the colors.
Leaving Bill's PC restores the overworld sprite palettes and clears the icon
assignments. Town/Fly maps also reload their normal sprite palettes on entry.
Party redraws keep the species sprite palettes loaded, and party/PC icons are
placed with their correct palette attributes immediately to avoid color flicker.
Bill's PC rebuilds its lists off-screen after deposits and withdrawals without
blanking the menu. Only party icons hide briefly while their graphics and
palettes reload; they reappear together once the new colors are ready.
Entering Bill's PC or returning from Change Box clears the previous screen
before loading the list graphics and icons.
Fainted party Pokemon (HP = 0) use `PAL_BLACK` for their icons in party and
Bill's PC lists. Reviving them restores their species colors on the next redraw.
Non-fainted party/PC icons use `PAL_PURPLEMON` when poisoned, `PAL_PSYDUCK`
when paralyzed, `PAL_CHARMANDER` when burned, and `PAL_EXP` when frozen.
Curing the status restores the species palette; sleep keeps the species colors.
TM/HM and move-tutor selection menus instead color party icons by the move:
normal species colors for eligible Pokemon, `PAL_BLACK` for incompatible
Pokemon, and blue for Pokemon that already know it. These colors override
HP/status colors only in move-teaching menus; the ABLE/NOT ABLE labels and
existing selected-icon animation are unchanged.

Pokémon Red/Blue overhauled with full GBC support. Made by FroggestSpirit, Drenn, and dannye. Also check out the crysaudio branch.

Connected town/route crossings skip the two-frame palette-settling delay used
when restoring the overworld from menus. Map loading and palette updates still
run normally; doors, stairs, and menu transitions keep their existing timing.
Split-map sprite lookup stays within the loaded sprite set, avoiding a long scan
for offscreen NPCs belonging to the other half of routes such as Route 12.

The Options Menu defaults **MOVE NAME CASE** to **Lower**; **UPPER** remains selectable.
Page 1 contains text speed, Auto Save, battle animation, battle style, and nicknames.
**AUTO SAVE** defaults to **Off**. **On** silently replaces the current save after
entering a different map, including connected routes, once movement and scripts
have settled. Forced movement and NPC escorts defer the save until they finish,
including Oak's escort into the lab. The initial map load and same-map reloads
do not trigger a save.
Full saves copy each data region once and calculate the checksum once to reduce
the Auto Save hitch. Saving remains synchronous; it does not run in the background.
Page 2 contains **MOVE NAME CASE**, **ITEM NAME CASE**, **POKEMON NAME CASE**,
and **TRAINER NAME CASE**, each offering **UPPER** and **Lower** (default).
Pokemon case changes standard species names without rewriting saved nicknames;
custom nicknames and player-entered rival/link trainer names retain their spelling.
Press A on a setting for a normal scrolling dialogue description; press A or B
to advance or dismiss it. Closing the dialogue restores the same page and row.
Press Down to reach the footer, use Left/Right to select **Done** or **Next/Prev**,
then press A. B or START closes the menu from either page. Settings are retained
when switching pages.
**Done** is centered, **Prev** is on the left of page 2, and **Next** is on the
right of page 1.

With **TEXT SPEED** set to **Fast**, walking into a Cut tree or water
automatically uses Cut or Surf, and pushing a boulder automatically activates
Strength. The required badge and a party Pokemon knowing the move are still
required. Automatic attempts are silent, including where Surf is forbidden.
At other text speeds, use the party menu or the A-button Smart HM shortcuts.
The A-button Cut and Surf shortcuts ask for YES/NO confirmation at Medium
and Slow text speeds; Fast skips these prompts.
Strength already activated on the current map remains active at any text speed.

The Options Menu includes **POKEMON NICKNAMES**, which defaults to **Show**.
Use Left/Right to switch it to **Hide** to display species names instead; saved
nicknames are preserved and reappear when the option is switched back to **Show**.
**Hide** also skips nickname prompts for newly received or caught Pokemon, using
their species names instead. The Name Rater remains available for renaming.

The Name Rater in Lavender Town also handles move relearning and deletion.
After his introduction, choose **Rename**, **Relearn**, **Unlearn**, or **See ya!**.
Rename opens the naming screen immediately after selecting a Pokemon, without
rating dialogue or a confirmation prompt.
Relearn and Unlearn open their move lists directly after Pokemon selection.
Their move boxes sit one tile higher, above the unchanged move-description panel.
Like move tutors, his introduction plays only once per map visit; changing maps
resets it, but reloading the same map does not.
The separate Move Relearner and Move Deleter NPCs have been removed.
Relearn lists unknown Lv0 moves first, then evolution moves regardless of level,
then Lv1+ moves up to the Pokemon's current level, without duplicate entries.
The Learnsets LevelUp page uses the same Lv0, evolution, then Lv1+ ordering,
but retains duplicates and shows the full level-up learnset.

Both fossil labs revive Dome Fossils, Helix Fossils, Old Amber, Jaw Fossils
(Tyrunt), and Sail Fossils (Amaura) immediately. Revived Pokemon are level 45
at Cinnabar and level 25 at Route 10. If the party and current PC box are full,
the lab keeps the pending Pokemon; speak to either lab again after making room
to collect it without handing over another fossil. Both labs share one pending
revival.
Like move tutors, each fossil scientist gives their introduction only once
per map visit; changing maps resets it, but reloading the same map does not.

In ordinary wild battles, **SELECT** on the **FIGHT / ITEM / PKMN / RUN** menu
throws the first Poke Ball, Great Ball, Ultra Ball, or Master Ball in Items-pocket
order. **LEFT** while **ITEM** is highlighted cycles through available balls in
that order, wrapping around. Cycling is disabled on all other menu entries.
A left arrow beside the ball appears while ITEM is highlighted if at least two
different ball types are available.
The choice is remembered for the rest of the battle, including submenu returns;
if that ball runs out, the first available ball is selected instead.
The lower-left panel shows a SELECT graphic beside the ball's icon and
two-digit quantity (preceded by **×**). It stays blank when no balls are available
and disappears while using a submenu. Trainer battles, link battles, Safari battles,
and the old man's tutorial do not have this shortcut. Normal capture restrictions
still apply.
Each ball icon has its own palette; the SELECT graphic and quantity retain their
usual colors.

The Mart's Buy screen uses a white background and a borderless item/price list.
A top-left **Bag ×##** box tracks the highlighted item's owned quantity and
clears its text on CANCEL while keeping its border. The purchase quantity box shows only quantity and total price;
the Sell screen retains its existing layout. Item descriptions update as the Buy
cursor moves, with **Exit?** displayed when CANCEL is highlighted.
Live preview updates are scoped to item-list input, so other menus such as
the Pokédex cannot inherit the Buy/Bag overlays from a previous list.
TMs also show their move names directly below their list entries.
The secondary TM/HM move-name lines in Buy and both Bags use the normal text
colors, without a separate palette. Buy confirmation text and its YES/NO box
preserve the item-icon colors, resetting only the description's palettes.
Switching away from TM/HMs restores the description's original text colors,
including on cavern maps with tile-based palettes.
Pocket changes keep the Bag visible without a white-screen transition while
graphics, descriptions, and palette attributes are rebuilt. Only the description
contents briefly clear before their tiles and palettes are reused, preventing the
outgoing TM stats from changing colors. The selected-item icon stays visible.
Loading a map, starting a battle, or opening the Player PC resets the Bag to
the first item in the Items pocket, with no scroll offset.
Returning from Buy to BUY/SELL/QUIT hides the screen until the shop's tiles
and palette attributes are both restored, preventing colored blocks on the map.
Initial Buy entry also hides the shop before loading item/TM palettes; quantity
and confirmation returns keep their existing flash-free redraw.
Returning from the purchase quantity menu redraws without a blank-screen flash.
TM/HM descriptions in Buy, Sell, and Bag use a single stats row with a complete
TypeIcon4Tile badge, category, power, accuracy, and PP. Category icons use their
corresponding colors; the PP icon extends into the right border.
The move/type labels and separate stats box are omitted.
The existing Movedex description appears beneath the stats, using single-spaced
text to fit up to three lines without changing the description wording.
The Buy screen shows the highlighted item's 24x24 graphic to the left of the
list, clearing it on CANCEL or when no matching graphic exists. For TM/HM
entries, this is replaced by the current party's icons in a two-column,
three-row grid, ordered left-to-right. Normal species colors mean the Pokemon
can learn the highlighted move, `PAL_BLACK` means it cannot, and blue means
it already knows the move. Compatibility updates as the cursor moves; the
icons remain visible during quantity selection and purchase confirmation.
Normal-colored icons animate between their two party-icon frames every
10 frames; incompatible and already-known icons stay still.
Bag and Sell icons are unchanged. The
Buy list starts one tile farther right to leave space between the icon and cursor.
The indexed
mapping is in `data/items/icons.asm` and uses only graphics from `gfx/items`.
Vitamins share `vitamin.png`, X items share `battle_item.png`, and all TMs/HMs
share `tm_hm.png`. Link Cable, EXP.ALL, and SILPH SCOPE use the linking cord,
EXP Share, and Silph Scope graphics respectively. Super/Hyper Potions share the
Potion icon, Full Restore shares Max Potion, all Ether/Elixer variants share
Ether, and all Repels share Repel. Dawn Stone uses the Shiny Stone graphic.
Other missing item variants are not substituted.
Gold Teeth, Oak's Parcel, Poke Flute, Jaw Fossil, and Sail Fossil use their
matching graphics.
Each matched Buy icon uses an existing palette (for example, red Poke
Balls, purple Potions, green Leaf Stones, and gold Nuggets). Icon palette
assignments are in `ItemIconPalettes` alongside the graphic pointers; no palette
definitions are added or changed. The original menu palettes are restored when
leaving the panel.
TM/HM discs use their move's type-icon palette rather than a fixed disc color.
The four-tile badges come from `gfx/battle/types4tile.png`; the existing
eight-tile graphics and their loaders are named TypeIcon8Tile and remain in use
on the other type-icon screens.
The four-tile sheet is used without modifying its source colors; existing type
palettes color both the badges and TM/HM discs.
Leaving Buy replaces the displayed screen before restoring the borrowed icon
graphics and palettes, so the outgoing icon and TM stats do not glitch or recolor.
The live Buy preview is reused by the quantity menu rather than redrawn on
selection.
The overworld and in-battle Bags use the same white, borderless item-list
template with live descriptions and selected-item icons. The pocket heading
and arrows remain at the top; list quantities replace Buy's prices. CANCEL
clears the icon and shows `Exit?`. Sell, PC lists, and the scripted Old Man
tutorial retain their original layouts.
The 40x32 pocket graphic from `gfx/pack` appears below the selected-item icon,
uses `PAL_PIKACHU`, and changes with the Items, Key Items, or TM/HM pocket.
It remains visible on CANCEL and in empty pockets in both player Bags.
The registered key item displays the two-tile SELECT icon beside its name in
the Bag; assigning another item moves the marker to that item.
EXP ALL displays the ON or OFF badge from `gfx/gs/on_off.png` beside its name,
reflecting its current USE toggle.
Receiving EXP ALL, depositing it in the PC, or withdrawing it leaves it OFF.
Talking to the aide again does not change the selected state.
Battle Bag transitions hide the outgoing screen before borrowing or restoring
HP-bar tiles for the item and SELECT icons.
The two player-picture tiles shared with the item icon are saved and restored
verbatim, preserving the current battle appearance.
Failed battle Bag item uses return to the Bag rather than the quick-ball
shortcut's battle-menu destination.
Overworld Bag entry and exit use a white transition while the tilemap and
palettes change, preventing the map or Bag from appearing in the other's colors.
The full-screen Bag keeps its normal colors in unlit caves; closing it restores
the cave's darkness without requiring or activating FLASH.
Using FLASH on either floor of Rock Tunnel permanently lights both floors for
that save, including after leaving and re-entering the tunnel.
Bag exit waits for all three screen thirds to receive their restored palette
attributes before revealing the overworld, including exits from the TM pocket.
Choosing TOSS keeps the icon and description visible throughout quantity
selection; preview cleanup is reserved for items that open another screen or
return to the overworld. Confirmation text can replace the description normally.
Rejected field-item uses, such as trying to ride the Bicycle indoors, retain
the icon; cleanup waits until the item actually switches to the overworld.
Screen-changing uses hide the entire Bag together before clearing its preview
and restoring borrowed graphics and palettes.
Returning from an item's party menu rebuilds the Bag directly, without restoring
an intermediate overworld screen or repeating the Bag-entry transition.

The learn-move menu starts on the new move in its own box above the four known
moves. Up/Down browses all five moves, updating a shared TM/HM-style stats and
description panel. A on the new move displays the forget prompt; A on a known
move selects it for replacement. HMs remain protected, and B cancels learning.
The Move Reminder and Move Deleter also show the shared TM/HM-style stats and
description panel while browsing their move lists. CANCEL clears the move info
and shows `Exit?`.
Move-list previews retain their palettes while scrolling and use the house's
unused palette slots, keeping the surrounding map colors unchanged.
The Move Reminder's lessons are free, with no money requirement or deduction.
Declining to replace a move or canceling the forget-move screen returns to the
Reminder's move list for the same Pokemon. Canceling that list still ends the visit.
Ether, Max Ether, and PP Max use a dedicated move selector with each move's
current PP / maximum PP on the row beneath its name, including PP Max bonuses.
Elixir and Max Elixir continue to restore all moves without a move selector.

Original README follows...

# Pokémon Red and Blue [![Build Status][ci-badge]][ci]

This is a disassembly of Pokémon Red and Blue.

It builds the following ROMs:

- Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- BLUEMONS.GB (debug build) `sha1: 5b1456177671b79b263c614ea0e7cc9ac542e9c4`
- dmgapae0.e69.patch `sha1: 0fb5f743696adfe1dbb2e062111f08f9bc5a293a`
- dmgapee0.e68.patch `sha1: ed4be94dc29c64271942c87f2157bca9ca1019c7`

To set up the repository, see [**INSTALL.md**](INSTALL.md).


## See also

- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
- [**Tools**][tools]

You can find us on [Discord (pret, #pokered)](https://discord.gg/d5dubZ3).

For other pret projects, see [pret.github.io](https://pret.github.io/).

[wiki]: https://github.com/pret/pokered/wiki
[tutorials]: https://github.com/pret/pokered/wiki/Tutorials
[symbols]: https://github.com/pret/pokered/tree/symbols
[tools]: https://github.com/pret/gb-asm-tools
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
