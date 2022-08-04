extends TextureProgress

onready var hpText = $"../../OrbContainer2/RichTextLabel".text

func _process(_delta):
	$"../RichTextLabel".bbcode_text = "[center]" + str(value)

func _on_HpLvl_text_changed(new_text):
	$"../../../3DPlayer/Viewport/ProgressBar".max_value = int(new_text)
	$"../../../3DPlayer/Viewport/ProgressBar".value = int(new_text)
	max_value = int(new_text)
	value = max_value
