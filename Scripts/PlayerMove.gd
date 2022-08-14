extends KinematicBody

export var speed = 12

var target = null
var velocity = Vector3.ZERO
var min_distance

func _physics_process(_delta):
	OnHealerClicked()
	OnHealer2Clicked()
	OnHealer3Clicked()
	OnHealer4Clicked()
	
	if Globals.clickGround == true:
		min_distance = .5
		speed = 12
	if target:
		look_at(target, Vector3.UP)
		velocity = -transform.basis.z * speed
		if transform.origin.distance_to(target) < min_distance:
			target = null
			velocity = Vector3(0,0,0)
			speed = 0
	velocity = move_and_slide(velocity, Vector3.UP)
	
	$"../PrayNode/PrayerIcon".translation = translation
	$"../PrayNode/PrayerIcon".translation.y = 10
	$"../Spatial".translation = translation
	$"../Spatial".translation.y = -35
	$"../ViewportContainer2/Viewport2/PlayerHPbarSprite".translation = translation
	$"../ViewportContainer2/Viewport2/PlayerHPbarSprite".translation.y = 7
	$"../ViewportContainer2/Viewport2/AnimatedSprite3".translation = translation
	$"../ViewportContainer2/Viewport2/AnimatedSprite3".translation.y = 3

func OnHealerClicked():
	if get_tree().get_root().get_child(2).has_node("Healer"):
		var healer = get_tree().get_root().get_child(2).get_node("Healer")
		if Globals.attHealer1 == true and !Globals.attHealer2 and !Globals.attHealer3 and !Globals.attHealer4:
			target = healer.transform.origin
			min_distance = 25
func OnHealer2Clicked():
	if get_tree().get_root().get_child(2).has_node("Healer2"):
		var healer2 = get_tree().get_root().get_child(2).get_node("Healer2")
		if Globals.attHealer2 == true and !Globals.attHealer1 and !Globals.attHealer3 and !Globals.attHealer4:
			target = healer2.transform.origin
			min_distance = 25
func OnHealer3Clicked():
	if get_tree().get_root().get_child(2).has_node("Healer3"):
		var healer3 = get_tree().get_root().get_child(2).get_node("Healer3")
		if Globals.attHealer3 == true and !Globals.attHealer1 and !Globals.attHealer2 and !Globals.attHealer4:
			target = healer3.transform.origin
			min_distance = 25
func OnHealer4Clicked():
	if get_tree().get_root().get_child(2).has_node("Healer4"):
		var healer4 = get_tree().get_root().get_child(2).get_node("Healer4")
		if Globals.attHealer4 == true and !Globals.attHealer1 and !Globals.attHealer2 and !Globals.attHealer3:
			target = healer4.transform.origin
			min_distance = 25

func _on_StaticBody_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Globals.clickGround = true
			min_distance = .5
			target = click_position
			Globals.attJad = false
			$"/root/Spatial/Jad/ViewportContainer/Viewport/ProgressBarSprite2/Timer".stop()
			Globals.attHealer1 = false
			Globals.attHealer2 = false
			Globals.attHealer3 = false
			Globals.attHealer4 = false
			$"../ViewportContainer2/Viewport2/AnimatedSprite3".frame = 0

