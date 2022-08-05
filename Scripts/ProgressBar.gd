extends Sprite3D

onready var HpInput = $"../../PrayNode/CanvasLayer/LevelWindow/HpIcon/HpLvl".text

func _ready():
	$"../../Viewport2/ProgressBar".max_value = 99

func _process(_x):
	if $"../../Viewport2/ProgressBar".value <= 0:
		Globals.playerDied = true
		$"../../Reset/CheckBox".Reset()
	
	if $"../../Viewport2/ProgressBar".value >= $"../../Viewport2/ProgressBar".max_value:
		Globals.playerDied = false
