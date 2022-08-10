extends OptionButton

onready var hitLabel = $"../../MaxHit/Label2"

var selectBP
var selectBF
var selectRCB
var selectACB
var selectTB

func _ready():
	add_item("BP (2)")
	add_item("BoFa (4)")
	add_item("RCB (5)")
	add_item("ACB (5)")
	add_item("T-Bow (5)")
	
	select(2)
	
	selectRCB = true
	hitLabel.text = str(32)
	$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".wait_time = 3

func _on_OptionButton2_item_selected(_index):
	if selected == 0:
		$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = "BP"
		$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".wait_time = 1.2
		hitLabel.text = str(22)
		selectBP = true
		selectBF = false
		selectRCB = false
		selectACB = false
		selectTB = false
	if selected == 1:
		$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = "BoFa"
		$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".wait_time = 2.4
		hitLabel.text = str(43)
		selectBP = false
		selectBF = true
		selectRCB = false
		selectACB = false
		selectTB = false
	if selected == 2:
		$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = "RCB"
		$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".wait_time = 3
		hitLabel.text = str(32)
		selectBP = false
		selectBF = false
		selectRCB = true
		selectACB = false
		selectTB = false
	if selected == 3:
		$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = "ACB"
		$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".wait_time = 3
		hitLabel.text = str(37)
		selectBP = false
		selectBF = false
		selectRCB = false
		selectACB = true
		selectTB = false
	if selected == 4:
		$"../../ViewportContainer2/Viewport2/AnimatedSprite3".animation = "Tbow"
		$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".wait_time = 3
		hitLabel.text = str(75)
		selectBP = false
		selectBF = false
		selectRCB = false
		selectACB = false
		selectTB = true
