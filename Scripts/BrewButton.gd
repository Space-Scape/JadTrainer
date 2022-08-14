extends Button

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

var brewMaxHit

func _on_Button_pressed():
	if cooldown.is_ready():
		Globals.canBoostMaxHit = true
		$"../../../../MaxHit/Panel".show()
		Globals.brewDose += 5
		Globals.maxHit -= 5
		$"../../../../MaxHit/Panel/RichTextLabel".bbcode_text = "[color=red][center]-" + str(Globals.brewDose)
		if get_parent().frame == 4:
			self.disabled = true
		
		if Globals.tick == 1:
			Globals.ate = true
			$"../../Potion".play()
			yield($"../../../../../Timer","timeout")
			get_parent().frame += 1
			$"../../../../../ViewportContainer2/Viewport2/ProgressBar".value += 18
			$"../../../OrbContainer2/HpBar".value += 18
			Globals.attJad = false
			yield($"../../../../../Timer2","timeout")
			Globals.ate = false
		elif Globals.tick == 2:
			Globals.ate = true
			$"../../Potion".play()
			yield($"../../../../../Timer2","timeout")
			get_parent().frame += 1
			$"../../../../../ViewportContainer2/Viewport2/ProgressBar".value += 18
			$"../../../OrbContainer2/HpBar".value += 18
			Globals.attJad = false
			yield($"../../../../../Timer","timeout")
			Globals.ate = false

func _process(delta):
	cooldown.tick(delta)
	
	if $"../../../../../ViewportContainer2/Viewport2/ProgressBar".value <= 0 or Globals.playerDied:
		self.disabled = false
		get_parent().frame = 0
		Globals.brewDose = 0
		Globals.maxHit = int($"../../../../MaxHit/Label2".text)
		
	if Globals.brewDose <= 0:
		Globals.brewDose = 0
		$"../../../../MaxHit/Panel".hide()
	if Globals.maxHit <= 0:
		Globals.maxHit = 0
		
	if Globals.brewDose == 0:
		Globals.canBoostMaxHit = false
	else:
		Globals.canBoostMaxHit = true
		
	if Globals.maxHit >= int($"/root/Spatial/CanvasLayer/MaxHit/Label2".text):
		Globals.canBoostMaxHit = false
		Globals.maxHit = int($"/root/Spatial/CanvasLayer/MaxHit/Label2".text)
	else:
		Globals.canBoostMaxHit = true
