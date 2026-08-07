class_name Special
extends RefCounted

static func is_fleche(rank: int) -> bool:
	return rank == 10

static func is_bind(rank: int) -> bool:
	return rank == 11 or rank == 12 or rank == 13

static func is_special(rank: int) -> bool:
	return is_fleche(rank) or is_bind(rank)

static func number_label(rank: int) -> int:
	return rank
