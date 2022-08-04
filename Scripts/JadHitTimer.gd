extends Timer


func _on_Timer_timeout():
	$"../../Viewport/TextureProgress".value -= rand_range(0, 40)
