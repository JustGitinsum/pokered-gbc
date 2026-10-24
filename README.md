# pokered-gbc

LevelUp and TM/HM learnsets show move names only for Pokemon registered as
owned in the Pokedex. Seen-but-unowned Pokemon show dashed move names and
`----` in place of TM/HM labels; learn levels remain visible. Start opens the
selected move's Movedex entry only for owned Pokemon.

Pokémon Red/Blue overhauled with full GBC support. Made by FroggestSpirit, Drenn, and dannye. Also check out the crysaudio branch.

The Options Menu includes **POKEMON NICKNAMES**, which defaults to **SHOW**.
Use Left/Right to switch it to **HIDE** to display species names instead; saved
nicknames are preserved and reappear when the option is switched back to **SHOW**.
**HIDE** also skips nickname prompts for newly received or caught Pokemon, using
their species names instead. The Name Rater remains available for renaming.

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
The secondary TM/HM move-name lines in Buy and both Bags use `PAL_LOGO1`;
item names, prices, quantities, and descriptions keep their existing colors.
USE/TOSS and quantity boxes reset colors only within their own borders.
Buy confirmation text and its YES/NO box preserve the move-name and item-icon
colors, resetting only the description and the YES/NO box's covered cells.
The move-name palette remains loaded through cursor and pocket redraws and is
restored only after hiding the Bag or replacing the Buy screen.
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
list, clearing it on CANCEL or when no matching graphic exists. The
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
