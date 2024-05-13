extends Node2D

var clicked = []

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Find the topmost sprite on click
	set_process(false)
	
	# Take the first element
	var topmost_clicked = clicked.front()
	
	for i in clicked:
		if i.get_index() > topmost_clicked.get_index():
			topmost_clicked = i
	clicked.clear()
	# Object with the largest index is on the top
	# Its click processing is started
	if topmost_clicked != null:
		print("pealmine: ", topmost_clicked)
		topmost_clicked.on_click()
	

