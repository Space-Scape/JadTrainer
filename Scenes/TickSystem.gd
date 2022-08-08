extends Timer

func _ready():
	start()

func _on_Timer_timeout():
	stop()
	$"../Timer2".start()
	Globals.tick = 2
	$"../PrayNode/ColorRect".color = Color(234,225,0)

func _on_Timer2_timeout():
	start()
	$"../Timer2".stop()
	Globals.tick = 1
	$"../PrayNode/ColorRect".color = Color(12,0,250)
