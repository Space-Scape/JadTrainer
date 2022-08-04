extends Spatial

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

onready var healerToggle = get_node("../HealerBar/CheckBox")

func _ready():
	$"HealerFrontL".canMoveToJad = false
	$"HealerFrontR".canMoveToJad = false
	$"HealerBackL".canMoveToJad = false
	$"HealerBackR".canMoveToJad = false
	$"HealerFrontL".translation = Vector3(-91.863, 4.3, -20.779)

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

func _on_AreaHM2_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerBackL".canMoveToJad = false
			$"HealerBackL".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerBackL/Timer".start()
			

func _on_AreaHM3_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerFrontR".canMoveToJad = false
			$"HealerFrontR".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerFrontR/Timer".start()

func _on_AreaHM4_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			$"HealerBackR".canMoveToJad = false
			$"HealerBackR".canMoveToPlayer = true
			Globals.attJad = false
			$"Healer".play()
			$"HealerBackR/Timer".start()
