extends Node

func _ready():
	var pile_a: Array[Card] = [		
		Card.new(Card.Suit.CLUBS, Card.Rank.KING),		
		Card.new(Card.Suit.CLUBS, Card.Rank.ACE),
		Card.new(Card.Suit.CLUBS, Card.Rank.FIVE),
		Card.new(Card.Suit.CLUBS, Card.Rank.TEN),
		Card.new(Card.Suit.CLUBS, Card.Rank.THREE),
		Card.new(Card.Suit.SPADES, Card.Rank.KING),		
		Card.new(Card.Suit.SPADES, Card.Rank.ACE),
		Card.new(Card.Suit.SPADES, Card.Rank.FIVE),
		Card.new(Card.Suit.SPADES, Card.Rank.TEN),
		Card.new(Card.Suit.SPADES, Card.Rank.THREE),

	]

	var pile_b: Array[Card] = [
		Card.new(Card.Suit.DIAMONDS, Card.Rank.QUEEN),
		Card.new(Card.Suit.HEARTS, Card.Rank.NINE),
		Card.new(Card.Suit.HEARTS, Card.Rank.THREE),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.JACK),
		Card.new(Card.Suit.HEARTS, Card.Rank.SEVEN),
		Card.new(Card.Suit.HEARTS, Card.Rank.QUEEN),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.NINE),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.THREE),
		Card.new(Card.Suit.HEARTS, Card.Rank.JACK),
		Card.new(Card.Suit.DIAMONDS, Card.Rank.SEVEN)
	]

	var game := FencingGame.new(pile_a, pile_b, FencingGame.PLAYER_A, SaberRules.new())

	print("A hand: ", game.hand(FencingGame.PLAYER_A))
	print("B hand: ", game.hand(FencingGame.PLAYER_B))
	print("Attacker: ", game.attacker)

	#Exchange 1
	var ok := game.play_attack(0)
	print("Attack selected: ", ok)
	var ex := game.play_defense(0)
	printExchange(ex, game)
	
	#Exchange 2	
	ok = game.play_attack(0)
	print("Attack selected: ", ok)
	ex = game.play_defense(0)
	printExchange(ex, game)
	
	#Exchange 3
	ok = game.play_attack(0)
	print("Attack selected: ", ok)
	ex = game.play_defense(0)
	printExchange(ex, game)
		
	#Exchange 4
	ok = game.play_attack(0)
	print("Attack selected: ", ok)
	ex = game.play_defense(0)
	printExchange(ex, game)
	
	#Exchange 5
	ok = game.play_attack(0)
	print("Attack selected: ", ok)
	ex = game.play_defense(0)
	printExchange(ex, game)
	
	print("Game over: ", game.is_game_over())
		
func printExchange(ex: Dictionary, game: FencingGame):
	print("Exchange: ", ex)
	print("Score: ", game.score_a, " - ", game.score_b)
	print("A hand: ", game.hand(FencingGame.PLAYER_A))
	print("B hand: ", game.hand(FencingGame.PLAYER_B))	
	print("Next attacker: ", game.attacker)
