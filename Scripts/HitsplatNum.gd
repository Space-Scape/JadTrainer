extends RichTextLabel

func _process(_delta):
	if Globals.hitDmg:
		self.visible = true
		$"../HitSplat".visible = true
