extends Node

const Cooldown = preload('res://Scripts/Cooldown.gd')

onready var cooldown = Cooldown.new(1.2)

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

onready var backSprite = $"/root/Spatial/ViewportContainer2/Viewport2/AnimatedSprite3"

onready var hitSplat = $"../ViewportContainer/Viewport/HealerHitSplat"
onready var hitSplatNum = $"../ViewportContainer/Viewport/HealerHitSplat/HitNum"
onready var attTimer = $"../ViewportContainer/Viewport/HitTimer"
onready var hpBar = $"../ViewportContainer/Viewport/HpBar"

var hitNum
var accuracyRange
var accuracyNum = 3

func _process(delta):
	cooldown.tick(delta)
	
	if Globals.selectBP:
		cooldown.max_time = 1.2
	if Globals.selectBF:
		cooldown.max_time = 2.4
	if Globals.selectRCB:
		cooldown.max_time = 3
	if Globals.selectACB:
		cooldown.max_time = 3
	if Globals.selectTB:
		cooldown.max_time = 3

func _on_Area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true and cooldown.is_ready():
			Globals.clickGround = false
			get_parent().canMoveToJad = false
			get_parent().canMoveToPlayer = true
			$"../ViewportContainer/Viewport/HpBarSprite".show()
			$"../ViewportContainer/Viewport/HealerHitSplat".show()
			Globals.attHealer1 = true
			Globals.attHealer2 = false
			Globals.attHealer3 = false
			Globals.attHealer4 = false
			Globals.attJad = false
			$"/root/Spatial/Jad/ViewportContainer/Viewport/ProgressBarSprite2/Timer".stop()
			$"../Timer".start()
			$"../ViewportContainer/Viewport/HitTimer".start()
			$"../JadHeal".stop()
			accuracyRange = rand_range(0,6)
			
			$"../Healer".play()
			hitSplatNum.show()
			hitSplat.show()
			if accuracyRange >= accuracyNum + Globals.accuracyAddSub:
				hitNum = rand_range(1, Globals.maxHit)
				hitSplat.texture = redTex
			else:
				hitNum = 0
				hitSplat.texture = blueTex
			hitSplatNum.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
			hpBar.value -= hitNum
