extends KinematicBody2D

# --- PUBLIC VARS ---------------------
export (int) var speed = 200
# -------------------------------------

var velocity = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_user_input()
	velocity = move_and_slide(velocity)


func get_user_input():
	velocity = Vector2()
	
	# Movement ------------------------
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	if Input.is_action_pressed("ui_run"):
		velocity = velocity.normalized() * speed * 1.5
	else:
		velocity = velocity.normalized() * speed
	# ---------------------------------
	
	# UI ------------------------------
	if Input.is_action_pressed("ui_interact"):
		handle_interact()
	if Input.is_action_pressed("ui_inventory"):
		handle_inventory()
	if Input.is_action_pressed("ui_pause"):
		handle_pause()
	# ---------------------------------
	

func handle_interact():
	pass

func handle_inventory():
	pass
	
func handle_pause():
	pass
