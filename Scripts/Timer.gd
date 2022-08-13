extends Timer

func _process(_delta):
	if Globals.selectBP:
		self.wait_time = 1.2
	if Globals.selectBF:
		self.wait_time = 2.4
	if Globals.selectRCB:
		self.wait_time = 3
	if Globals.selectACB:
		self.wait_time = 3
	if Globals.selectTB:
		self.wait_time = 3
