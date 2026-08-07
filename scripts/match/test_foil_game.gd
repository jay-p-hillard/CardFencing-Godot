class_name TestFoilGame
extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	run_test()
	
func run_test() -> void:
	print("=== FOIL GAME TEST ===")
	var pile_a: Array[Card] = [
		Card.new(Card.Suit.SPADES, Card.Rank.NINE),
		Card.new(Card.Suit.SPADES, Card.Rank.EIGHT),
		Card.new(Card.Suit.SPADES, Card.Rank.SEVEN),
		Card.new(Card.Suit.SPADES, Card.Rank.SIX),
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.SPADES, Card.Rank.KING),
	]
	var pile_b: Array[Card] = [
		Card.new(Card.Suit.HEARTS, Card.Rank.NINE),
		Card.new(Card.Suit.HEARTS, Card.Rank.EIGHT),
		Card.new(Card.Suit.HEARTS, Card.Rank.SEVEN),
		Card.new(Card.Suit.HEARTS, Card.Rank.SIX),
		Card.new(Card.Suit.HEARTS, Card.Rank.FIVE),
		Card.new(Card.Suit.HEARTS, Card.Rank.TWO),
	]
	var game := FencingGame.new(pile_a, pile_b, FencingGame.PLAYER_A, FoilRules.new())
	
	print_state("Initial", game)
	
	# Exchange 1:
	# A attacks with King of Spades
	# B defends with Two of Hearts
	# Expected outcome: Attack Hit (Special defeats Grid)
	game.play_attack(0)
	var exchange1 := game.play_defense(0)
	
	print_exchange(exchange1)
	print_state("After Exchange 1, ", game)
	print("=== END OF FOIL TEST === ")
func print_state(label: String, game: FencingGame) -> void:
	print("")
	print("---",label,"---")
	print("Score: ", game.score_a, " - ", game.score_b)
	print("Attacker: ", game.attacker)
	print("A Hand: ", game.hand_a)
	print("B Hand: ", game.hand_b)
	print("A Hand Size: ", game.hand_a.size())
	print("B Hand Size: ", game.hand_b.size())
	print("A discard: ", game.discard_a)
	print("B discard: ", game.discard_b)
	
func print_exchange(exchange: Dictionary) -> void:
	print("")
	print("--- Exchange ---")
	print("Number: ", exchange["number"])
	print("Attacker before: ", exchange["attacker_before"])
	print("Attack card: ", exchange["attack_card"])
	print("Defend card: ", exchange["defend_card"])
	print("Outcome: ", exchange["outcome_name"])
	print("Score: ", exchange["score_a"], " - ", exchange["score_b"])
	print("Attacker after: ", exchange["attacker_after"])
