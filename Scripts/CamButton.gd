extends TextureButton

onready var camControlTxt = $"../CamControls"

func _on_CamButton_pressed():
	if pressed:
		camControlTxt.text = "Camera Controls:\nScrollWheel  - Zoom In/Out\nMMB - Drag Camera\nE - Lift\nQ - Lower"
	elif not pressed:
		camControlTxt.text = ""
