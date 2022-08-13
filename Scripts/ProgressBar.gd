extends Sprite3D

func _process(_x):
	if $"../ProgressBar".value <= 0:
		$"../../../Reset/CheckBox".Reset()
