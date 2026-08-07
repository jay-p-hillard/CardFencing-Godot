class_name EpeeRules
extends FencingRules

const PLAYER_A := 0
const PLAYER_B := 1

static func is_strong_attack(card: Card) -> bool:
	return card.suit == Card.Suit.SPADES or card.suit == Card.Suit.HEARTS
static func is_strong_defense(card: Card) -> bool:
	return card.suit == Card.Suit.CLUBS or card.suit == Card.Suit.DIAMONDS

func resolve(attack: Card, defend: Card) -> ExchangeResult:
	return EpeeResolver.resolve(attack, defend)

func score_delta(attacker_before: int, result: ExchangeResult) -> Vector2i:
	match result.outcome:
		Outcome.Type.HIT:
			return Vector2i(1, 0) if attacker_before == PLAYER_A else Vector2i(0, 1)
		Outcome.Type.COUNTER:
			return Vector2i(0, 1) if attacker_before == PLAYER_A else Vector2i(1, 0)
		Outcome.Type.DOUBLE:
			return Vector2i(1, 1)
		_:
			return Vector2i.ZERO

func next_attacker(attacker_before: int, result: ExchangeResult, attacker_hand_empty: bool = false) -> int:
	if result.outcome == Outcome.Type.COUNTER or result.outcome == Outcome.Type.DOUBLE:
		return attacker_before
	return PLAYER_B if attacker_before == PLAYER_A else PLAYER_A

func hand_size() -> int:
	return 5
func should_refill_hands(result: ExchangeResult) -> bool:
	return result.outcome != Outcome.Type.DEFEND
func is_game_over(score_a: int, score_b: int, hand_a: Array, hand_b: Array, pile_a: Array, pile_b: Array) -> bool:
	if (score_a >= 5 or score_b >= 5 )and score_a != score_b:
		return true
	return pile_a.is_empty() and pile_b.is_empty() and hand_a.is_empty() and hand_b.is_empty()
