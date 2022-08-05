extends KinematicBody

var velocity
var speed = 10
var point = Vector3(-46.458,1.76,-62.36)
var canMoveToJad
var canMoveToPlayer

var hitNum
var accuracyRange
var accuracyNum = 4.5

onready var blueTex = load("res://Sprites/hitsplatBlue.png")
onready var redTex = load("res://Sprites/hitsplatRed.png")

onready var numContainer = $"../../3DPlayer/Viewport/HitsplatNum"
onready var hpBar = $"../../3DPlayer/Viewport/ProgressBar"

func _ready():
	canMoveToJad = false

func _process(_delta):
	accuracyRange = rand_range(0,6)
	
	if $"../../PrayNode/Rigour".pressed:
		accuracyNum = 5
	
	if  $"../../Jad/KinematicBody/Viewport/TextureProgress".value <= 125:
		point = Vector3(-29.035,1.708,-32.321)
		self.show()
	if  $"../../Jad/KinematicBody/Viewport/TextureProgress".value <= 0:
		point = Vector3(-29.035,1.708,-32.321)
	
	if canMoveToPlayer:
		canMoveToJad = false
		point = Vector3(-17.93,1.708,4.517)
	
	var direction
	if point.distance_to(transform.origin) > 0.6:
		direction = point - transform.origin
		direction = direction.normalized() * speed
	else:
		direction = point - transform.origin
	move_and_slide(direction)
	
	if point.distance_to(transform.origin) < 1 and visible and !canMoveToPlayer:
		$"../../Jad/KinematicBody/Viewport/TextureProgress".value += 0.3
	
	if $"../../HealerBar/CheckBox".pressed:
		translation = Vector3(-46.458,1.76,-62.36)

func _on_Timer_timeout():
	if !Globals.prayingMelee:
		if canMoveToPlayer and point.distance_to(transform.origin) < 0.6:
			$"../Healer".play()
			if accuracyRange >= accuracyNum:
				Globals.hitDmg = true
				hitNum = rand_range(1, 14)
				$"../../3DPlayer/Viewport/ProgressBar".value -= hitNum
				$"../../PrayNode/OrbContainer2/HpBar".value -= hitNum
				numContainer.bbcode_text = "[center]" + str(hitNum).pad_decimals(0) + "[/center]"
				$"../../3DPlayer/Viewport/HitSplat".texture = redTex
