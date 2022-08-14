extends LineEdit

func _ready():
	if Globals.setDefaults:
		self.text = str(39)
		Globals.maxHit = 39
	else:
		self.text = str(Save.maxHit)

func _on_Label2_text_changed(new_text):
	Globals.maxHit = int(new_text)
	Save.maxHit = int(new_text)
