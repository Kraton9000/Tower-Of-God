extends Area2D

var screensize
var mouse_over

signal click

func _ready():
	screensize = get_viewport_rect().size
	
	connect("mouse_entered", self, "mouse_status", [true])
	connect("mouse_exited", self, "mouse_status", [false])

func _unhandled_input(event):
	if mouse_over and event is InputEventMouseButton and event.is_pressed():
		get_tree().set_input_as_handled()
		emit_signal("click")

func mouse_status(over):
	mouse_over = over