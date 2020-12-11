extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome! (Press E to continue with the game)"
	,"Speed and accuracy are your livesavers."
	,"Shoot the targets and the drone before the time runs out!"
	,"The game will begin when you press E."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")



func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
