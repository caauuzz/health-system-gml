var _dsW = display_get_gui_width();
var _dsH = display_get_gui_height();

var _width = 400;
var _height = 40;
var _textScale = 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fDefault);

draw_text_transformed(_dsW/2, _dsH/2 - 80, "Health Value: " + string(hp), _textScale, _textScale, 0);
draw_text_transformed(_dsW/2-100, _dsH/2 - 40, "Damage Value: " + string(damage), _textScale, _textScale, 0);
draw_text_transformed(_dsW/2+100, _dsH/2 - 40, "Receive Value: " + string(receive), _textScale, _textScale, 0);

draw_set_halign(fa_left);

draw_text_transformed_color(20, _dsH - 40,	"- Increase Receive and Damage: Up Arrow Key",			_textScale, _textScale, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(20, _dsH - 80,	"- Remove Receive and Damage: Down Arrow Key",			_textScale, _textScale, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(20, _dsH - 120, "- Increase Health: Right Arrow Key",					_textScale, _textScale, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(20, _dsH - 160, "- Remove Health: Left Arrow Key",						_textScale, _textScale, 0, c_white, c_white, c_white, c_white, 1);

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);

healthManager.DrawHealthbarExt(_dsW/2-_width/2, _dsH/2, _width, _height, #04130e, #25be8b, #0b392a, 2, false, true, 0.2);