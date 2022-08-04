extends Button

onready var label = $"../Label"
onready var labelAnim = $"../Label/AnimationPlayer"

func _ready():
	pressed = false
	self.icon = null
	label.hide()

func _on_RedemButton_toggled(button_pressed):
	if button_pressed:
		self.icon = load("res://Sprites/PrayTab/prayRedemption.png")
		label.show()
		labelAnim.play("TextAnim")
	else:
		self.icon = null
		label.hide()
