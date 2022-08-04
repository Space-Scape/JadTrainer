extends Button

onready var texture = load("res://Sprites/TopTabInv.png")

func _on_InvButton_pressed():
	get_parent().texture = texture
	$"../../InvBG".show()
	
	$"../../MageButton".disabled = true
	$"../../RangedButton".disabled = true
	$"../../RedemButton".disabled = true
	$"../../SharpEye".disabled = true
	$"../../EagleEye".disabled = true
	$"../../HawkEye".disabled = true
	$"../../Rigour".disabled = true
