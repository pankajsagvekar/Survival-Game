extends CharacterBody2D

@export var movement_speed = 20.0


@onready var player = get_tree().get_first_node_in_group("player") #get group player
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer #using animationplayer for enemy because the animation is continous

func _ready(): #using ready beacuse it runs once at the beginning
	animation.play("walk")

func _physics_process(__delta): #__delta because we are not using it
	var direction = global_position.direction_to(player.global_position) #get direction of player and follow him
	velocity = direction * movement_speed
	move_and_slide()
	
	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x  < -0.1:
		sprite.flip_h = false
