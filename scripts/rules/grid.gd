class_name Grid
extends RefCounted

static func is_grid_rank(rank: int) -> bool:
	return rank >= 1 and rank <= 9

static func pos_of(rank: int) -> Vector2i:
	var idx := rank - 1
	return Vector2i(idx % 3, idx / 3)

static func same_row_or_col(a_rank: int, b_rank: int) -> bool:
	var a := pos_of(a_rank)
	var b := pos_of(b_rank)
	return a.x == b.x or a.y == b.y

static func adjacent_hv(a_rank: int, b_rank: int) -> bool:
	var a := pos_of(a_rank)
	var b := pos_of(b_rank)
	return abs(a.x - b.x) + abs(a.y - b.y) == 1

static func row_mates(pos: Vector2i) -> Array[Vector2i]:
	var out: Array[Vector2i] = []
	for r in range(1, 10):
		var p := pos_of(r)
		if p.y == pos.y and p.x != pos.x:
			out.append(p)
	return out

static func col_mates(pos: Vector2i) -> Array[Vector2i]:
	var out: Array[Vector2i] = []
	for r in range(1, 10):
		var p := pos_of(r)
		if p.x == pos.x and p.y != pos.y:
			out.append(p)
	return out
