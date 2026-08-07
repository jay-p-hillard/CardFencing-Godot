class_name MatchState
extends RefCounted

var score_a := 0
var score_b := 0
var attacker := 0
var exchange_number := 1

func award_point_to_attacker():
	if attacker == 0:
		score_a += 1
	else:
		score_b += 1

func award_double():
	score_a += 1
	score_b += 1

func switch_attacker():
	attacker = 1 - attacker
