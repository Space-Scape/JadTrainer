extends KinematicBody

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

onready var backSprite = $"../../ViewportContainer2/Viewport2/AnimatedSprite3"

var maxHit : int
onready var hitLabel = $"../../MaxHit/Label2"

var hitNum
var attSpd = 5
var accuracyRange
var accuracyNum = 4
var accuracyAddSub = 0

onready var numContainer = $"../../ViewportContainer/Viewport/HitsplatNum2"

func _ready():
	maxHit = 32
	Globals.attJad = true

func _process(_delta):
	accuracyRange = rand_range(0,6)
	if maxHit > int(hitLabel.text):
		maxHit = int(hitLabel.text)
	if Globals.attJad == true:
		backSprite.play()
	else:
		backSprite.stop()

func _on_KinematicBody_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			if Globals.attJad == false:
				$"../../ViewportContainer/Viewport/ProgressBarSprite2/Timer".start()
				Globals.attJad = true

func _on_Timer_timeout():
	if Globals.tick == 1:
		if Globals.attJad == true:
			yield($"../../Timer", "timeout")
			$"../JadHit".play()
			$"../../ViewportContainer/Viewport/HitsplatNum2".show()
			$"../../ViewportContainer/Viewport/HitSplat2".show()
			if accuracyRange >= accuracyNum + accuracyAddSub:
				hitNum = rand_range(1, maxHit)
				$"../../ViewportContainer/Viewport/HitSplat2".texture = redTex
			else:
				hitNum = 0
				$"../../ViewportContainer/Viewport/HitSplat2".texture = blueTex
			
			numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
			$"../../ViewportContainer/Viewport/TextureProgress".value -= hitNum
			yield($"../../Timer2", "timeout")
		else:
			$"../../ViewportContainer/Viewport/HitsplatNum2".hide()
			$"../../ViewportContainer/Viewport/HitSplat2".hide()
	if Globals.tick == 2:
		if Globals.attJad == true:
			yield($"../../Timer2", "timeout")
			$"../JadHit".play()
			$"../../ViewportContainer/Viewport/HitsplatNum2".show()
			$"../../ViewportContainer/Viewport/HitSplat2".show()
			if accuracyRange >= accuracyNum + accuracyAddSub:
				hitNum = rand_range(1, maxHit)
				$"../../ViewportContainer/Viewport/HitSplat2".texture = redTex
			else:
				hitNum = 0
				$"../../ViewportContainer/Viewport/HitSplat2".texture = blueTex
			
			numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
			$"../../ViewportContainer/Viewport/TextureProgress".value -= hitNum
			yield($"../../Timer", "timeout")
		else:
			$"../../ViewportContainer/Viewport/HitsplatNum2".hide()
			$"../../ViewportContainer/Viewport/HitSplat2".hide()

func _on_Label2_text_changed(new_text):
	maxHit = int(new_text)
