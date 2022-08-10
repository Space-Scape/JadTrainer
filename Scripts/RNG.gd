extends Node

var number
onready var timer = get_node("../../Timer")
onready var timer2 = get_node("../../Timer2")
var attDetermined = false
var attWithRanged
var attWithMage
export var attWithMelee : bool
onready var mageTexture = load("res://Sprites/magicAtt.png")
onready var rangeTexture = load("res://Sprites/rangeAtt.png")

func _ready():
	if Globals.tick == 1:
		attDetermined = true
		yield($"/root/Spatial/Timer", "timeout")
	if Globals.tick == 2:
		attDetermined = true
		yield($"/root/Spatial/Timer", "timeout")

func _process(_x):
	number = rand_range(-5,5)
	yield(timer,"timeout")
	number = 0

func set_attack():
	number = rand_range(-5,5)
	if number > 0 and !$"../../../3DPlayer/HitBoxes".jadCanMelee:
		attWithMage = true
		attWithRanged = false
		attWithMelee = false
		$"../../Mage".play()
		$"../../AnimationPlayerMage".play("MageAnim")
		$"../../FireBall".play("FireBall")
	if number < 0 and !$"../../../3DPlayer/HitBoxes".jadCanMelee:
		attWithMage = false
		attWithRanged = true
		attWithMelee = false
		$"../../Range".play()
		$"../../AnimationPlayerRanged".play("RangedAnim")
		$"../../BoulderAnim".play("Boulder")
	if $"../../../3DPlayer/HitBoxes".jadCanMelee and number >= -2 and number <= 2:
		attWithRanged = false
		attWithMage = false
		attWithMelee = true
		$"../../AnimationPlayerMelee".play("MeleeAnim")
	elif number >= 2 and $"../../../3DPlayer/HitBoxes".jadCanMelee:
		attWithRanged = true
		attWithMage = false
		attWithMelee = false
		$"../../Range".play()
		$"../../AnimationPlayerRanged".play("RangedAnim")
		$"../../BoulderAnim".play("Boulder")
	elif number <= -2 and $"../../../3DPlayer/HitBoxes".jadCanMelee:
		attWithRanged = false
		attWithMage = true
		attWithMelee = false
		$"../../Mage".play()
		$"../../AnimationPlayerMage".play("MageAnim")
		$"../../FireBall".play("FireBall")

func set_anim():
	if attDetermined:
		if attWithMage:
			Globals.attWithMage = true
			Globals.attWithRange = false
			Globals.attWithMelee = false
		if attWithRanged:
			Globals.attWithMage = false
			Globals.attWithRange = true
			Globals.attWithMelee = false
		if attWithMelee:
			Globals.attWithMage = false
			Globals.attWithRange = false
			Globals.attWithMelee = true

func _on_Timer_timeout():
	if Globals.tick == 1:
		yield($"/root/Spatial/Timer", "timeout")
		attDetermined = true
		set_anim()
		set_attack()
		yield($"/root/Spatial/Timer2", "timeout")
	elif Globals.tick == 2:
		yield($"/root/Spatial/Timer2", "timeout")
		attDetermined = true
		set_anim()
		set_attack()
		yield($"/root/Spatial/Timer", "timeout")

func _on_Timer2_timeout():
	attDetermined = false
	
