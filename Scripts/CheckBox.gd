extends CheckBox

func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		$"/root/Spatial/Jad/Jad_Att".show()
	else:
		$"/root/Spatial/Jad/Jad_Att".hide()
