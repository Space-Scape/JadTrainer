extends KinematicBody

export var speed = 12

var target = null
var velocity = Vector3.ZERO
export var gravity = -5

func _physics_process(_delta):
	if target:
		look_at(target, Vector3.UP)
		velocity = -transform.basis.z * speed
		if transform.origin.distance_to(target) < .5:
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

func _on_StaticBody_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			target = click_position
			Globals.attJad = false
			$"../ViewportContainer2/Viewport2/AnimatedSprite3".frame = 0
