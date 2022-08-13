extends Node

var time = 0.0
var max_time = 0.6

func _init(_max_time):
	self.max_time = 0.6
	self.time = 0

func tick(delta):
	time = max(time - delta, 0)

func is_ready():
	if time > 0:
		return false
	time = max_time
	return true
