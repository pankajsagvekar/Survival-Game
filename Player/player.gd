extends CharacterBody2D

var movement_speed = 50.0
@onready var sprite = $Sprite2D
@onready var walkTimer = get_node("walkTimer")

func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left") #outputs 0 or 1 if false or true 
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up") #the all inputs are already defined in project setting in the input mapping tab
	var mov = Vector2(x_mov, y_mov) #this give the direction of x and y axis for eg: (3, 5)
	if mov.x > 0:
		sprite.flip_h = true
	elif mov.x < 0:
		sprite.flip_h = false
		
	if mov != Vector2.ZERO:
			if walkTimer.is_stopped():
				if sprite.frame >= sprite.hframes - 1:
					sprite.frame = 0
				else:
					sprite.frame += 1
				walkTimer.start()
	
	velocity = mov.normalized()*movement_speed #the velocity is the inbuild function in the godot by which we are manipulating the direction of the character by inputing the vector in it and multiplying with the speed
	move_and_slide() #used to move our character
