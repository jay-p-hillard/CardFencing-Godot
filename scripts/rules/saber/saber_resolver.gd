class_name SaberResolver
extends RefCounted

static func resolve(attack: Card, parry: Card) -> ExchangeResult:
	var a_rank := int(attack.rank)
	var p_rank := int(parry.rank)

	var a_spec := Special.is_special(a_rank)
	var p_spec := Special.is_special(p_rank)

	var a_horizontal := SaberRules.is_horizontal(attack)
	var p_horizontal := SaberRules.is_horizontal(parry)

	var a_hilt := Grid.pos_of(a_rank)
	var p_hilt := Grid.pos_of(p_rank)
	var a_blade := Grid.row_mates(a_hilt) if a_horizontal else Grid.col_mates(a_hilt)
	var p_blade := Grid.row_mates(p_hilt) if p_horizontal else Grid.col_mates(p_hilt)
	
	if a_rank == p_rank:
		return ExchangeResult.new(Outcome.Type.COUNTER, attack, parry)

	if a_spec and p_spec:
		if a_horizontal == p_horizontal:
			return ExchangeResult.new(Outcome.Type.BLOCK, attack, parry)
		else:
			return ExchangeResult.new(Outcome.Type.DEFEND, attack, parry)

	if p_spec:
		return ExchangeResult.new(Outcome.Type.DEFEND, attack, parry)

	if a_spec:
		return ExchangeResult.new(Outcome.Type.HIT, attack, parry)
	#Ok, we have 3 different outcomes for the grid.
	# If defender's hilt is on attacker's blade line, parry/defend
	if p_hilt in a_blade:
		return ExchangeResult.new(Outcome.Type.DEFEND, attack, parry)
	#If the defender's blade is in the same row (crossing blades), Block
	if a_blade.any(func(v): return p_blade.has(v)):
		return ExchangeResult.new(Outcome.Type.BLOCK, attack, parry)
	#Otherwise, HIT	
	return ExchangeResult.new(Outcome.Type.HIT, attack, parry)
	
