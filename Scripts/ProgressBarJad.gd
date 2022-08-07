extends Sprite3D

func _process(_x):
	$"../../PrayNode/StreakCounter".text = str(Globals.killStreak)
	
	if $"../TextureProgress".value <= 0:
		Globals.killStreak += 1
		$"../../Reset/CheckBox".Reset()
