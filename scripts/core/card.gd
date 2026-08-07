class_name Card
extends RefCounted

enum Suit { SPADES, HEARTS, DIAMONDS, CLUBS }
enum Rank { ACE = 1, TWO = 2, THREE = 3, FOUR = 4, FIVE = 5, SIX = 6, SEVEN = 7, EIGHT = 8, NINE = 9, TEN = 10, JACK = 11, QUEEN = 12, KING = 13 }

const SUIT_NAMES := ["Spades", "Hearts", "Diamonds", "Clubs"]
const RANK_NAMES := {
	1: "Ace",
	2: "2",
	3: "3",
	4: "4",
	5: "5",
	6: "6",
	7: "7",
	8: "8",
	9: "9",
	10: "10",
	11: "Jack",
	12: "Queen",
	13: "King"
}

var suit: Suit
var rank: Rank

func _init(_suit: Suit, _rank: Rank):
	suit = _suit
	rank = _rank
	
func get_rank_name() -> String:
	return RANK_NAMES.get(int(rank), str(rank))

func get_suit_name() -> String:
	return SUIT_NAMES[int(suit)]

func _to_string() -> String:
	return "%s of %s" % [get_rank_name(), get_suit_name()]
