class_name FencingGame
extends RefCounted

const PLAYER_A := 0
const PLAYER_B := 1

var pile_a: Array[Card] = []
var pile_b: Array[Card] = []
var hand_a: Array[Card] = []
var hand_b: Array[Card] = []
var discard_a: Array[Card] = []
var discard_b: Array[Card] = []

var rules: FencingRules
var attacker: int = PLAYER_A
var score_a := 0
var score_b := 0
var exchange_number := 0

var pending_attack_card: Card = null
var pending_attacker := PLAYER_A

func _init(_pile_a: Array[Card], _pile_b: Array[Card], _starting_attacker: int, _rules: FencingRules):
	pile_a = _pile_a
	pile_b = _pile_b
	attacker = _starting_attacker
	rules = _rules
	_refill_hands()

func hand(player: int) -> Array[Card]:
	return hand_a if player == PLAYER_A else hand_b

func play_attack(hand_index: int) -> bool:
	if pending_attack_card != null:
		return false
	var src := hand(attacker)
	if hand_index < 0 or hand_index >= src.size():
		return false

	pending_attack_card = src[hand_index]
	src.remove_at(hand_index)
	_discard(attacker, pending_attack_card)
	pending_attacker = attacker
	return true

func play_defense(hand_index: int) -> Dictionary:
	if pending_attack_card == null:
		return {}

	var defender := PLAYER_B if pending_attacker == PLAYER_A else PLAYER_A
	var src := hand(defender)
	if hand_index < 0 or hand_index >= src.size():
		return {}

	var defend_card: Card = src[hand_index]
	src.remove_at(hand_index)
	_discard(defender, defend_card)

	var attack_card := pending_attack_card
	pending_attack_card = null

	var result := rules.resolve(attack_card, defend_card)
	var deltas := rules.score_delta(pending_attacker, result)
	score_a += deltas.x
	score_b += deltas.y

	var attacker_before := pending_attacker
	var attacker_hand_empty := hand(attacker_before).is_empty()
	attacker = rules.next_attacker(attacker_before, result, attacker_hand_empty)

	exchange_number += 1
	if rules.should_refill_hands(result):
		_refill_hands()

	_check_hand_exhaustion()
	return {
		"number": exchange_number,
		"attacker_before": attacker_before,
		"attack_card": attack_card,
		"defend_card": defend_card,
		"outcome": result.outcome,
		"outcome_name": Outcome.name_of(result.outcome),
		"score_a": score_a,
		"score_b": score_b,
		"attacker_after": attacker
	}

func is_game_over() -> bool:
	return rules.is_game_over(score_a, score_b, hand_a, hand_b, pile_a, pile_b)

func _refill_hands():
	while hand_a.size() < rules.hand_size() and not pile_a.is_empty():
		hand_a.append(pile_a.pop_back())
	while hand_b.size() < rules.hand_size() and not pile_b.is_empty():
		hand_b.append(pile_b.pop_back())

func _discard(player: int, card: Card):
	if player == PLAYER_A:
		discard_a.append(card)
	else:
		discard_b.append(card)
		
func _check_hand_exhaustion():
	if hand_a.is_empty() and hand_b.is_empty():
		if not pile_a.is_empty() or not pile_b.is_empty():
			_refill_hands()
