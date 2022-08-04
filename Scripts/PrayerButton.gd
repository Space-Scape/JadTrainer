extends Button

onready var texture = load("res://Sprites/TopTabPrayer.png")

func _on_PrayerButton_pressed():
	get_parent().texture = texture
	$"../../InvBG".hide()
	
	$"../../MageButton".disabled = false
	$"../../RangedButton".disabled = false
	$"../../RedemButton".disabled = false
	$"../../SharpEye".disabled = false
	$"../../EagleEye".disabled = false
	$"../../HawkEye".disabled = false
	$"../../Rigour".disabled = false
