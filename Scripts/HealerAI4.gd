extends KinematicBody

var velocity
var speed = 10
var point = Vector3(18.053,1.653,-62.418)
var canMoveToJad
var canMoveToPlayer

var hitNum
var accuracyRange
var accuracyNum = 3

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

onready var numContainer = $"../../Viewport2/HealerNum"
onready var hpBar = $"../../Viewport2/ProgressBar"

func _ready():
	canMoveToJad = false

func _process(_delta):
	accuracyRange = rand_range(0,6)
	
	if $"../../PrayNode/Rigour".pressed:
		accuracyNum = 5
	else:
		accuracyNum = 3
	
	if  $"../../Viewport/TextureProgress".value <= 125:
		point = Vector3(-2.923,1.708,-30.008)
		self.show()
	if  $"../../Viewport/TextureProgress".value <= 0:
		point = Vector3(-2.923,1.708,-30.008)
	
	if canMoveToPlayer:
		canMoveToJad = false
		point = Vector3(-12.684,1.708,5.303)
	
	var direction
	if point.distance_to(transform.origin) > 0.6:
		direction = point - transform.origin
		direction = direction.normalized() * speed
	else:
		direction = point - transform.origin
	move_and_slide(direction)
	
	if point.distance_to(transform.origin) < 1 and visible and !canMoveToPlayer:
		yield($"../../Timer", "timeout")
		$"../../Viewport/TextureProgress".value += 0.1
		$"../JadHeal".play()
	
	if $"../../HealerBar/CheckBox".pressed:
		translation = Vector3(18.053,1.653,-62.418)

func _on_Timer_timeout():
	if !Globals.prayingMelee:
		if canMoveToPlayer and point.distance_to(transform.origin) < 0.6:
			if Globals.tick == 1:
				yield($"../../Timer", "timeout")
				$"../Healer".play()
				Globals.healerhitDmg = true
				if accuracyRange >= accuracyNum:
					hitNum = rand_range(1, 14)
					$"../../Viewport2/ProgressBar".value -= hitNum
					$"../../PrayNode/OrbContainer2/HpBar".value -= hitNum
					numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
					$"../../Viewport2/HealerHitSplat".texture = redTex
					yield($"../../Timer2", "timeout")
				else:
					yield($"../../Timer", "timeout")
					$"../../Viewport2/HealerHitSplat".texture = blueTex
					$"../../Viewport2/HealerNum".text = ""
					yield($"../../Timer2", "timeout")
				
			if Globals.tick == 2:
				yield($"../../Timer2", "timeout")
				$"../Healer".play()
				Globals.healerhitDmg = true
				if accuracyRange >= accuracyNum:
					hitNum = rand_range(1, 14)
					$"../../Viewport2/ProgressBar".value -= hitNum
					$"../../PrayNode/OrbContainer2/HpBar".value -= hitNum
					numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
					$"../../Viewport2/HealerHitSplat".texture = redTex
					yield($"../../Timer", "timeout")
				else:
					yield($"../../Timer2", "timeout")
					$"../../Viewport2/HealerHitSplat".texture = blueTex
					$"../../Viewport2/HealerNum".text = ""
					yield($"../../Timer", "timeout")
