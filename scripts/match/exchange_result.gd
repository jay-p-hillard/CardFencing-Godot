class_name ExchangeResult
extends RefCounted

var outcome: int
var attack_card: Card
var defend_card: Card
var notes: String = ""

func _init(_outcome: int, _attack_card: Card, _defend_card: Card, _notes: String = ""):
	outcome = _outcome
	attack_card = _attack_card
	defend_card = _defend_card
	notes = _notes

func to_debug_dict() -> Dictionary:
	return {
		"attack_card": attack_card,
		"defend_card": defend_card,
		"outcome": Outcome.name_of(outcome),
		"notes": notes
	}
