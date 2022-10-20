/// @function tweening_custom(mode, modifier_name, target_value, duration, optional_params);
/// @param {mode} tweening mode
/// @param {modifier_name} tweening modifier name
/// @param {target_value} tweening target
/// @param {duration} tweening duration
/// @param {optional_params} optional parameters

function tweening_custom(_mode, _modifier_name, _target_value, _duration, _optional_params = undefined) {
	var start_on_create = true;
	
	if (_optional_params != noone
		&& _optional_params != undefined
		&& variable_struct_exists(_optional_params, "start_on_create"))
		start_on_create = _optional_params.start_on_create;
	
	if (_optional_params == noone || _optional_params == undefined)
		_optional_params =  { start_on_create: false };
	else if (!variable_struct_exists(_optional_params, "start_on_create"))
		variable_struct_set(_optional_params, "start_on_create", false);
	else
		_optional_params.start_on_create = false;
	
	with(tweening(_mode, TWEEN_MODIFIER.CUSTOM, _target_value, _duration, _optional_params)) {
		modifier_name = _modifier_name;
		set_initial_value();
	
		if (start_on_create)
			start();
		else
			pause();
	
		return self;
	}
}