extends CheckBox


func _on_CheckBox_pressed():
	Reset()

func Reset():
	$"../../PrayNode/StreakCounter".text = str(0)
	$"../../PrayNode/InvBG/Brew1".frame = 0
	$"../../PrayNode/InvBG/Brew2".frame = 0
	$"../../PrayNode/InvBG/Brew3".frame = 0
	$"../../PrayNode/InvBG/Brew4".frame = 0
	$"../../PrayNode/InvBG/Rest1".frame = 0
	$"../../PrayNode/InvBG/Rest2".frame = 0
	$"../../PrayNode/InvBG/Rest3".frame = 0
	$"../../PrayNode/InvBG/Rest4".frame = 0
	$"../../PrayNode/InvBG/Brew1/Button".disabled = false
	$"../../PrayNode/InvBG/Brew2/Button2".disabled = false
	$"../../PrayNode/InvBG/Brew3/Button3".disabled = false
	$"../../PrayNode/InvBG/Brew4/Button4".disabled = false
	$"../../PrayNode/InvBG/Rest1/Button5".disabled = false
	$"../../PrayNode/InvBG/Rest2/Button6".disabled = false
	$"../../PrayNode/InvBG/Rest3/Button7".disabled = false
	$"../../PrayNode/InvBG/Rest4/Button8".disabled = false
	Globals.hitDmg = false
	Globals.healerhitDmg = false
	$"../../MaxHit/Panel".hide()
	$"../../PrayNode/OrbContainer2/HpBar".value = $"../../PrayNode/OrbContainer2/HpBar".max_value
	$"../../PrayNode/OrbContainer/PrayerBar".value = $"../../PrayNode/OrbContainer/PrayerBar".max_value
	$"../../Viewport/TextureProgress".value = 250
	$"../../Viewport2/HitSplat".hide()
	$"../../Viewport2/HitsplatNum".hide()
	$"../../Viewport2/HealerHitSplat".hide()
	$"../../Viewport2/HealerNum".hide()
	$"../../Viewport2/ProgressBar".value = $"../../Viewport2/ProgressBar".max_value
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
