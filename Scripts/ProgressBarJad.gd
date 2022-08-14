extends Sprite3D

func _process(_x):
	$"/root/Spatial/CanvasLayer/PrayNode/StreakCounter".text = str(Globals.killStreak)
	
	if $"../TextureProgress".value <= 0:
		Globals.killStreak += 1
		get_tree().reload_current_scene()
	
	if $"../TextureProgress".value <= 125:
		Globals.spawnHealers = true
		$"/root/Spatial/Jad/SpawnHealers".AddHealers()
		
