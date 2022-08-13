extends Node

onready var Healer1 = load("res://Scenes/Healer1.tscn")
onready var Healer2 = preload("res://Scenes/Healer2.tscn")
onready var Healer3 = preload("res://Scenes/Healer3.tscn")
onready var Healer4 = preload("res://Scenes/Healer4.tscn")
onready var Healer1Instance = Healer1.instance()
onready var Healer2Instance = Healer2.instance()
onready var Healer3Instance = Healer3.instance()
onready var Healer4Instance = Healer4.instance()

func AddHealers():
	if !get_tree().get_root().get_child(2).has_node("Healer"):
		get_tree().current_scene.add_child(Healer1Instance)
		Healer1Instance.transform.origin = Vector3(-112.47, -40, -96.504)
	if !get_tree().get_root().get_child(2).has_node("Healer2"):
		get_tree().current_scene.add_child(Healer2Instance)
		Healer2Instance.transform.origin = Vector3(-24.07, -40, -95.719)
	if !get_tree().get_root().get_child(2).has_node("Healer3"):
		get_tree().current_scene.add_child(Healer3Instance)
		Healer3Instance.transform.origin = Vector3(-107.823, -40, -127.299)
	if !get_tree().get_root().get_child(2).has_node("Healer4"):
		get_tree().current_scene.add_child(Healer4Instance)
		Healer4Instance.transform.origin = Vector3(-23.068, -40, -118.506)
