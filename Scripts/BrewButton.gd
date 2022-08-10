extends Button

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

var brewMaxHit
var canDrain

func _ready():
	cooldown.time = 0

func _on_Button_pressed():
	if cooldown.is_ready():
		if canDrain:
			$"../../../../MaxHit/Panel".show()
			Globals.brewDose += 5
			$"../../../../MaxHit/Panel/RichTextLabel".bbcode_text = "[color=red][center]-" + str(Globals.brewDose)
			brewMaxHit = $"../../../../Jad/KinematicBody".maxHit - 5
			$"../../../../Jad/KinematicBody".maxHit = brewMaxHit
			if get_parent().frame == 4:
				self.disabled = true
		
		if Globals.tick == 1:
			$"../../Potion".play()
			yield($"../../../../Timer","timeout")
			get_parent().frame += 1
			$"../../../../ViewportContainer2/Viewport2/ProgressBar".value += 18
			$"../../../OrbContainer2/HpBar".value += 18
			Globals.attJad = false
			yield($"../../../../Timer2","timeout")
		elif Globals.tick == 2:
			$"../../Potion".play()
			yield($"../../../../Timer2","timeout")
			get_parent().frame += 1
			$"../../../../ViewportContainer2/Viewport2/ProgressBar".value += 18
			$"../../../OrbContainer2/HpBar".value += 18
			Globals.attJad = false
			yield($"../../../../Timer","timeout")

func _process(delta):
	if $"../../../../ViewportContainer2/Viewport2/ProgressBar".value <= 0 or Globals.playerDied:
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
