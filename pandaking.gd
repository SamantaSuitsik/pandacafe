extends CharacterBody2D


const SPEED = 400.0
const OFFSET_Y = -120.0 

var is_selected : bool = false
var target_position : Vector2


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	input_pickable = true
	target_position = position
	
func _physics_process(delta):
	velocity = position.direction_to(target_position) * SPEED
	if position.distance_to(target_position) > 10:
		move_and_slide()
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
# Click on the screen
func _input(event):
	if event.is_action_pressed("click") and is_selected:
		print("prrrp moving")
		is_selected = false
		# Offset makes the legs go on click not the body
		target_position = get_global_mouse_position() + Vector2(0,OFFSET_Y)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		get_parent().clicked.append(self)
		get_parent().set_process(true)

func on_click():
	is_selected = true

# Click on the sprite
#func _on_input_event(viewport, event, shape_idx):
	#print("olen inputi handlimises")
	#if event is InputEventMouseButton and event.pressed:
		#print("selected!")
		## Wait so it wont move right away
		#await get_tree().create_timer(0.1).timeout
		#is_selected = true
