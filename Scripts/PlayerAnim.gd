extends AnimatedSprite3D

func _process(_delta):
	if Globals.attJad == true:
		playing = true
	else:
		stop()
