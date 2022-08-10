extends Sprite3D

onready var HpInput = $"../../../PrayNode/CanvasLayer/LevelWindow/HpIcon/HpLvl".text

func _ready():
	$"../ProgressBar".max_value = 99

func _process(_x):
	if $"../ProgressBar".value <= 0:
		$"../../../Reset/CheckBox".Reset()
	
	if $"../ProgressBar".value >= $"../ProgressBar".max_value:
		Globals.playerDied = false

