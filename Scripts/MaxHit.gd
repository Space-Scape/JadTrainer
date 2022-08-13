extends LineEdit

func _ready():
	if Globals.setDefaults:
		self.text = str(39)
		Globals.maxHit = 39
	else:
		if Globals.selectBP:
			self.text = str(22)
		if Globals.selectBF:
			self.text = str(39)
		if Globals.selectRCB:
			self.text = str(32)
		if Globals.selectACB:
			self.text = str(37)
		if Globals.selectTB:
			self.text = str(62)

func _on_Label2_text_changed(new_text):
	Globals.maxHit = int(new_text)
	Save.maxHit = int(new_text)
