extends Area

var streak
var zero = 0
var num
var jadHit = 99

onready var numContainer = $"../../Viewport2/HitsplatNum"

onready var hitSplat = $"../../Viewport2/HitSplat"
onready var hpBar = $"../../Viewport2/ProgressBar"

onready var hpOrb = $"../../PrayNode/OrbContainer2/HpBar"

func _on_Player_area_entered(area):
	num = rand_range(0, jadHit)
	numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
	
	if Globals.tick == 1:
		if Globals.prayingMage and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
		if Globals.prayingMage and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayingRange and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayingRange and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
		if Globals.prayingMelee and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayingMelee and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayOff and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayOff and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		
	elif Globals.tick == 2:
		if Globals.prayingMage and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
		if Globals.prayingMage and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayingRange and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayingRange and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
		if Globals.prayingMelee and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayingMelee and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayOff and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
		if Globals.prayOff and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			if Globals.ate:
				if hpBar.value <= num:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
				else:
					Globals.hitDmg = true
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value += 1
					hpOrb.value += 1
			else:
				hpBar.value -= num
				hpOrb.value -= num
				Globals.hitDmg = true
