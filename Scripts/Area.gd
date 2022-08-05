extends Area

var streak
var zero = 0
var num

onready var numContainer = $"../Viewport/HitsplatNum"

onready var hitSplat = $"../Viewport/HitSplat"
onready var hpBar = $"../Viewport/ProgressBar"

onready var hpOrb = $"../../PrayNode/OrbContainer2/HpBar"
func _on_Player_area_entered(area):
	num = rand_range(0, 100)
	numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
	
	if Globals.prayingMage and area.get_name() == "Fireball":
		hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
		hitSplat.show()
		Globals.hitDmg = false
	if Globals.prayingMage and area.get_name() == "Boulder":
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	
	if Globals.prayingRange and area.get_name() == "Fireball":
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	if Globals.prayingRange and area.get_name() == "Boulder":
		hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
		hitSplat.show()
		Globals.hitDmg = false
	
	if Globals.prayingMelee and area.get_name() == "Fireball":
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	if Globals.prayingMelee and area.get_name() == "Boulder":
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	
	if Globals.prayOff and area.get_name() == "Fireball":
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	if Globals.prayOff and area.get_name() == "Boulder":
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
