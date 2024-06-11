extends Node

@onready var kill_thread_button: Button = $KillThreadButton
@onready var pitch_label: Label = $PitchLabel

var thread: Thread
var pipe: Dictionary
var stdio: FileAccess
var stderr: FileAccess
var pid: int
var pitch: String


func _ready() -> void:
	thread = Thread.new()
	thread.start(_start_pitch_detection)
	
	get_window().close_requested.connect(clean_func)
	kill_thread_button.pressed.connect(clean_func)


func _start_pitch_detection() -> void:
	pipe = OS.execute_with_pipe("python3", ["demo_pyaudio.py"])
	stdio = pipe["stdio"]
	stderr = pipe["stderr"]
	pid = pipe["pid"]
	
	while stdio.is_open() and stdio.get_error() == OK:
		print(stdio.get_line())
		pitch = stdio.get_line()
		
	# print error messages
	if stdio.get_error() != OK:
		while stderr.is_open() and stderr.get_error() == OK:
			print(stderr.get_line())


func _process(_delta: float) -> void:
	pitch_label.text = "Pitch detected: " + pitch


func clean_func() -> void:
	stdio.close()
	stderr.close()
	if thread.is_alive():
		thread.wait_to_finish()
	OS.kill(pid)
