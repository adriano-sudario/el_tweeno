randomise();
el_tweenos = [];
count = 1;

function create_new() {
	var modes = [
		TWEEN_MODE.PERSIST, TWEEN_MODE.BACK_AND_PERSIST,
		TWEEN_MODE.ONE_SHOT, TWEEN_MODE.BACK_AND_SHOOT,
		TWEEN_MODE.LOOP, TWEEN_MODE.YOYO, TWEEN_MODE.RESTART
	];
	var mode = modes[irandom(array_length(modes) - 1)];
	
	var modifiers = [
		TWEEN_MODIFIER.HORIZONTAL_POSITION,
		TWEEN_MODIFIER.VERTICAL_POSITION,
		TWEEN_MODIFIER.DIAGONAL_POSITION,
		TWEEN_MODIFIER.WIDTH,
		TWEEN_MODIFIER.HEIGHT,
		TWEEN_MODIFIER.SIZE,
		TWEEN_MODIFIER.OPACITY,
		TWEEN_MODIFIER.COLOR,
		TWEEN_MODIFIER.ANGLE,
		TWEEN_MODIFIER.CUSTOM
	];
	
	var modifier = modifiers[irandom(array_length(modifiers) - 1)];
	
	var value = 0;
	
	switch(modifier) {
		case TWEEN_MODIFIER.HORIZONTAL_POSITION:
		case TWEEN_MODIFIER.VERTICAL_POSITION:
		case TWEEN_MODIFIER.DIAGONAL_POSITION:
			value = irandom_range(100, 250);
			break;
			
		case TWEEN_MODIFIER.WIDTH:
		case TWEEN_MODIFIER.HEIGHT:
		case TWEEN_MODIFIER.SIZE:
			value = random_range(.1, .5);
			break;
			
		case TWEEN_MODIFIER.OPACITY:
			value = random(1);
			break;
			
		case TWEEN_MODIFIER.ANGLE:
			value = irandom_range(45, 360);
			break;
			
		case TWEEN_MODIFIER.CUSTOM:
			value = random_range(10, 50);
			break;
			
		case TWEEN_MODIFIER.COLOR:
			value = {
				r: irandom_range(0, 255),
				g: irandom_range(0, 255),
				b: irandom_range(0, 255),
				a: 1,
			};
			break;
	}
	
	var easings = [
		linear,
		in_quad, out_quad, in_out_quad,
		in_cubic, out_cubic, in_out_cubic,
		in_quart, out_quart, in_out_quart,
		in_quint, out_quint, in_out_quint,
		in_sine, out_sine, in_out_sine,
		in_expo, out_expo, in_out_expo,
		in_circ, out_circ, in_out_circ,
		in_elastic, out_elastic, in_out_elastic,
		in_back, out_back, in_out_back,
		in_bounce, out_bounce, in_out_bounce,
	];
	var ease = easings[irandom(array_length(modifiers) - 1)];
	
	var el_tweeno = instance_create_layer(
		irandom_range(100, 1266), irandom_range(100, 678),
		layer, obj_el_tweeno_example);
	
	var colors = [c_aqua, c_fuchsia, c_lime, c_orange, c_purple, c_red, c_blue, c_navy];
	el_tweeno.image_blend = colors[irandom(array_length(colors) - 1)];
	
	if (modifier == TWEEN_MODIFIER.CUSTOM) {
		el_tweeno.is_circle = modifier == TWEEN_MODIFIER.CUSTOM;
		tweening_custom(mode, "radius", value, irandom_range(500, 10000), {
			instance: el_tweeno,
			ease_function: ease
		});
	} else {
		tweening(mode, modifier, value, irandom_range(500, 10000), {
			instance: el_tweeno,
			ease_function: ease
		});
	}
	
	return el_tweeno;
}

function add() {
	for (var i = 0; i < count; i++)
		el_tweenos[array_length(el_tweenos)] = create_new();
}

function remove() {
	if (array_length(el_tweenos) == 0)
		return;
	
	for (var i = 0; i < count; i++) {
		instance_destroy(el_tweenos[array_length(el_tweenos) - i - 1]);
		array_pop(el_tweenos);
	}
}