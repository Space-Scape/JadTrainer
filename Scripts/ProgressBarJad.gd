extends Sprite3D

func _process(_x):
	if $"../TextureProgress".value <= 0:
		$"../../Reset/CheckBox".Reset()
		$"../../PrayNode/StreakCounter".text += str(1)
