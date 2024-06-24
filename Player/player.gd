extends CharacterBody2D

var movement_speed = 40.0

func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left") #outputs 0 or 1 if false or true 
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up") #the all inputs are already defined in project setting in the input mapping tab
	var mov = Vector2(x_mov, y_mov) #this give the direction of x and y axis for eg: (3, 5)
	velocity = mov.normalized()*movement_speed #the velocity is the inbuild function in the godot by which we are manipulating the direction of the character by inputing the vector in it and multiplying with the speed
	move_and_slide() #used to move our character
