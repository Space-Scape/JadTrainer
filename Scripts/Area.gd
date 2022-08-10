extends Area

var streak
var zero = 0
var num
var jadHit = 99
var jadCanMelee = false

onready var numContainer = $"../../ViewportContainer2/Viewport2/HitsplatNum"

onready var hitSplat = $"../../ViewportContainer2/Viewport2/HitSplat"
onready var hpBar = $"../../ViewportContainer2/Viewport2/ProgressBar"

onready var hpOrb = $"../../PrayNode/OrbContainer2/HpBar"

func _process(delta):
	if $"../../Jad/Jad_Att/AttScript".number != null:
		if $"../../Jad/Jad_Att/AttScript".attWithMage:
				$"MageHitbox5".disabled = false
				$"MageHitbox4".disabled = false
				$"MageHitbox3".disabled = false
				$"MageHitbox2".disabled = false
				$"MageHitbox".disabled = false
		if $"../../Jad/Jad_Att/AttScript".attWithRanged:
				$"MageHitbox5".disabled = true
				$"MageHitbox4".disabled = true
				$"MageHitbox3".disabled = true
				$"MageHitbox2".disabled = true
				$"MageHitbox".disabled = true


func _on_Player_area_entered(area):
	num = rand_range(1, jadHit)
	
	if Globals.tick == 1:
		if Globals.prayingMage and area.get_name() == "Fireball":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
		if Globals.prayingMage and area.get_name() == "Boulder":
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
		if Globals.prayingRange and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
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
		if Globals.prayingMelee and area.get_name() == "Boulder":
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
		if Globals.prayOff and area.get_name() == "Boulder":
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
		if Globals.prayingMage and area.get_name() == "Boulder":
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
		if Globals.prayingRange and area.get_name() == "Boulder":
			hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
			hitSplat.show()
			Globals.hitDmg = false
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
		if Globals.prayingMelee and area.get_name() == "Boulder":
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
		if Globals.prayOff and area.get_name() == "Boulder":
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

func _on_Area_area_entered(area):
	if area.get_name() == "Player":
		jadCanMelee = true

func _on_MeleeDistance_area_exited(area):
	if area.get_name() == "Player":
		jadCanMelee = false
		Globals.attWithMelee = false

func _on_Melee_area_exited(area):
	if area.get_name() == "Player":
		if Globals.tick == 1:
			if !Globals.prayingMelee:
				hitSplat.texture = load("res://Sprites/hitsplatRed.png")
				hitSplat.show()
				num = rand_range(1, jadHit)
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
			if Globals.prayingMelee and $"../../Jad/Jad_Att/AttScript".attWithMelee:
				hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
				hitSplat.show()
				Globals.hitDmg = false
			
		elif Globals.tick == 2:
			jadCanMelee = true
			if !Globals.prayingMelee:
				hitSplat.texture = load("res://Sprites/hitsplatRed.png")
				hitSplat.show()
				num = rand_range(1, jadHit)
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
			if Globals.prayingMelee and $"../../Jad/Jad_Att/AttScript".attWithMelee:
				hitSplat.texture = load("res://Sprites/hitsplatBlue.png")
				hitSplat.show()
				Globals.hitDmg = false

