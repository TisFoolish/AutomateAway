extends Camera2D


@export var MIN_ZOOM: float = 0.1
@export var MAX_ZOOM: float = 2
@export var ZOOM_INCREMENT: float = 0.1

@export var TOP_LIMIT_PX = -10000000
@export var BOTTOM_LIMIT_PX = 10000000
@export var LEFT_LIMIT_PX = -10000000
@export var RIGHT_LIMIT_PX = 10000000

var _target_zoom: float = 1.0

const ZOOM_RATE = 8.0


func zoom_in() -> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)

func zoom_out() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)

 
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative * (Vector2.ONE/zoom)
		
	if event is InputEventMouseButton:
			if event.is_pressed():
				if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
					zoom_out()
				if event.button_index == MOUSE_BUTTON_WHEEL_UP:
					zoom_in()


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_bottom = BOTTOM_LIMIT_PX
	limit_top = TOP_LIMIT_PX
	limit_left = LEFT_LIMIT_PX
	limit_right = RIGHT_LIMIT_PX


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	zoom = lerp(zoom, _target_zoom * Vector2.ONE, ZOOM_RATE * delta)
	print("Zoom: ", zoom)
	set_physics_process(not is_equal_approx(zoom.x, _target_zoom))
