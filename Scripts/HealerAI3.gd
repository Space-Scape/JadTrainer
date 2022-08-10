extends KinematicBody

var velocity = Vector3.ZERO
var speed = 7
var point = Vector3(55.323, 4, -21.572)
var canMoveToJad
var canMoveToPlayer

var hitNum
var accuracyRange
var accuracyNum = 4

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

onready var numContainer = $"../../ViewportContainer2/Viewport2/HealerNum"
onready var hpBar = $"../../ViewportContainer2/Viewport2/ProgressBar"

func _ready():
	canMoveToJad = false

func _physics_process(_delta):
	accuracyRange = rand_range(0,6)
	
	if $"../../PrayNode/Rigour".pressed:
		accuracyNum = 5
	else:
		accuracyNum = 4
	
	if  $"../../ViewportContainer/Viewport/TextureProgress".value <= 125:
		canMoveToJad = true
		self.show()
		if global_transform.origin.distance_to($"../../Jad".global_transform.origin) < 20:
			speed = 0
			velocity = Vector3.ZERO
		else:
			speed = 4
			velocity = translation.direction_to($"../../Jad".global_transform.origin) * speed
		velocity = move_and_slide(velocity)
		
	if canMoveToPlayer:
		canMoveToJad = false
		if global_transform.origin.distance_to($"../../KinematicBody".global_transform.origin) < 7:
			velocity = Vector3.ZERO
		else:
			speed = 7
			velocity = translation.direction_to($"../../KinematicBody".global_transform.origin) * speed
	velocity = move_and_slide(velocity)
	
	if global_transform.origin.distance_to($"../../Jad".global_transform.origin) < 20 and visible and !canMoveToPlayer:
		yield($"../../Timer", "timeout")
		$"../../ViewportContainer/Viewport/TextureProgress".value += 0.1
		canMoveToJad = false
		$"../JadHeal".play()
	
	if $"../../HealerBar/CheckBox".pressed or $"../../ViewportContainer/Viewport/TextureProgress".value <= 0 or $"../../ViewportContainer2/Viewport2/ProgressBar".value <= 0:
		translation = Vector3(55.323,1.708,-21.572)
		canMoveToJad = true
		canMoveToPlayer = false
		self.show()
		if global_transform.origin.distance_to($"../../Jad".global_transform.origin) < 20:
			speed = 0
			velocity = Vector3.ZERO
		else:
			speed = 7
			velocity = translation.direction_to($"../../Jad".global_transform.origin) * speed
		velocity = move_and_slide(velocity)

func _on_Timer_timeout():
	if !Globals.prayingMelee:
		if canMoveToPlayer and global_transform.origin.distance_to($"../../KinematicBody".global_transform.origin) < 10:
			if Globals.tick == 1:
				yield($"../../Timer", "timeout")
				$"../Healer".play()
				Globals.healerhitDmg = true
				if accuracyRange >= accuracyNum:
					hitNum = rand_range(1, 14)
					$"../../ViewportContainer2/Viewport2/ProgressBar".value -= hitNum
					$"../../PrayNode/OrbContainer2/HpBar".value -= hitNum
					numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
					$"../../ViewportContainer2/Viewport2/HealerHitSplat".texture = redTex
					yield($"../../Timer2", "timeout")
				else:
					yield($"../../Timer", "timeout")
					$"../../ViewportContainer2/Viewport2/HealerHitSplat".texture = blueTex
					$"../../ViewportContainer2/Viewport2/HealerNum".text = ""
					yield($"../../Timer2", "timeout")
				
			if Globals.tick == 2:
				yield($"../../Timer2", "timeout")
				$"../Healer".play()
				Globals.healerhitDmg = true
				if accuracyRange >= accuracyNum:
					hitNum = rand_range(1, 14)
					$"../../ViewportContainer2/Viewport2/ProgressBar".value -= hitNum
					$"../../PrayNode/OrbContainer2/HpBar".value -= hitNum
					numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
					$"../../ViewportContainer2/Viewport2/HealerHitSplat".texture = redTex
					yield($"../../Timer", "timeout")
				else:
					yield($"../../Timer2", "timeout")
					$"../../ViewportContainer2/Viewport2/HealerHitSplat".texture = blueTex
					$"../../ViewportContainer2/Viewport2/HealerNum".text = ""
					yield($"../../Timer", "timeout")
