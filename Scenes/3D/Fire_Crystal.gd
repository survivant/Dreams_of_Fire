extends Spatial

func _ready():
	get_node("Area").connect("body_entered", self, "body_entered");
	set_physics_process(false);

func _physics_process(delta):
	get_node("Area").monitoring = false;
	queue_free();

func body_entered(body):
	if "IS_PLAYER" in body:
		
		# Get the third child, because the loaded scene is placed after auto load scripts!
		var level_controller = get_tree().root.get_child(2);
		
		level_controller.crystal_gotten("3D");
		
		set_physics_process(true);
