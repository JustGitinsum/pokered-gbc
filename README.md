# pokered-gbc

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
TMs also show their move names directly below their list entries.
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
