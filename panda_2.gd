extends CharacterBody2D

const SPEED = 400.0
const OFFSET_Y = -130.0 

var is_selected : bool = false
var target_position : Vector2
var table_clicked : bool = false;
var timer = Timer.new()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	input_pickable = true # To handle clicks
	target_position = position
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta):
	# Check for click on screen
	if Input.is_action_just_pressed("click") && is_selected:
		print("a lil click2")
		
		# Need to wait because main scene calculates who is on top
		await get_tree().create_timer(0.1).timeout
		
		# Move to another object's position
		if table_clicked:
			print("panda2 teab et lauda puudutati")
			target_position = Vector2(800,400)
			table_clicked = false
			$AnimatedSprite2D.animation = "surprised"
		else:
			target_position = get_global_mouse_position() + Vector2(0,OFFSET_Y)
			$AnimatedSprite2D.animation = "default"	
		
		is_selected = false 
		
	# Actual movement
	velocity = position.direction_to(target_position) * SPEED
	if position.distance_to(target_position) > 10:
		move_and_slide()
		$AnimatedSprite2D.play()
		
	else:
		$AnimatedSprite2D.stop()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		get_parent().clicked.append(self)
		get_parent().set_process(true)

func on_click():
	is_selected = true

func _on_table_table_clicked():
	table_clicked = true
	print("panda2 sai signali katte")

func _on_timer_timeout():
	print("timeout, ma olen kuri nyyd")
	timer.stop()

func _on_table_body_entered(body):
	timer.start(8)
