extends KinematicBody

export var fired : bool = false
var speed = 20
var velocity = Vector3.ZERO
var target_pos = Vector3()

func _physics_process(delta):
	if fired == true:
		visible = true
		target_pos = $"../../KinematicBody".global_transform.origin
		velocity = self.global_transform.origin.direction_to(target_pos)
		self.global_transform.origin += velocity * speed * delta
	else:
		translation = Vector3(0.227, 5.26, 3.01)
	
func _on_Fireball_area_entered(area):
	if area.get_name() == "Player":
		Globals.hitDmg = false
		visible = false
		fired = false
		$"../FireBall".stop()
	
	if area.get_name() == "HitBoxes":
		Globals.hitDmg = true
