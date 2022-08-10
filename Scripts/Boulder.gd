extends KinematicBody

export var fired : bool = false
var speed = 45
var velocity = Vector3.ZERO
var target_pos = Vector3()

func _physics_process(delta):
	if fired == true:
		visible = true
		target_pos = $"../../KinematicBody".global_transform.origin
		velocity = self.global_transform.origin.direction_to(target_pos)
		self.global_transform.origin += velocity * speed * delta
	else:
		translation.y = 20

func _on_Boulder_area_entered(area):
	if area.get_name() == "Player":
		visible = false
		fired = false
		$"../BoulderAnim".stop()
