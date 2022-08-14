extends Spatial

var streak
var zero = 0
var num
var jadHit = 99

onready var numContainer = $"/root/Spatial/ViewportContainer2/Viewport2/HitsplatNum"

onready var hitSplat = $"/root/Spatial/ViewportContainer2/Viewport2/HitSplat"
onready var hpBar = $"/root/Spatial/ViewportContainer2/Viewport2/ProgressBar"

onready var hpOrb = $"/root/Spatial/PrayNode/OrbContainer2/HpBar"

func _on_HitBoxes_area_exited(area):
	num = rand_range(1, jadHit)
	
	if Globals.tick == 1:
		if Globals.prayingMage and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
			numContainer.bbcode_text = ""
		if Globals.prayingRange and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			Globals.hitDmg = true
			if Globals.ate:
				if hpBar.value <= num:
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
				else:
					hpBar.value -= num
					hpOrb.value -= num
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			else:
				hpBar.value -= num
				hpOrb.value -= num
				numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
		if Globals.prayingMelee and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			Globals.hitDmg = true
			if Globals.ate:
				if hpBar.value <= num:
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
				else:
					hpBar.value -= num
					hpOrb.value -= num
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			else:
				hpBar.value -= num
				hpOrb.value -= num
				numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
		if Globals.prayOff and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			Globals.hitDmg = true
			if Globals.ate:
				if hpBar.value <= num:
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
				else:
					hpBar.value -= num
					hpOrb.value -= num
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			else:
				hpBar.value -= num
				hpOrb.value -= num
				numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
		
	elif Globals.tick == 2:
		if Globals.prayingMage and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
			numContainer.bbcode_text = ""
		if Globals.prayingRange and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			Globals.hitDmg = true
			if Globals.ate:
				if hpBar.value <= num:
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
				else:
					hpBar.value -= num
					hpOrb.value -= num
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			else:
				hpBar.value -= num
				hpOrb.value -= num
				numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
		if Globals.prayingMelee and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			Globals.hitDmg = true
			if Globals.ate:
				if hpBar.value <= num:
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
				else:
					hpBar.value -= num
					hpOrb.value -= num
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			else:
				hpBar.value -= num
				hpOrb.value -= num
				numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
		if Globals.prayOff and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatRed.png")
			hitSplat.show()
			numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			Globals.hitDmg = true
			if Globals.ate:
				if hpBar.value <= num:
					hpBar.value -= num
					hpOrb.value -= num
					hpBar.value = 1
					hpOrb.value = 1
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
				else:
					hpBar.value -= num
					hpOrb.value -= num
					numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
			else:
				hpBar.value -= num
				hpOrb.value -= num
				numContainer.bbcode_text = "[center]" + str(num).pad_decimals(0) + "[/center]"
