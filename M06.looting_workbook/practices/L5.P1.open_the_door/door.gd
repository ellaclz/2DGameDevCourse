extends Area2D

@onready var animation_player: AnimationPlayer = $"AnimationPlayer"

func open() -> void:
	animation_player.play("open")
	input_pickable = false

	
func ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

	
func _on_mouse_entered() -> void:
	var tween := create_tween()
	tween.tween_method(set_outline_thickness, 3.0, 6.0, 0.08)

func _on_mouse_exited() -> void:
	pass
	
func set_outline_thickness(new_thickness: float) -> void:
	pass

func _input_event(viewport: Node, event: InputEvent, shape_index: int):
	var event_is_mouse_click: bool = (
		event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_LEFT and 
		event.is_pressed
	)

	if event_is_mouse_click:
		open()
