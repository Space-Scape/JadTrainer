extends TextureButton

func _on_CheckBox_pressed():
	$"../../Healers/HealerFrontL".show()
	$"../../Healers/HealerFrontR".show()
	$"../../Healers/HealerBackL".show()
	$"../../Healers/HealerBackR".show()
	$"../../Healers/HealerFrontL".canMoveToJad = true
	$"../../Healers/HealerFrontR".canMoveToJad = true
	$"../../Healers/HealerBackL".canMoveToJad = true
	$"../../Healers/HealerBackR".canMoveToJad = true
	$"../../Healers/HealerFrontL".canMoveToPlayer = false
	$"../../Healers/HealerFrontR".canMoveToPlayer = false
	$"../../Healers/HealerBackL".canMoveToPlayer = false
	$"../../Healers/HealerBackR".canMoveToPlayer = false
	$"../../Healers/HealerFrontL".point = Vector3(-31.477,4.3,-21.196)
	$"../../Healers/HealerFrontR".point = Vector3(-1.516,1.708,-21.572)
	$"../../Healers/HealerBackL".point = Vector3(-29.035,1.708,-32.321)
	$"../../Healers/HealerBackR".point = Vector3(-2.923,1.708,-30.008)
