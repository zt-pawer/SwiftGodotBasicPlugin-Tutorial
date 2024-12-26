extends Control

var _basic_plugin: Variant


@onready var label: Label = $VBoxContainer/Label


func _ready() -> void:
	if _basic_plugin == null && ClassDB.class_exists("BasicPlugin"):
		_basic_plugin = ClassDB.instantiate("BasicPlugin")
		_basic_plugin.signal_simple.connect(_on_completed_simple)
		_basic_plugin.signal_argument.connect(_on_completed_argument)
		label.text = "Plugin loaded"
	else:
		label.text = "No plugin"


func _on_completed_simple() -> void:
	label.text = "Hello World Signal"


func _on_completed_argument(message:String) -> void:
	label.text = message


func _on_button_1_pressed() -> void:
	if !_basic_plugin:
		label.text = "Plugin missing"
		return
	label.text = _basic_plugin.callmeString()


func _on_button_2_pressed() -> void:
	if !_basic_plugin:
		label.text = "Plugin missing"
		return
	label.text = _basic_plugin.callmeStringParam("ZT Pawer")


func _on_button_3_pressed() -> void:
	if !_basic_plugin:
		label.text = "Plugin missing"
		return
	_basic_plugin.callmeSignalSimple()


func _on_button_4_pressed() -> void:
	if !_basic_plugin:
		label.text = "Plugin missing"
		return
	_basic_plugin.callmeSignalArgument()


func _on_button_5_pressed() -> void:
	if !_basic_plugin:
		label.text = "Plugin missing"
		return
	_basic_plugin.callmeSignalParamArgument("ZT Pawer")
