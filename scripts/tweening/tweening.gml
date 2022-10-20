/// @function tweening(mode, modifier, target_value, duration, optional_params);
/// @param {mode} tweening mode
/// @param {modifier} tweening modifier
/// @param {target_value} tweening target
/// @param {duration} tweening duration
/// @param {optional_params} optional parameters

function tweening(_mode, _modifier, _target_value, _duration, _optional_params = undefined) {
	with(instance_create_layer(0, 0, layer, obj_tweening)) {
		instance = other;
		mode = _mode;
		modifier = _modifier;
		duration = _duration;
		target_value = _target_value;
	
		var start_on_create = true;
	
		if (_optional_params != undefined) {
			if (variable_struct_exists(_optional_params, "instance")
				&& _optional_params.instance != noone
				&& _optional_params.instance != undefined)
				instance = _optional_params.instance;
		
			if (variable_struct_exists(_optional_params, "ease_function")
				&& _optional_params.ease_function != noone
				&& _optional_params.ease_function != undefined)
				ease_function = _optional_params.ease_function;
		
			if (variable_struct_exists(_optional_params, "step_to_update")
				&& _optional_params.step_to_update != noone
				&& _optional_params.step_to_update != undefined)
				step_to_update = _optional_params.step_to_update;
		
			if (variable_struct_exists(_optional_params, "on_finish")
				&& _optional_params.on_finish != noone
				&& _optional_params.on_finish != undefined)
				on_finish = _optional_params.on_finish;
		
			if (variable_struct_exists(_optional_params, "start_on_create")
				&& is_bool(_optional_params.start_on_create))
				start_on_create = _optional_params.start_on_create;
			
			if (variable_struct_exists(_optional_params, "time_source")
				&& _optional_params.time_source != noone
				&& _optional_params.time_source != undefined)
				time_source = _optional_params.time_source;
		}
	
		if (modifier != TWEEN_MODIFIER.CUSTOM)
			set_initial_value();
	
		if (start_on_create)
			start();
	
		return self;
	}
}