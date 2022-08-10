extends Button

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(0.6)

func _on_Button_pressed():
		if cooldown.is_ready():
			if Globals.tick == 1:
				$"../Timer".start()
				get_parent().frame = 1
				Globals.ate = true
				yield($"../../../../Timer", "timeout")
				$"../../../../ViewportContainer2/Viewport2/ProgressBar".value += 1
				$"../../../OrbContainer2/HpBar".value += 1
			elif Globals.tick == 2:
				$"../Timer".start()
				get_parent().frame = 1
				Globals.ate = true
				yield($"../../../../Timer2", "timeout")
				$"../../../../ViewportContainer2/Viewport2/ProgressBar".value += 1
				$"../../../OrbContainer2/HpBar".value += 1

func _process(delta):
	cooldown.tick(delta)
	if cooldown.time == 0:
		Globals.ate = false

func _on_Timer_timeout():
	get_parent().frame = 0
