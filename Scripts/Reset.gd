extends CheckBox


func _on_CheckBox_pressed():
	Reset()

func Reset():
	if pressed:
		$"../../PrayNode/InvBG/Brew1".frame = 0
		$"../../PrayNode/InvBG/Brew2".frame = 0
		$"../../PrayNode/InvBG/Brew3".frame = 0
		$"../../PrayNode/InvBG/Brew4".frame = 0
		$"../../PrayNode/InvBG/Rest1".frame = 0
		$"../../PrayNode/InvBG/Rest2".frame = 0
		$"../../PrayNode/InvBG/Rest3".frame = 0
		$"../../PrayNode/InvBG/Rest4".frame = 0
	Globals.hitDmg = false
	$"../../MaxHit/Panel".hide()
	$"../../PrayNode/OrbContainer2/HpBar".value = $"../../PrayNode/OrbContainer2/HpBar".max_value
	$"../../PrayNode/OrbContainer/PrayerBar".value = $"../../PrayNode/OrbContainer/PrayerBar".max_value
	$"../../Jad/KinematicBody/Viewport/TextureProgress".value = 250
	$"../../3DPlayer/Viewport/HitSplat".hide()
	$"../../3DPlayer/Viewport/HitsplatNum".hide()
	$"../../3DPlayer/Viewport/ProgressBar".value = $"../../3DPlayer/Viewport/ProgressBar".max_value
	$"../../Healers/HealerFrontL/Timer".stop()
	$"../../Healers/HealerBackL/Timer".stop()
	$"../../Healers/HealerFrontR/Timer".stop()
	$"../../Healers/HealerBackR/Timer".stop()
	$"../../Healers/HealerFrontL".visible = false
	$"../../Healers/HealerFrontR".visible = false
	$"../../Healers/HealerBackL".visible = false
	$"../../Healers/HealerBackR".visible = false
	$"../../Healers/HealerFrontL".canMoveToJad = false
	$"../../Healers/HealerFrontR".canMoveToJad = false
	$"../../Healers/HealerBackL".canMoveToJad = false
	$"../../Healers/HealerBackR".canMoveToJad = false
	$"../../Healers/HealerFrontL".canMoveToPlayer = false
	$"../../Healers/HealerFrontR".canMoveToPlayer = false
	$"../../Healers/HealerBackL".canMoveToPlayer = false
	$"../../Healers/HealerBackR".canMoveToPlayer = false
	$"../../Healers/HealerFrontL".point = Vector3(-91.863, 4.3, -20.779)
	$"../../Healers/HealerFrontR".point = Vector3(46.943,1.708,-21.572)
	$"../../Healers/HealerBackL".point = Vector3(-46.458,1.76,-62.36)
	$"../../Healers/HealerBackR".point = Vector3(18.053,1.653,-62.418)
