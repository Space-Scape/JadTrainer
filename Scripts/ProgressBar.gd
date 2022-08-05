extends Sprite3D

onready var HpInput = $"../../PrayNode/CanvasLayer/LevelWindow/HpIcon/HpLvl".text

func _ready():
	$"../Viewport/ProgressBar".max_value = 99

func _process(_x):
	if $"../Viewport/ProgressBar".value <= 0:
		Globals.playerDied = true
		$"../../Reset/CheckBox".Reset()
	
	if $"../Viewport/ProgressBar".value >= $"../Viewport/ProgressBar".max_value:
		Globals.playerDied = false
