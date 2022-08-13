extends KinematicBody

var velocity = Vector3.ZERO
var speed
var canMoveToJad = true
var canMoveToPlayer

var hitNum
var accuracyRange
var accuracyNum = 4

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

onready var jadMHPBar = $"/root/Spatial/Jad/ViewportContainer/Viewport/TextureProgress"
onready var healerCollider = $"/root/Spatial/JadHealerCollider"

onready var numContainer = $"/root/Spatial/ViewportContainer2/Viewport2/HealerNum"
onready var hpBar = $"/root/Spatial/ViewportContainer2/Viewport2/ProgressBar"

func _ready():
	Globals.spawnHealers = true
	canMoveToJad = true
	canMoveToPlayer = false

func _physics_process(_delta):
	accuracyRange = rand_range(0,6)
	if Globals.prayingRigour:
		accuracyNum = 5
	else:
		accuracyNum = 4

	if get_tree().get_root().get_child(2).has_node("Jad"):
		if Globals.spawnHealers == true:
			if canMoveToJad:
				if global_transform.origin.distance_to(healerCollider.global_transform.origin) < 16 and canMoveToJad:
					speed = 0
					velocity = Vector3.ZERO
				else:
					speed = 7
					velocity = translation.direction_to(healerCollider.global_transform.origin) * speed
					velocity.y = 0
				velocity = move_and_slide(velocity)
			
			if global_transform.origin.distance_to(healerCollider.global_transform.origin) < 16 and canMoveToJad:
				yield($"Timer", "timeout")
				jadMHPBar.value += 0.1
				$"JadHeal".play()
			
			if canMoveToPlayer == true:
				if global_transform.origin.distance_to($"/root/Spatial/KinematicBody/PlayerCollider".global_transform.origin) < 7 and canMoveToPlayer:
					speed = 0
					velocity = Vector3.ZERO
				else:
					speed = 9
					velocity = translation.direction_to($"/root/Spatial/KinematicBody/PlayerCollider".global_transform.origin) * speed
					velocity.y = 0
				velocity = move_and_slide(velocity)
			
		if jadMHPBar.value <= 0:
			if get_tree().get_root().get_child(2).has_node("Healer"):
				$"/root/Spatial/Healer/ViewportContainer/Viewport/HpBar".value = 60
				$"/root/Spatial/Healer".canMoveToPlayer = false
				$"/root/Spatial/Healer".canMoveToJad = true
				$"/root/Spatial/Healer".hide()
				$"/root/Spatial/Healer".translation = Vector3(-112.47, -40, -96.504)
			
			if get_tree().get_root().get_child(2).has_node("Healer2"):
				$"/root/Spatial/Healer2/ViewportContainer/Viewport/HpBar".value = 60
				$"/root/Spatial/Healer2".canMoveToPlayer = false
				$"/root/Spatial/Healer2".canMoveToJad = true
				$"/root/Spatial/Healer2".hide()
				$"/root/Spatial/Healer2".translation = Vector3(-24.07, -40, -95.719)
			
			if get_tree().get_root().get_child(2).has_node("Healer3"):
				$"/root/Spatial/Healer3/ViewportContainer/Viewport/HpBar".value = 60
				$"/root/Spatial/Healer3".canMoveToPlayer = false
				$"/root/Spatial/Healer3".canMoveToJad = true
				$"/root/Spatial/Healer3".hide()
				$"/root/Spatial/Healer3".translation = Vector3(-107.823, -40, -127.299)
			
			if get_tree().get_root().get_child(2).has_node("Healer4"):
				$"/root/Spatial/Healer4/ViewportContainer/Viewport/HpBar".value = 60
				$"/root/Spatial/Healer4".canMoveToPlayer = false
				$"/root/Spatial/Healer4".canMoveToJad = true
				$"/root/Spatial/Healer4".hide()
				$"/root/Spatial/Healer4".translation = Vector3(-23.068, -40, -118.506)

func _on_Timer_timeout():
	if canMoveToPlayer and global_transform.origin.distance_to($"/root/Spatial/KinematicBody".global_transform.origin) < 8:
		if !Globals.prayingMelee:
			if Globals.tick == 1:
				yield($"/root/Spatial/Timer", "timeout")
				$"Healer".play()
				Globals.healerhitDmg = true
				if accuracyRange >= accuracyNum:
					hitNum = rand_range(1, 14)
					hpBar.value -= hitNum
					$"/root/Spatial/PrayNode/OrbContainer2/HpBar".value -= hitNum
					numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
					$"/root/Spatial/ViewportContainer2/Viewport2/HealerHitSplat".texture = redTex
					yield($"/root/Spatial/Timer2", "timeout")
				else:
					yield($"/root/Spatial/Timer", "timeout")
					$"/root/Spatial/ViewportContainer2/Viewport2/HealerHitSplat".texture = blueTex
					numContainer.text = ""
					yield($"/root/Spatial/Timer2", "timeout")
				
			if Globals.tick == 2:
				yield($"/root/Spatial/Timer", "timeout")
				$"Healer".play()
				Globals.healerhitDmg = true
				if accuracyRange >= accuracyNum:
					hitNum = rand_range(1, 14)
					hpBar.value -= hitNum
					$"/root/Spatial/PrayNode/OrbContainer2/HpBar".value -= hitNum
					numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
					$"/root/Spatial/ViewportContainer2/Viewport2/HealerHitSplat".texture = redTex
					yield($"/root/Spatial/Timer2", "timeout")
				else:
					yield($"/root/Spatial/Timer", "timeout")
					$"/root/Spatial/ViewportContainer2/Viewport2/HealerHitSplat".texture = blueTex
					numContainer.text = ""
					yield($"/root/Spatial/Timer2", "timeout")
