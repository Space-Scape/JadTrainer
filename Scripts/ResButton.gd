extends Button

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

func _on_Button_pressed():
	if cooldown.is_ready():
		if Globals.tick == 1:
			yield($"../../../../../Timer","timeout")
			$"../../Potion".play()
			$"../../../Prayers".canPlayDrain = true
			get_parent().frame += 1
			if Globals.canBoostMaxHit:
				Globals.maxHit += 15
			else:
				Globals.maxHit += 0
			Globals.brewDose -= 15
			$"../../../../MaxHit/Panel/RichTextLabel".bbcode_text = "[color=red][center]-" + str(Globals.brewDose)
			Globals.attJad = false
			if get_parent().frame == 4:
				self.disabled = true
			$"../../../OrbContainer/PrayerBar".value += 30
			yield($"../../../../../Timer2","timeout")
		
		elif Globals.tick == 2:
			yield($"../../../../../Timer2","timeout")
			$"../../Potion".play()
			$"../../../Prayers".canPlayDrain = true
			get_parent().frame += 1
			if Globals.canBoostMaxHit:
				Globals.maxHit += 15
			else:
				Globals.maxHit += 0
			Globals.brewDose -= 15
			$"../../../../MaxHit/Panel/RichTextLabel".bbcode_text = "[color=red][center]-" + str(Globals.brewDose)
			Globals.attJad = false
			if get_parent().frame == 4:
				self.disabled = true
			$"../../../OrbContainer/PrayerBar".value += 30
			yield($"../../../../../Timer","timeout")

func _process(delta):
	cooldown.tick(delta)
	
	if Globals.brewDose <= 0:
		Globals.brewDose = 0
		$"../../../../MaxHit/Panel".hide()
	
