function TweenOptionalParams(
	_instance = noone,
	_ease_function = linear,
	_on_finish = undefined,
	_step_to_update = TWEEN_UPDATE_EVENT.STEP,
	_time_source = TWEEN_TIME_SOURCE.MILLISECONDS,
	_start_on_create = true
) constructor {
	if (_instance != noone && _instance != undefined)
		instance = _instance;
	else
		instance = other;
	
	ease_function = _ease_function;
	on_finish = _on_finish;
	step_to_update = _step_to_update;
	time_source = _time_source;
	start_on_create = _start_on_create;
}