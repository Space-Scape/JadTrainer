extends KinematicBody

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

var maxHit : int
onready var hitLabel = $"../../MaxHit/Label2"

var hitNum
var attSpd = 5
var accuracyRange
var accuracyNum = 4
var accuracyAddSub = 0

onready var numContainer = $"../../Viewport/HitsplatNum2"

func _ready():
	maxHit = 32
	Globals.attJad = true

func _process(_delta):
	accuracyRange = rand_range(0,6)
	if maxHit > int(hitLabel.text):
		maxHit = int(hitLabel.text)
	if Globals.attJad == true:
		$"../../Viewport2/AnimatedSprite".play()
		$"../../Viewport2/AnimatedSprite3".play()
	else:
		$"../../Viewport2/AnimatedSprite".stop()
		$"../../Viewport2/AnimatedSprite3".stop()

func _on_KinematicBody_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			if Globals.attJad == false:
				$"../../Viewport/ProgressBarSprite2/Timer".start()
				Globals.attJad = true

func _on_Timer_timeout():
	if Globals.tick == 1:
		if Globals.attJad == true:
			yield($"../../Timer", "timeout")
			$"../JadHit".play()
			$"../../Viewport/HitsplatNum2".show()
			$"../../Viewport/HitSplat2".show()
			if accuracyRange >= accuracyNum + accuracyAddSub:
				hitNum = rand_range(1, maxHit)
				$"../../Viewport/HitSplat2".texture = redTex
			else:
				hitNum = 0
				$"../../Viewport/HitSplat2".texture = blueTex
			
			numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
			$"../../Viewport/TextureProgress".value -= hitNum
			yield($"../../Timer2", "timeout")
		else:
			$"../../Viewport/HitsplatNum2".hide()
			$"../../Viewport/HitSplat2".hide()
	if Globals.tick == 2:
		if Globals.attJad == true:
			yield($"../../Timer2", "timeout")
			$"../JadHit".play()
			$"../../Viewport/HitsplatNum2".show()
			$"../../Viewport/HitSplat2".show()
			if accuracyRange >= accuracyNum + accuracyAddSub:
				hitNum = rand_range(1, maxHit)
				$"../../Viewport/HitSplat2".texture = redTex
			else:
				hitNum = 0
				$"../../Viewport/HitSplat2".texture = blueTex
			
			numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
			$"../../Viewport/TextureProgress".value -= hitNum
			yield($"../../Timer", "timeout")
		else:
			$"../../Viewport/HitsplatNum2".hide()
			$"../../Viewport/HitSplat2".hide()

func _on_Label2_text_changed(new_text):
	maxHit = int(new_text)
