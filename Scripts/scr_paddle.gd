extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var y = get_pos().y  #Gets Initial Y Position and stores >> y
	var mouse_x = get_viewport().get_mouse_pos().x  #Gets mouse X postion and stores >> mouse_x
	set_pos( Vector2(mouse_x,y))  #Makes Paddle follow the Xposition of the mouse