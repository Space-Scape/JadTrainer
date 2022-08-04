extends Button

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

var brewMaxHit
var canDrain

func _on_Button_pressed():
	if cooldown.is_ready():
		get_parent().frame += 1
		$"../../../../MaxHit/Panel".show()
		$"../../../../3DPlayer/Viewport/ProgressBar".value += 18
		$"../../../OrbContainer2/HpBar".value += 18
		Globals.attJad = false
		
		if canDrain:
			Globals.brewDose += 5
			$"../../../../MaxHit/Panel/RichTextLabel".bbcode_text = "[color=red][center]-" + str(Globals.brewDose)
			brewMaxHit = $"../../../../Jad/KinematicBody".maxHit - 5
			$"../../../../Jad/KinematicBody".maxHit = brewMaxHit
		if get_parent().frame == 4:
			self.disabled = true

func _process(delta):
	if $"../../../../Jad/KinematicBody/Viewport/TextureProgress".value == 255 or Globals.playerDied:
		self.disabled = false
		get_parent().frame = 0
		Globals.brewDose = 0
		brewMaxHit = 0
		$"../../../../Jad/KinematicBody".maxHit = int($"../../../../MaxHit/Label2".text)
		
	if Globals.brewDose <= 0:
		Globals.brewDose = 0
		$"../../../../MaxHit/Panel".hide()
	if $"../../../../Jad/KinematicBody".maxHit <= 0:
		canDrain = false
		brewMaxHit = 0
		$"../../../../Jad/KinematicBody".maxHit = 0
	else:
		canDrain = true
	
	cooldown.tick(delta)
