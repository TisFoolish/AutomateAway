extends Node2D

@export var drawerState : bool = false
@export var junk : Array[PackedScene]
var spawnedJunk : Array[RigidBody2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	if drawerState == true:
		$Contents.translate(Vector2(0, 1022))
	else:
		$Contents.translate(Vector2(0, 0))
	var rand = RandomNumberGenerator.new()
	for item in junk:
		var temp = item.instantiate()
		temp.process_mode = Node.PROCESS_MODE_DISABLED
		spawnedJunk.append($Contents/SpawnPoint/RigidBody2D.duplicate())
		$Contents/SpawnPoint.set_position(Vector2(rand.randf_range(-455, 430.0), rand.randf_range(-930.0, -450.0)))
		$Contents/SpawnPoint.add_child(spawnedJunk.back())
		spawnedJunk.back().add_child(temp)
		spawnedJunk.back().process_mode = Node.PROCESS_MODE_INHERIT
		spawnedJunk.back().reparent(self)
		spawnedJunk.back().set_scale(Vector2(1,1))
	print_orphan_nodes()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	if drawerState == true:
		$AnimationPlayer.play("Close")
		drawerState = false
	else:
		$AnimationPlayer.play("Open")
		drawerState = true
