extends Area

var streak
var zero = 0
var num

onready var numContainer = $"../3DPlayer/Viewport/HitsplatNum"

onready var hitSplat = $"../3DPlayer/Viewport/HitSplat"
onready var streakCounter = $"../PrayNode/StreakCounter"
onready var hpBar = $"../3DPlayer/Viewport/ProgressBar"

onready var hpOrb = $"../PrayNode/OrbContainer2/HpBar"
func _on_Player_area_entered(area):
	var val = int(streakCounter.get_text())
	num = rand_range(0, 100)
	numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
	
	if Globals.prayingMage and area.get_name() == "Fireball":
		streakCounter.set_text(str(val+1))
		hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
		hitSplat.show()
		Globals.hitDmg = false
	if Globals.prayingMage and area.get_name() == "Boulder":
		streakCounter.set_text(str(zero))
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
		
	
	if Globals.prayingRange and area.get_name() == "Fireball":
		streakCounter.set_text(str(zero))
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	if Globals.prayingRange and area.get_name() == "Boulder":
		streakCounter.set_text(str(val+1))
		hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
		hitSplat.show()
		Globals.hitDmg = false
		
	
	if Globals.prayOff or Globals.prayingMelee and area.get_name() == "Fireball":
		streakCounter.set_text(str(zero))
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
	if Globals.prayOff or Globals.prayingMelee and area.get_name() == "Boulder":
		streakCounter.set_text(str(zero))
		hitSplat.texture = load("res://Sprites/hitsplatRed.png")
		hpBar.value -= num
		hpOrb.value -= num
		hitSplat.show()
		Globals.hitDmg = true
