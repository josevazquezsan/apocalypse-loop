extends Node

var money: float = 0.0
var mine_xp: float = 0.0
var mine_level: int = 1

var knowledge: float = 0.0

var ore_inventory: Dictionary = {
    "stone": 0,
    "coal": 0,
    "iron": 0,
    "gold": 0,
    "diamond": 0
}

var ore: Dictionary = {
    "stone": {"xp": 5, "value": 1},
    "coal": {"xp": 10, "value": 5},
    "iron": {"xp": 20, "value": 15},
    "gold": {"xp": 50, "value": 50},
    "diamond": {"xp": 100, "value": 200}
}

signal money_changed(new_value)
signal ore_changed(new_value)
signal knowledge_changed(new_value)
signal job_level_changed(new_value)
signal prestige_triggered

# --- Multipliers (boosted by knowledge upgrades) ---
var money_multiplier: float = 1.0
var mine_xp_multiplier: float = 1.0

# --- XP thresholds per mine level ---
func get_xp_required() -> float:
    return mine_level * 100.0

func add_money(amount: float) -> void:
    money += amount * money_multiplier
    emit_signal("money_changed", money)

func add_mine_xp(amount: float) -> void:
    mine_xp += amount * mine_xp_multiplier
    if mine_xp >= get_xp_required():
        mine_xp -= get_xp_required()
        mine_level += 1
        emit_signal("job_level_changed", mine_level)
    emit_signal("ore_changed", mine_xp)

func add_knowledge(amount: float) -> void:
    knowledge += amount
    emit_signal("knowledge_changed", knowledge)

# --- Prestige ---
func prestige() -> void:
    var earned = calculate_knowledge()
    add_knowledge(earned)
    money = 0.0
    mine_xp = 0.0
    mine_level = 1
    emit_signal("money_changed", money)
    emit_signal("ore_changed", mine_xp)
    emit_signal("job_level_changed", mine_level)
    emit_signal("prestige_triggered")

func calculate_knowledge() -> float:
    return floor(money / 100.0) + float(mine_level - 1) * 2.0

func add_ore(type: String, amount: int) -> void:
    if ore.has(type):
        ore_inventory[type] += amount
        add_mine_xp(ore[type]["xp"] * amount)
        emit_signal("ore_changed", ore_inventory)
