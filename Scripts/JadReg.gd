extends Spatial


func _process(delta):
	look_at($"../KinematicBody".global_transform.origin, Vector3.UP)
	rotation_degrees.y -= 180
	rotation_degrees.x = 0
	rotation_degrees.z = 0
