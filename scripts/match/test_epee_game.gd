class_name TestEpeeGame
extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	run_test()
	
func run_test() -> void:
	print("=== EPEE GAME TEST ===")
	var pile_a: Array[Card] = [
		Card.new(Card.Suit.CLUBS, Card.Rank.NINE),
		Card.new(Card.Suit.SPADES, Card.Rank.TEN),
		Card.new(Card.Suit.SPADES, Card.Rank.NINE),
		Card.new(Card.Suit.SPADES, Card.Rank.SEVEN),
		Card.new(Card.Suit.CLUBS, Card.Rank.FIVE),
		Card.new(Card.Suit.SPADES, Card.Rank.SIX),
		Card.new(Card.Suit.CLUBS, Card.Rank.TEN),
		Card.new(Card.Suit.SPADES, Card.Rank.EIGHT),
	]
	var pile_b: Array[Card] = [
		Card.new(Card.Suit.HEARTS, Card.Rank.TEN),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.TEN),
		Card.new(Card.Suit.HEARTS, Card.Rank.EIGHT),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.EIGHT),
		Card.new(Card.Suit.HEARTS, Card.Rank.SIX),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.FIVE),
		Card.new(Card.Suit.HEARTS, Card.Rank.KING),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.NINE),
	]
	var game := FencingGame.new(pile_a, pile_b, FencingGame.PLAYER_A, EpeeRules.new())
	
	print_state("Initial", game)
	
	# Exchange 1:
	# A attacks with EIGHT of Spades
	# B defends with NINE of Diamonds
	# Expected outcome: Attack Defended (Grid(9)+ parries Grid(8)+)
	game.play_attack(0)
	var exchange1 := game.play_defense(0)
	
	print_exchange(exchange1)
	print_state("After Exchange 1, ", game)
	
	# Exchange 2:
	# B attacks with KING of Hearts
	# A defends with TWO of Spades
	# Expected outcome: Attack Hit (Special defeats Grid)
	game.play_attack(0)
	var exchange2 := game.play_defense(0)
	
	print_exchange(exchange2)
	print_state("After Exchange 2, ", game)
	# Exchange 2:
	# A attacks with SIX of Spades
	# B defends with FIVE of Hearts
	# Expected outcome: Double (Grid(9)+ Doubles Grid(8)-)
	game.play_attack(0)
	var exchange3 := game.play_defense(0)
	
	print_exchange(exchange3)
	print_state("After Exchange 3, ", game)
	
	game.play_attack(0)
	var exchange4 := game.play_defense(0)
	
	print_exchange(exchange4)
	print_state("After Exchange 4, ", game)
	
	game.play_attack(0)
	var exchange5 := game.play_defense(0)
	
	print_exchange(exchange5)
	print_state("After Exchange 5, ", game)
	print("=== END OF EPEE TEST === ")
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
