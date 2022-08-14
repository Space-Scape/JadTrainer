extends Spatial

var streak
var zero = 0
var num
var jadHit = 99
var jadCanMelee = false

onready var numContainer = $"/root/Spatial/ViewportContainer2/Viewport2/HitsplatNum"

onready var hitSplat = $"/root/Spatial/ViewportContainer2/Viewport2/HitSplat"
onready var hpBar = $"/root/Spatial/ViewportContainer2/Viewport2/ProgressBar"

onready var hpOrb = $"/root/Spatial/PrayNode/OrbContainer2/HpBar"

func _on_MeleeDistance_area_entered(area):
	if area.get_name() == "Player":
		print("test")
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
				numContainer.bbcode_text = ""
			
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
				numContainer.bbcode_text = ""
