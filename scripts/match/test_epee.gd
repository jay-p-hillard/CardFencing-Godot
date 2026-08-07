class_name TestEpee
extends Node

var rules := EpeeRules.new()

func _ready() -> void:
	run_tests()

func run_tests() -> void:
	print("=== EPEE TESTS ===")
	print_case(
		"Strong attack vs weak defense on line -> DOUBLE",
		Card.new(Card.Suit.SPADES, Card.Rank.ACE),
		Card.new(Card.Suit.HEARTS, Card.Rank.TWO),
		0
	)

	print_case(
		"Strong attack vs strong defense on line -> DEFEND",
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.CLUBS, Card.Rank.TWO),
		0
	)

	print_case(
		"Strong attack vs no line -> HIT",
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.CLUBS, Card.Rank.SEVEN),
		0
	)

	print_case(
		"Matching rank strong into weak -> DOUBLE",
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.HEARTS, Card.Rank.FIVE),
		0
	)

	print_case(
		"Matching rank not strong into weak -> COUNTER",
		Card.new(Card.Suit.CLUBS, Card.Rank.FIVE),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.FIVE),
		0
	)

	print_case(
		"Special defense against normal attack -> DEFEND or DOUBLE depending on strength",
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.HEARTS, Card.Rank.QUEEN),
		0
	)

	print_case(
		"Special attack against normal defense -> HIT",
		Card.new(Card.Suit.SPADES, Card.Rank.KING),
		Card.new(Card.Suit.CLUBS, Card.Rank.FIVE),
		0
	)

	print("=== END EPEE TESTS ===")

func print_case(label: String, attack: Card, defend: Card, attacker_before: int) -> void:
	var result: ExchangeResult = rules.resolve(attack, defend)
	var delta: Vector2i = rules.score_delta(attacker_before, result)
	var next_attacker: int = rules.next_attacker(attacker_before, result)
	
	print("")
	print(label)
	print("Attack: ", attack)
	print("Defense: ", defend)
	print("Outcome: ", Outcome.name_of(result.outcome))
	print("Score delta: ", delta)
	print("Next attacker: ", next_attacker)
	print("Refill Hands: ", rules.should_refill_hands(result))
