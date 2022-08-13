extends TextureProgress

onready var prayerText = $"../../CanvasLayer/LevelWindow/PrayerIcon/PrayerLvl".text

func _ready():
	self.max_value = Save.maxPrayerPoints
	self.value = Save.prayerPoints
	prayerText = max_value
	Save.prayerText = str(max_value)
	$"../../CanvasLayer/LevelWindow/PrayerIcon/PrayerLvl".text = Save.prayerText

func _process(_delta):
	$"../RichTextLabel".bbcode_text = "[center]" + str(value)

func _on_PrayerLvl_text_changed(new_text):
	Save.maxPrayerPoints = int(new_text)
	Save.prayerPoints = int(new_text)
	Save.prayerText = new_text
	max_value = int(new_text)
	value = max_value
