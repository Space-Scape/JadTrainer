extends RichTextLabel

onready var hitSplat = $"../HealerHitSplat"

func _process(_delta):
	if Globals.healerhitDmg:
		self.visible = true
		hitSplat.visible = true
	else:
		self.visible = false
		hitSplat.visible = false
