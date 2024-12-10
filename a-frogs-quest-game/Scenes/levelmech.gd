extends Node2D

@export var max_time = 30

@onready var lives_label = $LivesLabel
@onready var timer_label = $TimerLabel
@onready var timer = $Timer
@onready var player = $"CharacterBody2D - player"

var current_time = 30
var player_lives = 3
var starting_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	current_time = max_time
	lives_label.text = "Lives: " + str(player_lives) #format label to show: Lives:3 for START
	timer_label.text = "Time " + format_time(current_time) # format label to show: Time 00:30 for START
	timer.wait_time  = 1.0
	timer.start()

func on_Timer_timeout():
	current_time -= 1 
	timer_label.text = "Time " + format_time(current_time)
	
	# if time is less than or equal to zero i.e. time has run out
	if current_time <=0:
		print ("Time's Up!") 
		$Timer.stop() # stop timer

func format_time(time):
	var m = int(time) / 60 # minutes
	var s = int(time) % 60 # seconds
	return "%02d:%02d" % [m,s]
	
func _game_over():
	player_lives -= 1
	lives_label.text = "Lives: " + str(player_lives)
	
	if player_lives > 0:
		#respawn at starting position
		player.position = starting_position # resets player position
		current_time = max_time # reset timer after death
		timer_label.text = "Time " + format_time(current_time) # update timer
		timer.start() # restart timer
	else:
		print("Game Over!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_Timer_timeout() -> void:
	pass # Replace with function body.
