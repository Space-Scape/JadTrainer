extends TextureProgress

onready var hpText = $"../../OrbContainer2/RichTextLabel".text

func _ready():
	self.max_value = Save.maxHitpoints
	self.value = Save.hitPoints
	hpText = max_value
	Save.hpText = str(max_value)
	$"../../CanvasLayer/LevelWindow/HpIcon/HpLvl".text = Save.hpText

func _process(_delta):
	$"../RichTextLabel".bbcode_text = "[center]" + str(value)

func _on_HpLvl_text_changed(new_text):
	Save.maxHitpoints = int(new_text)
	Save.hitPoints = int(new_text)
	Save.hpText = new_text
	$"../../../ViewportContainer2/Viewport2/ProgressBar".max_value = int(new_text)
	$"../../../ViewportContainer2/Viewport2/ProgressBar".value = int(new_text)
	max_value = int(new_text)
	value = max_value
