extends Spatial

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

onready var healerToggle = get_node("../HealerBar/CheckBox")

func _process(delta):
	cooldown.tick(delta)

func _on_AreaHM1_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerFrontL".canMoveToJad = false
			$"HealerFrontL".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerFrontL/Timer".start()
			$"HealerFrontL/HealerM1/HealerHit".show()
			yield($"HealerFrontL/Timer", "timeout")
			$"HealerFrontL/HealerM1/HealerHit".hide()

func _on_AreaHM2_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerBackL".canMoveToJad = false
			$"HealerBackL".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerBackL/Timer".start()
			$"HealerBackL/HealerHM2S/HealerHit2".show()
			yield($"HealerBackL/Timer", "timeout")
			$"HealerBackL/HealerHM2S/HealerHit2".hide()

func _on_AreaHM3_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerFrontR".canMoveToJad = false
			$"HealerFrontR".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerFrontR/Timer".start()
			$"HealerFrontR/HealerM3/HealerHit4".show()
			yield($"HealerFrontR/Timer", "timeout")
			$"HealerFrontR/HealerM3/HealerHit4".hide()

func _on_AreaHM4_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerBackR".canMoveToJad = false
			$"HealerBackR".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerBackR/Timer".start()
			$"HealerBackR/HealerM3/HealerHit3".show()
			yield($"HealerBackR/Timer", "timeout")
			$"HealerBackR/HealerM3/HealerHit3".hide()
