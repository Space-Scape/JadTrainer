extends Node

var number
onready var timer = get_node("../../Timer")
onready var timer2 = get_node("../../Timer2")
var attDetermined = false
var attWithRanged
var attWithMage

onready var mageTexture = load("res://Sprites/magicAtt.png")
onready var rangeTexture = load("res://Sprites/rangeAtt.png")

func _process(_x):
	number = rand_range(-5,5)
	yield(timer,"timeout")
	number = 0

func set_attack():
	number = rand_range(-5,5)
	if number > 0:
		get_parent().texture = mageTexture
		attWithMage = true
		attWithRanged = false
		$"../../Mage".play()
		$"../../AnimationPlayerMage".play("MageAnim")
	elif number < 0:
		get_parent().texture = rangeTexture
		attWithMage = false
		attWithRanged = true
		$"../../Range".play()
		$"../../AnimationPlayerRanged".play("RangedAnim")

func set_anim():
	if attDetermined:
		if attWithMage:
			Globals.attWithMage = true
			Globals.attWithRange = false
		if attWithRanged:
			Globals.attWithMage = false
			Globals.attWithRange = true

func _on_Timer_timeout():
	attDetermined = true
	set_anim()
	set_attack()

func _on_Timer2_timeout():
	attDetermined = false
	
