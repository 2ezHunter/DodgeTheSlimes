extends Area2D


export var speed = 500
var screen_size

	
func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)
	

func _process(delta):
	
	
	
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		get_node("AnimatedSprite").play() # get_node is also equal to $
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x,0,screen_size.y)
	position.y = clamp(position.y,0,screen_size.y)
