extends Area2D

const OFFSET_Y = -140.0 

var is_selected : bool = false
var target_position : Vector2
var table_clicked : bool = false;
@export var speed : int = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	print("IN READY!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("click") && is_selected:
		print("a lil click")
		
		# Move when clicked on another object
		# Get a signal from them
		# Get object position and move it there
		if table_clicked:
			print("panda teab et lauda puudutati")
			target_position = Vector2(800,400)
			table_clicked = false
			$AnimatedSprite2D.animation = "surprised"
		else:
			target_position = get_global_mouse_position() + Vector2(0,OFFSET_Y)
			$AnimatedSprite2D.animation = "default"	
		
		position = position.lerp(target_position, 1)
		is_selected = false
		
	
# When clicked on the panda
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("selected!")
		# Wait so it wont move right away
		await get_tree().create_timer(0.1).timeout
		is_selected = true

func _on_table_table_clicked():
	table_clicked = true
