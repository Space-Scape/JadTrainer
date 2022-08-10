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
	$"../../Jad/KinematicBody".maxHit = $"../../MaxHit/Label2".text
	Globals.brewDose = 0
	Globals.hitDmg = false
	Globals.healerhitDmg = false
	$"../../MaxHit/Panel".hide()
	$"../../PrayNode/OrbContainer2/HpBar".value = $"../../PrayNode/OrbContainer2/HpBar".max_value
	$"../../PrayNode/OrbContainer/PrayerBar".value = $"../../PrayNode/OrbContainer/PrayerBar".max_value
	$"../../ViewportContainer/Viewport/TextureProgress".value = 250
	$"../../ViewportContainer2/Viewport2/HitSplat".hide()
	$"../../ViewportContainer2/Viewport2/HitsplatNum".hide()
	$"../../ViewportContainer2/Viewport2/HealerHitSplat".hide()
	$"../../ViewportContainer2/Viewport2/HealerNum".hide()
	$"../../ViewportContainer2/Viewport2/ProgressBar".value = $"../../ViewportContainer2/Viewport2/ProgressBar".max_value
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
	$"../../Healers/HealerFrontL/HealerM1/HealerHit".hide()
	$"../../Healers/HealerBackL/HealerHM2S/HealerHit2".hide()
	$"../../Healers/HealerFrontR/HealerM3/HealerHit4".hide()
	$"../../Healers/HealerBackR/HealerM3/HealerHit3".hide()
	$"../../Healers/HealerFrontL".translation = Vector3(-91.863, 4, -20.779)
	$"../../Healers/HealerFrontR".translation = Vector3(55.323, 4, -21.572)
	$"../../Healers/HealerBackL".translation = Vector3(-88.83, 4, -56.035)
	$"../../Healers/HealerBackR".translation = Vector3(54.986, 4, -51.557)
	$"../../Healers/HealerFrontL".speed = 7
	$"../../Healers/HealerFrontR".speed = 7
	$"../../Healers/HealerBackL".speed = 7
	$"../../Healers/HealerBackR".speed = 7
