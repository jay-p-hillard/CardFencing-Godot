class_name FencingRules
extends RefCounted

func resolve(attack: Card, defend: Card) -> ExchangeResult:
	push_error("resolve() not implemented")
	return ExchangeResult.new(Outcome.Type.DEFEND, attack, defend)

func score_delta(attacker_before: int, result: ExchangeResult) -> Vector2i:
	push_error("score_delta() not implemented")
	return Vector2i.ZERO

func next_attacker(attacker_before: int, result: ExchangeResult, attacker_hand_empty: bool) -> int:
	push_error("next_attacker() not implemented")
	return attacker_before

func hand_size() -> int:
	return 5
	
func should_refill_hands(result: ExchangeResult) -> bool:
	return true

func is_game_over(score_a: int, score_b: int, hand_a: Array, hand_b: Array, pile_a: Array, pile_b: Array) -> bool:
	push_error("is_game_over() not implemented")
	return false
