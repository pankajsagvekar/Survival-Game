extends CharacterBody2D

@export var movement_speed = 20.0

@onready var player = get_tree().get_first_node_in_group("player") #get group player coordinates, Group is defined in the players group tab

func _physics_process(__delta): #__delta because we are not using it
	var direction = global_position.direction_to(player.global_position) #get direction of player and follow him
	velocity = direction * movement_speed
	move_and_slide()
