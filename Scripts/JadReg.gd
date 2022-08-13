extends Spatial

func _process(_delta):
	look_at($"/root/Spatial/KinematicBody".global_transform.origin, Vector3.UP)
	rotation_degrees.y -= 180
	rotation_degrees.x = 0
	rotation_degrees.z = 0
