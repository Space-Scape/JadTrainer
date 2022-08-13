extends OptionButton

onready var hitLabel = $"../../MaxHit/Label2"

func _ready():
		if Globals.setDefaults:
			select(2)
			$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = "RCB"
		else:
			$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = Save.playerAnim
			select(Save.weaponSelect)
	
func _on_OptionButton2_item_selected(_index):
	if selected == 0:
		Save.weaponSelect = 0
		Globals.setDefaults = false
		$"/root/Spatial/ViewportContainer2/Viewport2/AnimatedSprite3".animation = "BP"
		Save.playerAnim = "BP"
		hitLabel.text = str(22)
		Globals.selectBP = true
		Globals.selectBF = false
		Globals.selectRCB = false
		Globals.selectACB = false
		Globals.selectTB = false
	if selected == 1:
		$"/root/Spatial/ViewportContainer2/Viewport2/AnimatedSprite3".animation = "BoFa"
		Save.weaponSelect = 1
		Globals.setDefaults = false
		Save.playerAnim = "BoFa"
		hitLabel.text = str(39)
		Globals.selectBP = false
		Globals.selectBF = true
		Globals.selectRCB = false
		Globals.selectACB = false
		Globals.selectTB = false
	if selected == 2:
		Save.weaponSelect = 2
		Globals.setDefaults = false
		$"/root/Spatial/ViewportContainer2/Viewport2/AnimatedSprite3".animation = "RCB"
		Save.playerAnim = "RCB"
		hitLabel.text = str(32)
		Globals.selectBP = false
		Globals.selectBF = false
		Globals.selectRCB = true
		Globals.selectACB = false
		Globals.selectTB = false
	if selected == 3:
		Save.weaponSelect = 3
		Globals.setDefaults = false
		$"/root/Spatial/ViewportContainer2/Viewport2/AnimatedSprite3".animation = "ACB"
		Save.playerAnim = "ACB"
		hitLabel.text = str(37)
		Globals.selectBP = false
		Globals.selectBF = false
		Globals.selectRCB = false
		Globals.selectACB = true
		Globals.selectTB = false
	if selected == 4:
		Save.weaponSelect = 4
		Globals.setDefaults = false
		$"/root/Spatial/ViewportContainer2/Viewport2/AnimatedSprite3".animation = "Tbow"
		Save.playerAnim = "Tbow"
		hitLabel.text = str(62)
		Globals.selectBP = false
		Globals.selectBF = false
		Globals.selectRCB = false
		Globals.selectACB = false
		Globals.selectTB = true
