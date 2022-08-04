extends Sprite3D

func _process(_x):
	if $"../Viewport/TextureProgress".value <= 0:
		$"../Viewport/TextureProgress".value = 250
		Globals.hitDmg = false
		$"../../../3DPlayer/Viewport/ProgressBar".value = $"../../../3DPlayer/Viewport/ProgressBar".max_value
		$"../../../3DPlayer/Viewport/HitsplatNum".hide()
		$"../../../3DPlayer/Viewport/HitSplat".hide()
		$"../Viewport/HitsplatNum2".hide()
		$"../Viewport/HitSplat2".hide()
		$"../../../Healers/HealerFrontL/Timer".stop()
		$"../../../Healers/HealerBackL/Timer".stop()
		$"../../../Healers/HealerFrontR/Timer".stop()
		$"../../../Healers/HealerBackR/Timer".stop()
		$"../../../Healers/HealerFrontL".visible = false
		$"../../../Healers/HealerFrontR".visible = false
		$"../../../Healers/HealerBackL".visible = false
		$"../../../Healers/HealerBackR".visible = false
		$"../../../Healers/HealerFrontL".canMoveToJad = false
		$"../../../Healers/HealerFrontR".canMoveToJad = false
		$"../../../Healers/HealerBackL".canMoveToJad = false
		$"../../../Healers/HealerBackR".canMoveToJad = false
		$"../../../Healers/HealerFrontL".canMoveToPlayer = false
		$"../../../Healers/HealerFrontR".canMoveToPlayer = false
		$"../../../Healers/HealerBackL".canMoveToPlayer = false
		$"../../../Healers/HealerBackR".canMoveToPlayer = false
		$"../../../Healers/HealerFrontL".point = Vector3(-91.863, 4.3, -20.779)
		$"../../../Healers/HealerFrontR".point = Vector3(46.943,1.708,-21.572)
		$"../../../Healers/HealerBackL".point = Vector3(-46.458,1.76,-62.36)
		$"../../../Healers/HealerBackR".point = Vector3(18.053,1.653,-62.418)
