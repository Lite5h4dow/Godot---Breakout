extends RigidBody2D
const maxSpeed = 200
const speedInc = 5

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	delta = delta*100
	var bodies = get_colliding_bodies() #Fetches Colliding Bodies
	
	for body in bodies:   # Looks through items coliding with
		if body.is_in_group("Brick"):  # Looks to see if its in a Group
			body.queue_free()  #Destroys it if it is

		if body.get_name() == "Body_Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized()*min(speed+speedInc*delta, maxSpeed*delta)
			set_linear_velocity(velocity)

	if get_pos().y > get_viewport_rect().end.y:
		queue_free()
		print("balls dead nigga")