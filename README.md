# Card Fencing (Full Build)

🚧 **Work in progress** — rule sets are fully designed and demoed in text form; UI and full gameplay in progress.

> Note: this is the in-development Godot version, aiming for a complete playable game across five modes with UI and (eventually) online play. For a finished, compact proof of concept of the same core mechanics, see the [Java version](https://github.com/jay-p-hillard/CardFencing-Java).

A turn-based card strategy game simulating a fencing bout, with five planned game modes:

| Mode         | Weapon | Summary                                                  |
|--------------|--------|----------------------------------------------------------|
| Foil Rush    | Foil   | Fast-paced simultaneous draw, first to 5 points          |
| 5-Card Foil  | Foil   | Hand of 5, face-down exchange, right-of-way resolution   |
| 5-Card Épée  | Épée   | Suit strength matters; double touches possible           |
| 3-Card Épée  | Épée   | "One touch" — single score wins outright                 |
| 5-Card Saber | Saber  | Adds blocking alongside parrying; suits define direction |

## Origin

The rule set here came out of working through the resolution mechanics for [Grid Fencing](https://github.com/jay-p-hillard/GridFencing-Godot), the real-time joystick-based version of the same idea. While testing that logic, I used a physical deck of playing cards to represent the attack/defense grid — and realized the result was a fully playable turn-based game on its own. The additional scoring and play rules (right-of-way, double touches, weapon-specific mechanics) came from my own fencing background.

## What's built so far

- All five rule sets are fully worked out and demoed in text form (exchange resolution logic is implemented and verified)
- UI, full interactive gameplay, and game-mode selection are still in progress

## Design approach

The rule sets are built modularly so the game can come together in stages — starting with a shared resolution engine, then a common game grid intended to eventually support local 1v1, local 1v-computer, and online 1v1 play.

## Tech

- **Godot 4.x** (GDScript)

## License

MIT License — see [`LICENSE`](LICENSE) for details.
