extends RigidBody2D

var bounceSound
# Called when the node enters the scene tree for the first time.
func _ready():
	bounceSound = $AudioStreamPlayer2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Cum")
	bounceSound.play()
