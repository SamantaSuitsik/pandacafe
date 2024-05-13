extends Area2D

# signal laheb koigilie praegu !!!
signal table_clicked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		get_parent().clicked.append(self)
		get_parent().set_process(true)

func on_click():
	table_clicked.emit()

#func _on_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		#print("puudutati lauda")
		#table_clicked.emit()
