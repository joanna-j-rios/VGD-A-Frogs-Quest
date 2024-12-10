extends CharacterBody2D

@export var speed = 100
@export var lives = 3

func _physics_process(delta):

	# handle player_frog movement
	var direction = Input.get_axis("left","right")
	var vertical = Input.get_axis("up","down")
	
	# combine movement into single vector to tell direction
	direction = Vector2(direction,vertical)

	# Get the input direction and handle the movement/deceleration.
	velocity = direction * speed
	move_and_slide()
	
func _on_area(area):
	if area.name.startswith("water"):
		lives -= 1
		
	
	

func _on_timer_timeout() -> void:
	pass # Replace with function body.
