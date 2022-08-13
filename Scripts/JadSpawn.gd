extends Spatial

onready var Jad = preload("res://Scenes/Jad.tscn")
onready var jadInstance = Jad.instance()

onready var JadHealerCollider = preload("res://Scenes/JadHealerCollider.tscn")
onready var JadHealerColliderInstance = JadHealerCollider.instance()

func _ready():
	Globals.jadMSpawned = true
	add_child(jadInstance)
	jadInstance.transform.origin = Vector3(-67.445, -42.187, -96.662)
	add_child(JadHealerColliderInstance)
