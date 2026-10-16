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
