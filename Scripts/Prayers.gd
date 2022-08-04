extends Node

onready var prayPanel = $"/root/Spatial/PrayNode/PrayPanel"
onready var prayIcon = $"/root/Spatial/PrayNode/PrayerIcon"
onready var prayOff = load("res://Sprites/PrayTab/PrayOff.png")

onready var prayMage = load("res://Sprites/PrayTab/prayMage.png")
onready var mageIcon = load("res://Sprites/PrayIcon/mageIcon.png")
var prayingMage

onready var prayRanged = load("res://Sprites/PrayTab/prayRange.png")
onready var rangedIcon = load("res://Sprites/PrayIcon/rangeIcon.png")
var prayingRanged

onready var prayMelee = load("res://Sprites/PrayTab/PrayMelee.png")
onready var meleeIcon = load("res://Sprites/PrayIcon/meleeIcon.png")
var prayingMelee

onready var prayTimer = $"../OrbContainer/Timer"
var prayerDrainRate : int = 0
var canPray = true

onready var sharpEye = load("res://Sprites/PrayTab/SharpEye.png")
onready var hawkEye = load("res://Sprites/PrayTab/HawkEye.png")
onready var eagleEye = load("res://Sprites/PrayTab/EagleEye.png")
onready var rigourIcon = load("res://Sprites/PrayTab/Rigour.png")

func _ready():
	$"/root/Spatial/PrayNode/PrayerIcon".set_visible(false)
	prayTimer.start()

func _process(_x):
	PrayOff()
	if $"../OrbContainer/PrayerBar".value <= 0:
		Globals.prayingMage = false
		Globals.prayingRange = false
		Globals.prayingMelee = false
		prayingMage = false
		prayingRanged = false
		prayingMelee = false
		$"../RangedButton".set_pressed(false)
		$"../MeleeButton".set_pressed(false)
		$"../MageButton".set_pressed(false)
		$"../SharpEye".set_pressed(false)
		$"../HawkEye".set_pressed(false)
		$"../EagleEye".set_pressed(false)
		$"../Rigour".set_pressed(false)
		prayerDrainRate = 0

func _on_mage_toggled(button_pressed):
	if button_pressed and canPray:
		Globals.prayingMage = true
		Globals.prayingRange = false
		Globals.prayingMelee = false
		prayIcon.visible = true
		prayPanel.texture = prayMage
		prayIcon.texture = mageIcon
		prayingMage = true
		prayingRanged = false
		prayingMelee = false
		$"../RangedButton".set_pressed(false)
		$"../MeleeButton".set_pressed(false)
		prayerDrainRate += 1
	if !button_pressed:
		$"../PrayOff".play()
		Globals.prayingMage = false
		prayIcon.visible = false
		prayPanel.texture = prayOff
		prayingMage = false
		prayerDrainRate -= 1
	if $"../RangedButton".pressed and canPray:
		prayerDrainRate -= 1
		_on_ranged_toggled(true)
		Globals.prayOff = false
	if $"../MeleeButton".pressed and canPray: 
		prayerDrainRate -= 1
		_on_MeleeButton_toggled(true)
		Globals.prayOff = false

func _on_ranged_toggled(button_pressed):
	if button_pressed and canPray: 
		Globals.prayingMage = false
		Globals.prayingRange = true
		Globals.prayingMelee = false
		prayIcon.visible = true
		prayPanel.texture = prayRanged
		prayIcon.texture = rangedIcon
		prayingMage = false
		prayingRanged = true
		prayingMelee = false
		$"../MageButton".set_pressed(false)
		$"../MeleeButton".set_pressed(false)
		prayerDrainRate += 1
	if !button_pressed:
		$"../PrayOff".play()
		Globals.prayingRange = false
		prayIcon.visible = false
		prayPanel.texture = prayOff
		prayingRanged = false
		prayerDrainRate -= 1
	if $"../MageButton".pressed and canPray:
		prayerDrainRate -= 1
		_on_mage_toggled(true)
		Globals.prayOff = false
	if $"../MeleeButton".pressed and canPray: 
		prayerDrainRate -= 1
		_on_MeleeButton_toggled(true)
		Globals.prayOff = false
		
func _on_MeleeButton_toggled(button_pressed):
	if button_pressed and canPray:               
		Globals.prayingMage = false
		Globals.prayingRange = false
		Globals.prayingMelee = true
		prayIcon.visible = true
		prayPanel.texture = prayMelee
		prayIcon.texture = meleeIcon
		prayingMage = false
		prayingRanged = false
		prayingMelee = true
		$"../MageButton".set_pressed(false)
		$"../RangedButton".set_pressed(false)
		prayerDrainRate += 1
	if !button_pressed:
		$"../PrayOff".play()
		Globals.prayingMelee = false
		prayIcon.visible = false
		prayPanel.texture = prayOff
		prayingMelee = false
		prayerDrainRate -= 1
	if $"../MageButton".pressed and canPray:
		prayerDrainRate -= 1
		_on_mage_toggled(true)
		Globals.prayOff = false
	if $"../RangedButton".pressed and canPray:
		prayerDrainRate -= 1
		_on_ranged_toggled(true)
		Globals.prayOff = false

func PrayOff():
	if prayPanel.texture == prayOff:
		Globals.prayOff = true 
	else:             
		Globals.prayOff = false

func _on_SharpEye_toggled(button_pressed):
	if button_pressed and canPray:
		$"../SharpEye".icon = sharpEye
		Globals.prayOn = true
		$"../SharpEye".pressed = true
		$"../HawkEye".pressed = false
		$"../EagleEye".pressed = false
		$"../Rigour".pressed = false
		$"../../Jad/KinematicBody".accuracyAddSub -= 0.5
		$"../../Jad/KinematicBody".maxHit += 1
		prayerDrainRate += 1
	if !button_pressed:
		Globals.prayOn = false
		prayerDrainRate -= 1
		$"../SharpEye".icon = null
		$"../../Jad/KinematicBody".accuracyAddSub += 0.5
		$"../../Jad/KinematicBody".maxHit -= 1

func _on_HawkEye_toggled(button_pressed):
	if button_pressed and canPray:
		$"../HawkEye".icon = hawkEye
		Globals.prayOn = true
		$"../SharpEye".pressed = false
		$"../HawkEye".pressed = true
		$"../EagleEye".pressed = false
		$"../Rigour".pressed = false
		$"../../Jad/KinematicBody".accuracyAddSub -= 1
		$"../../Jad/KinematicBody".maxHit += 2
		prayerDrainRate += 1
	if !button_pressed:
		Globals.prayOn = false
		prayerDrainRate -= 1
		$"../HawkEye".icon = null
		$"../../Jad/KinematicBody".accuracyAddSub += 1
		$"../../Jad/KinematicBody".maxHit -= 2

func _on_EagleEye_toggled(button_pressed):
	if button_pressed and canPray:
		$"../EagleEye".icon = eagleEye
		Globals.prayOn = true
		$"../SharpEye".pressed = false
		$"../HawkEye".pressed = false
		$"../EagleEye".pressed = true
		$"../Rigour".pressed = false
		$"../../Jad/KinematicBody".accuracyAddSub -= 1.5
		$"../../Jad/KinematicBody".maxHit += 3
		prayerDrainRate += 1
	if !button_pressed:
		Globals.prayOn = false
		prayerDrainRate -= 1
		$"../EagleEye".icon = null
		$"../../Jad/KinematicBody".accuracyAddSub += 1.5
		$"../../Jad/KinematicBody".maxHit -= 3

func _on_Rigour_toggled(button_pressed):
	if button_pressed and canPray:
		$"../Rigour".icon = rigourIcon
		Globals.prayOn = true
		$"../SharpEye".pressed = false
		$"../HawkEye".pressed = false
		$"../EagleEye".pressed = false
		$"../Rigour".pressed = true
		prayerDrainRate += 1
		$"../../Jad/KinematicBody".accuracyAddSub -= 2
		$"../../Jad/KinematicBody".maxHit += 4
	if !button_pressed:
		Globals.prayOn = false
		prayerDrainRate -= 1
		$"../Rigour".icon = null
		$"../../Jad/KinematicBody".accuracyAddSub += 2
		$"../../Jad/KinematicBody".maxHit -= 4

func _on_Timer_timeout():
	if $"../OrbContainer/PrayerBar".value > 0:
		$"../OrbContainer/PrayerBar".value -= prayerDrainRate
