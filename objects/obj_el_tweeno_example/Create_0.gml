image_blend = c_red;
custom_value = 0;

function alternate_color(_tween) {
	if (_tween.get_loop_cycles_count() % 2 == 0) {
		if (image_blend == c_blue)
			image_blend = c_red;
		else
			image_blend = c_blue;
	} else {
		image_blend = c_lime;
	}
	
	if (_tween.has_completed_loop_cycle())
		toggle_rotate(_tween);
}

function toggle_rotate(_tween) {
	if (_tween.modifier != TWEEN_MODIFIER.ANGLE)
		_tween.reset_target_value(360, TWEEN_MODIFIER.ANGLE);
	else
		_tween.reset_target_value(2, TWEEN_MODIFIER.SIZE);
}

tweening(TWEEN_MODE.YOYO, TWEEN_MODIFIER.SIZE, 2, 1000, 
	{
		ease_function: in_out_back,
		on_finish: alternate_color
	});
tweening_curve_channel_custom(
	TWEEN_MODE.LOOP, "custom_value", 100, 1000,
	animcurve_get_channel(ani_example, "example_curve"));