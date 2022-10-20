/// @function tweening_curve_channel(mode, modifier, target_value, duration, curve_channel, optional_params);
/// @param {mode} tweening mode
/// @param {modifier} tweening modifier
/// @param {target_value} tweening target
/// @param {duration} tweening duration
/// @param {curve_channel} tweening duration
/// @param {optional_params} optional parameters

function tweening_curve_channel(_mode, _modifier, _target_value, _duration, _curve_channel,
	_optional_params = undefined) {
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
	
	with(tweening(_mode, _modifier, _target_value, _duration, _optional_params)) {
		curve_channel = _curve_channel;
	
		if (start_on_create)
			start();
		else
			pause();
	
		return self;
	}
}