class_name Outcome
extends RefCounted

enum Type {
	HIT,
	DEFEND,
	COUNTER,
	DOUBLE,
	BLOCK
}
const OUTCOME_NAMES := {
	Type.HIT: "Hit",
	Type.DEFEND: "Defend",
	Type.COUNTER: "Counter",
	Type.DOUBLE: "Double",
	Type.BLOCK: "Block"
}
static func name_of(value: int) -> String:
	return OUTCOME_NAMES.get(value, str(value))
