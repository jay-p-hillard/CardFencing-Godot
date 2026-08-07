class_name EpeeResolver
extends RefCounted

static func resolve(attack: Card, parry: Card) -> ExchangeResult:
	var a_rank := int(attack.rank)
	var p_rank := int(parry.rank)

	var a_spec := Special.is_special(a_rank)
	var p_spec := Special.is_special(p_rank)
	
	var a_strong := EpeeRules.is_strong_attack(attack)
	var p_strong := EpeeRules.is_strong_defense(parry)

	if a_rank == p_rank:
		if a_strong and !p_strong:
			return ExchangeResult.new(Outcome.Type.DOUBLE, attack, parry)
		return ExchangeResult.new(Outcome.Type.COUNTER, attack, parry)

	if p_spec:
		if a_strong and !p_strong:
			return ExchangeResult.new(Outcome.Type.DOUBLE, attack, parry)
		return ExchangeResult.new(Outcome.Type.DEFEND, attack, parry)

	if a_spec:
		return ExchangeResult.new(Outcome.Type.HIT, attack, parry)

	if Grid.same_row_or_col(a_rank, p_rank):
		if a_strong and !p_strong:
			return ExchangeResult.new(Outcome.Type.DOUBLE, attack, parry)
		return ExchangeResult.new(Outcome.Type.DEFEND, attack, parry)

	return ExchangeResult.new(Outcome.Type.HIT, attack, parry)
