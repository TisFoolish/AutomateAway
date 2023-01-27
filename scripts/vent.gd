extends Area2D

@export var max_power : float = 180
@export var current_power : float = 180
@export var grav : float = 980

# Called when the node enters the scene tree for the first time.
func _ready():
	$Polygon2D/Slider.max_value = max_power
	$Polygon2D/Slider.value = current_power
	_on_slider_value_changed(current_power)
	
	set_gravity_direction(Vector2(cos(rotation), sin(rotation)))
	print(name, " ", Vector2(cos(rotation), sin(rotation)))
	print(gravity_direction)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


func _on_slider_value_changed(value):
	$CollisionShape2D.shape.set_size(Vector2(80, value))

	$CollisionShape2D.position = Vector2(value/2+20, 0)

	gravity = grav*(value/max_power)
