extends OptionButton

var key = ShortCut.new()

func _ready():
	key.set_shortcut(InputMap.get_action_list("F2")[0])
	$"../../../TopTab/PrayerButton".set_shortcut(key)
	
	add_item("F1")
	add_item("F2")
	add_item("F3")
	add_item("F4")
	
	select(1)

func _on_OptionButton2_item_selected(_index):
	if selected == 0:
		key.set_shortcut(InputMap.get_action_list("F1")[0])
		$"../../../TopTab/PrayerButton".set_shortcut(key)
	if selected == 1:
		key.set_shortcut(InputMap.get_action_list("F2")[0])
		$"../../../TopTab/PrayerButton".set_shortcut(key)
	if selected == 2:
		key.set_shortcut(InputMap.get_action_list("F3")[0])
		$"../../../TopTab/PrayerButton".set_shortcut(key)
	if selected == 3:
		key.set_shortcut(InputMap.get_action_list("F4")[0])
		$"../../../TopTab/PrayerButton".set_shortcut(key)
