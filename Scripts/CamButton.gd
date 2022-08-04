extends TextureButton

onready var camControlTxt = $"../CamControls"

func _on_CamButton_pressed():
	if pressed:
		camControlTxt.text = "Camera Controls:\nScrollWheel  - Zoom In/Out\nRight-Click - Drag Camera\nQ - Lift\nE - Lower"
	elif not pressed:
		camControlTxt.text = ""
