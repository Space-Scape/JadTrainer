extends Sprite3D

onready var HpInput = $"../../PrayNode/CanvasLayer/LevelWindow/HpIcon/HpLvl".text

func _ready():
	$"../Viewport/ProgressBar".max_value = 99

func _process(_x):
	if $"../Viewport/ProgressBar".value <= 0:
		Globals.playerDied = true
	
	if $"../Viewport/ProgressBar".value >= $"../Viewport/ProgressBar".max_value:
		Globals.playerDied = false
	
	if Globals.playerDied:
		$"../Viewport/ProgressBar".value = $"../Viewport/ProgressBar".max_value
		$"../../PrayNode/OrbContainer/PrayerBar".value = $"../../PrayNode/OrbContainer/PrayerBar".max_value
		$"../../Jad/KinematicBody/Viewport/TextureProgress".value = 255
		$"../../PrayNode/OrbContainer2/HpBar".value = $"../../PrayNode/OrbContainer2/HpBar".max_value
		$"../../Jad/KinematicBody/Viewport/HitSplat2".hide()
		$"../../Jad/KinematicBody/Viewport/HitsplatNum2".hide()
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

