class_name ExchangeLog
extends RefCounted

var entries: Array = []

func add_entry(entry: Dictionary) -> void:
	entries.append(entry)

func print_latest() -> void:
	if entries.is_empty():
		return
	print(entries.back())
