extends Button

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

func _on_Button_pressed():
	if cooldown.is_ready():
		get_parent().frame += 1
		$"../../../../Jad/KinematicBody".maxHit += 15
		Globals.brewDose -= 15
		$"../../../../MaxHit/Panel/RichTextLabel".bbcode_text = "[color=red][center]-" + str(Globals.brewDose)
		Globals.attJad = false
		if get_parent().frame == 4:
			self.disabled = true
		
		$"../../../OrbContainer/PrayerBar".value += 30

func _process(delta):
	if $"../../../../Viewport/TextureProgress".value == 255 or Globals.playerDied:
		self.disabled = false
		get_parent().frame = 0
	if Globals.brewDose <= 0:
		Globals.brewDose = 0
		$"../../../../MaxHit/Panel".hide()
	
	cooldown.tick(delta)
