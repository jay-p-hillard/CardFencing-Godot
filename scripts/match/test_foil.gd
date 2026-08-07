extends Node

func _ready():
	var pile_a: Array[Card] = [
		Card.new(Card.Suit.SPADES, Card.Rank.ACE),
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.SPADES, Card.Rank.TEN),
		Card.new(Card.Suit.SPADES, Card.Rank.THREE),
		Card.new(Card.Suit.SPADES, Card.Rank.KING)
	]

	var pile_b: Array[Card] = [
		Card.new(Card.Suit.HEARTS, Card.Rank.ACE),
		Card.new(Card.Suit.HEARTS, Card.Rank.NINE),
		Card.new(Card.Suit.HEARTS, Card.Rank.JACK),
		Card.new(Card.Suit.HEARTS, Card.Rank.THREE),
		Card.new(Card.Suit.HEARTS, Card.Rank.SEVEN)
	]

	var game := FencingGame.new(pile_a, pile_b, FencingGame.PLAYER_A, FoilRules.new())

	print("A hand: ", game.hand(FencingGame.PLAYER_A))
	print("B hand: ", game.hand(FencingGame.PLAYER_B))
	print("Attacker: ", game.attacker)

	var ok := game.play_attack(0)
	print("Attack selected: ", ok)

	var ex := game.play_defense(0)
	print("Exchange: ", ex)
	print("Score: ", game.score_a, " - ", game.score_b)
	print("Next attacker: ", game.attacker)
