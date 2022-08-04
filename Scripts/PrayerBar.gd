extends TextureProgress

onready var prayerText = $"../../CanvasLayer/LevelWindow/PrayerIcon/PrayerLvl".text

func _process(_delta):
	$"../RichTextLabel".bbcode_text = "[center]" + str(value)

func _on_PrayerLvl_text_changed(new_text):
	max_value = int(new_text)
	value = max_value
