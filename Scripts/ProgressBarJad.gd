extends Sprite3D

func _process(_x):
	if $"../Viewport/TextureProgress".value <= 0:
		$"../../../Reset/CheckBox".Reset()
