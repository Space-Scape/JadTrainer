extends Node

onready var prayPanel = $"/root/Spatial/PrayNode/PrayPanel"
onready var prayIcon = $"/root/Spatial/PrayNode/PrayerIcon"
onready var prayOff = load("res://Sprites/PrayTab/PrayOff.png")
var canPlayDrain = true

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

func _process(_x):
	PrayOff()
	if $"../OrbContainer/PrayerBar".value <= 0:
		if Globals.tick == 1:
			if canPlayDrain:
				canPlayDrain = false
				$"../PrayDrain".play()
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
		elif Globals.tick == 2:
			if canPlayDrain:
				canPlayDrain = false
				$"../PrayDrain".play()
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
	if button_pressed: 
		if canPray:
			if Globals.tick == 1:
				$"../MageButton".set_pressed(true)
				$"../RangedButton".set_pressed(false)
				$"../MeleeButton".set_pressed(false)
				yield($"../../Timer", "timeout")  
				prayTimer.start()
				$"../MagePray".play()
				Globals.prayingMage = true
				Globals.prayingRange = false
				Globals.prayingMelee = false
				prayIcon.visible = true
				prayPanel.texture = prayMage
				prayIcon.texture = mageIcon
				prayingMage = true
				prayingRanged = false
				prayingMelee = false
				prayerDrainRate += 1
				yield($"../../Timer2", "timeout")  
			elif Globals.tick == 2:
				$"../MageButton".set_pressed(true)
				$"../RangedButton".set_pressed(false)
				$"../MeleeButton".set_pressed(false)
				yield($"../../Timer2", "timeout")  
				prayTimer.start()
				$"../MagePray".play()
				Globals.prayingMage = true
				Globals.prayingRange = false
				Globals.prayingMelee = false
				prayIcon.visible = true
				prayPanel.texture = prayMage
				prayIcon.texture = mageIcon
				prayingMage = true
				prayingRanged = false
				prayingMelee = false
				prayerDrainRate += 1
				yield($"../../Timer", "timeout")  
	else:
		if Globals.tick == 1:
			$"../MageButton".set_pressed(false)
			yield($"../../Timer", "timeout")              
			$"../PrayOff".play()
			Globals.prayingMage = false
			prayIcon.visible = false
			prayPanel.texture = prayOff
			prayingMage = false
			prayerDrainRate -= 1
			yield($"../../Timer2", "timeout")              
		elif Globals.tick == 2:
			$"../MageButton".set_pressed(false)
			yield($"../../Timer2", "timeout")              
			$"../PrayOff".play()
			Globals.prayingMage = false
			prayIcon.visible = false
			prayPanel.texture = prayOff
			prayingMage = false
			prayerDrainRate -= 1
			yield($"../../Timer", "timeout")              

func _on_ranged_toggled(button_pressed):
	if button_pressed: 
		if canPray:
			if Globals.tick == 1:
				$"../RangedButton".set_pressed(true)
				$"../MageButton".set_pressed(false)
				$"../MeleeButton".set_pressed(false)
				yield($"../../Timer", "timeout")              
				prayTimer.start()
				$"../RangePray".play()
				Globals.prayingMage = false
				Globals.prayingRange = true
				Globals.prayingMelee = false
				prayIcon.visible = true
				prayPanel.texture = prayRanged
				prayIcon.texture = rangedIcon
				prayingMage = false
				prayingRanged = true
				prayingMelee = false
				prayerDrainRate += 1
				yield($"../../Timer2", "timeout")              
			elif Globals.tick == 2:
				$"../RangedButton".set_pressed(true)
				$"../MageButton".set_pressed(false)
				$"../MeleeButton".set_pressed(false)
				yield($"../../Timer2", "timeout")              
				prayTimer.start()
				$"../RangePray".play()
				Globals.prayingMage = false
				Globals.prayingRange = true
				Globals.prayingMelee = false
				prayIcon.visible = true
				prayPanel.texture = prayRanged
				prayIcon.texture = rangedIcon
				prayingMage = false
				prayingRanged = true
				prayingMelee = false
				prayerDrainRate += 1
				yield($"../../Timer", "timeout")              
	else:
		if Globals.tick == 1:
			$"../RangedButton".set_pressed(false)
			yield($"../../Timer", "timeout")              
			$"../PrayOff".play()
			Globals.prayingRange = false
			prayIcon.visible = false
			prayPanel.texture = prayOff
			prayingRanged = false
			prayerDrainRate -= 1
			yield($"../../Timer2", "timeout")              
		elif Globals.tick == 2:
			$"../RangedButton".set_pressed(false)
			yield($"../../Timer2", "timeout")              
			$"../PrayOff".play()
			Globals.prayingRange = false
			prayIcon.visible = false
			prayPanel.texture = prayOff
			prayingRanged = false
			prayerDrainRate -= 1
			yield($"../../Timer", "timeout")              


func _on_MeleeButton_toggled(button_pressed):
	if button_pressed: 
		if canPray:
			if Globals.tick == 1:
				$"../MeleeButton".set_pressed(true)
				$"../MageButton".set_pressed(false)
				$"../RangedButton".set_pressed(false)
				yield($"../../Timer", "timeout")              
				prayTimer.start()
				Globals.prayingMage = false
				Globals.prayingRange = false
				Globals.prayingMelee = true
				prayIcon.visible = true
				prayPanel.texture = prayMelee
				prayIcon.texture = meleeIcon
				prayingMage = false
				prayingRanged = false
				prayingMelee = true
				prayerDrainRate += 1
				yield($"../../Timer2", "timeout")              
			elif Globals.tick == 2:
				$"../MeleeButton".set_pressed(true)
				$"../MageButton".set_pressed(false)
				$"../RangedButton".set_pressed(false)
				yield($"../../Timer2", "timeout")              
				prayTimer.start()
				Globals.prayingMage = false
				Globals.prayingRange = false
				Globals.prayingMelee = true
				prayIcon.visible = true
				prayPanel.texture = prayMelee
				prayIcon.texture = meleeIcon
				prayingMage = false
				prayingRanged = false
				prayingMelee = true
				prayerDrainRate += 1
				yield($"../../Timer", "timeout")
	else:
		if Globals.tick == 1:
			$"../MeleeButton".set_pressed(false)
			yield($"../../Timer", "timeout")
			$"../PrayOff".play()
			Globals.prayingMelee = false
			prayIcon.visible = false
			prayPanel.texture = prayOff
			prayingMelee = false
			prayerDrainRate -= 1
			yield($"../../Timer2", "timeout")
		elif Globals.tick == 2:
			$"../MeleeButton".set_pressed(false)
			yield($"../../Timer2", "timeout")
			$"../PrayOff".play()
			Globals.prayingMelee = false
			prayIcon.visible = false
			prayPanel.texture = prayOff
			prayingMelee = false
			prayerDrainRate -= 1
			yield($"../../Timer", "timeout")

func PrayOff():
	if prayPanel.texture == prayOff:
		Globals.prayOff = true 
	else:             
		Globals.prayOff = false

func _on_SharpEye_toggled(button_pressed):
	if button_pressed: 
		if canPray:
			if Globals.tick == 1:
				$"../HawkEye".pressed = false
				$"../EagleEye".pressed = false
				$"../Rigour".pressed = false
				yield($"../../Timer", "timeout")
				$"../SharpEyeSfx".play()
				$"../SharpEye".icon = sharpEye
				Globals.prayOn = true
				prayTimer.start()
				$"../../Jad/KinematicBody".accuracyAddSub -= 0.5
				$"../../Jad/KinematicBody".maxHit += 1
				prayerDrainRate += 1
			elif Globals.tick == 2:
				$"../HawkEye".pressed = false
				$"../EagleEye".pressed = false
				$"../Rigour".pressed = false
				yield($"../../Timer2", "timeout")
				$"../SharpEyeSfx".play()
				$"../SharpEye".icon = sharpEye
				Globals.prayOn = true
				prayTimer.start()
				$"../../Jad/KinematicBody".accuracyAddSub -= 0.5
				$"../../Jad/KinematicBody".maxHit += 1
				prayerDrainRate += 1
	else:
		if Globals.tick == 1:
			button_pressed = false
			yield($"../../Timer", "timeout")
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../SharpEye".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 0.5
			$"../../Jad/KinematicBody".maxHit -= 1
			$"../PrayOff".play()
			yield($"../../Timer2", "timeout")
		if Globals.tick == 2:
			button_pressed = false
			yield($"../../Timer2", "timeout")
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../SharpEye".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 0.5
			$"../../Jad/KinematicBody".maxHit -= 1
			$"../PrayOff".play()
			yield($"../../Timer", "timeout")

func _on_HawkEye_toggled(button_pressed):
	if button_pressed: 
		if canPray:
			if Globals.tick == 1:
				$"../SharpEye".pressed = false
				$"../EagleEye".pressed = false
				$"../Rigour".pressed = false
				yield($"../../Timer", "timeout")
				$"../HawkEyeSfx".play()
				$"../HawkEye".icon = hawkEye
				Globals.prayOn = true
				prayTimer.start()
				$"../../Jad/KinematicBody".accuracyAddSub -= 1
				$"../../Jad/KinematicBody".maxHit += 2
				prayerDrainRate += 1
			elif Globals.tick == 2:
				$"../SharpEye".pressed = false
				$"../EagleEye".pressed = false
				$"../Rigour".pressed = false
				yield($"../../Timer2", "timeout")
				$"../HawkEyeSfx".play()
				$"../HawkEye".icon = hawkEye
				Globals.prayOn = true
				prayTimer.start()
				$"../../Jad/KinematicBody".accuracyAddSub -= 1
				$"../../Jad/KinematicBody".maxHit += 2
	else:
		if Globals.tick == 1:
			button_pressed = false
			yield($"../../Timer", "timeout")
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../HawkEye".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 1
			$"../../Jad/KinematicBody".maxHit -= 2
			$"../PrayOff".play()
			yield($"../../Timer2", "timeout")
		elif Globals.tick == 2:
			button_pressed = false
			yield($"../../Timer2", "timeout")
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../HawkEye".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 1
			$"../../Jad/KinematicBody".maxHit -= 2
			$"../PrayOff".play()
			yield($"../../Timer", "timeout")

func _on_EagleEye_toggled(button_pressed):
	if button_pressed: 
		if canPray:
			if Globals.tick == 1:
				$"../SharpEye".pressed = false
				$"../HawkEye".pressed = false
				$"../Rigour".pressed = false
				yield($"../../Timer", "timeout")
				$"../EagleEyeSfx".play()
				$"../EagleEye".icon = eagleEye
				prayTimer.start()
				Globals.prayOn = true
				$"../../Jad/KinematicBody".accuracyAddSub -= 1.5
				$"../../Jad/KinematicBody".maxHit += 3
				prayerDrainRate += 1
			elif Globals.tick == 2:
				$"../SharpEye".pressed = false
				$"../HawkEye".pressed = false
				$"../Rigour".pressed = false
				yield($"../../Timer2", "timeout")
				$"../EagleEyeSfx".play()
				$"../EagleEye".icon = eagleEye
				Globals.prayOn = true
				prayTimer.start()
				$"../../Jad/KinematicBody".accuracyAddSub -= 1.5
				$"../../Jad/KinematicBody".maxHit += 3
				prayerDrainRate += 1
	else:
		if Globals.tick == 1:
			yield($"../../Timer", "timeout")
			button_pressed = false
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../EagleEye".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 1.5
			$"../../Jad/KinematicBody".maxHit -= 3
			$"../PrayOff".play()
			yield($"../../Timer2", "timeout")
		elif Globals.tick == 2:
			yield($"../../Timer", "timeout")
			button_pressed = false
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../EagleEye".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 1.5
			$"../../Jad/KinematicBody".maxHit -= 3
			$"../PrayOff".play()
			yield($"../../Timer", "timeout")

func _on_Rigour_pressed(button_pressed):
	if button_pressed:
		if canPray:
			if Globals.tick == 1:
				$"../SharpEye".pressed = false
				$"../HawkEye".pressed = false
				$"../EagleEye".pressed = false
				yield($"../../Timer", "timeout")
				$"../RigourSfx".play()
				$"../Rigour".icon = rigourIcon
				Globals.prayOn = true
				prayTimer.start()
				prayerDrainRate += 1
				$"../../Jad/KinematicBody".accuracyAddSub -= 2
				$"../../Jad/KinematicBody".maxHit += 4
			elif Globals.tick == 2:
				$"../SharpEye".pressed = false
				$"../HawkEye".pressed = false
				$"../EagleEye".pressed = false
				yield($"../../Timer2", "timeout")
				$"../RigourSfx".play()
				$"../Rigour".icon = rigourIcon
				Globals.prayOn = true
				prayTimer.start()
				prayerDrainRate += 1
				$"../../Jad/KinematicBody".accuracyAddSub -= 2
				$"../../Jad/KinematicBody".maxHit += 4
	else:
		if Globals.tick == 1:
			button_pressed = false
			yield($"../../Timer", "timeout")
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../Rigour".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 2
			$"../../Jad/KinematicBody".maxHit -= 4
			$"../PrayOff".play()
			yield($"../../Timer2", "timeout")
		elif Globals.tick == 2:
			button_pressed = false
			yield($"../../Timer2", "timeout")
			Globals.prayOn = false
			prayerDrainRate -= 1
			$"../Rigour".icon = null
			$"../../Jad/KinematicBody".accuracyAddSub += 2
			$"../../Jad/KinematicBody".maxHit -= 4
			$"../PrayOff".play()
			yield($"../../Timer", "timeout")

func _on_Timer_timeout():
	if $"../OrbContainer/PrayerBar".value > 0:
		$"../OrbContainer/PrayerBar".value -= prayerDrainRate
