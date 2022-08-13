extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	translation.x = get_parent().get_parent().get_parent().translation.x
	translation.z = get_parent().get_parent().get_parent().translation.z
	translation.y = 4.43
