extends NinePatchRect

var rotate_left
var rotate_right
var zoom_in
var zoom_out

func _process(delta):
	if rotate_left:
		$"../../Spatial".rotation.y += 0.02
	if rotate_right:
		$"../../Spatial".rotation.y -= 0.02
	
	if zoom_in:
		$"../../Spatial/TrackballCamera".add_zoom_inertia(0.05)
	
	if zoom_out:
		$"../../Spatial/TrackballCamera".add_zoom_inertia(-0.05)
	


func _on_CamButton_button_down():
		rotate_right = true

func _on_CamButton_button_up():
		rotate_right = false


func _on_CamButtonR_button_down():
	rotate_left = true

func _on_CamButtonR_button_up():
	rotate_left = false


func _on_CamButtonPlus_button_down():
	zoom_in = true

func _on_CamButtonPlus_button_up():
	zoom_in = false


func _on_CamButtonMinus_button_down():
	zoom_out = true

func _on_CamButtonMinus_button_up():
	zoom_out = false

func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		$"CamButton".show()
		$"CamButtonR".show()
		$"CamButtonPlus".show()
		$"CamButtonMinus".show()
	else:
		$"CamButton".hide()
		$"CamButtonR".hide()
		$"CamButtonPlus".hide()
		$"CamButtonMinus".hide()
