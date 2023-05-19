// Essa é a função que faz a mágica acontencer!
function HealthController(_hpMax) constructor
{
	// Valor da vida maxima
	hpMax = _hpMax;
	
	// Valor da vida atual
	hp = hpMax;
	
	// Valor da vida temporária
	hpTemp = hp;
	
	// Valor da vida de fundo (DrainEffect)
	hpBackground = hp;
	
	/// @function RemoveHealth(amount);
	static RemoveHealth = function(_amount)
	{
		hp -= _amount;
		hp = clamp(hp, 0, hpMax);
		return hp;
	}
	
	/// @function ReceiveHealth(amount);
	static ReceiveHealth = function(_amount)
	{
		hp += _amount;
		hp = clamp(hp, 0, hpMax);
		return hp;
	}
	
	/// @function DrawHealthbar(x, y, width, height, [backgroundColor], [healthColor]);
	static DrawHealthbar = function(_x, _y, _width, _height, _backgroundColor = c_white, _healthColor = c_green)
	{
		// Pegar a largura da minha barra de vida com base na minha vida atual
		var _healthWidth = (hpTemp / hpMax) * _width;
		
		// Aplicando suavização da vida
		hpTemp = lerp(hpTemp, hp, 0.1);
		
		// Desenhando a parte de trás da barra de vida
		draw_rectangle_color(_x-2, _y-2, _x + _width + 2, _y + _height + 2, _backgroundColor, _backgroundColor, _backgroundColor, _backgroundColor, false);
		
		// Drawing healthbar
		draw_rectangle_color(_x, _y, _x + _healthWidth, _y + _height, _healthColor, _healthColor, _healthColor, _healthColor, false);
	}
	
	/// @function DrawHealthbarExt(x, y, width, height, [borderColor], [backgroundColor], [primaryColor], [secondaryColor], [borderPadding], [useMergeColors], [useDrainEffect], [drainSpeed])
	static DrawHealthbarExt = function(_x, _y, _width, _height, _borderColor = c_white, _backgroundColor = c_white, _primaryColor = c_green, _secondaryColor = c_red, _borderPadding = 2, _canMergeColors = true, _useDrainEffect = false, _drainSpeed = 0.1)
	{
		// Pegar a largura da minha barra de vida com base na minha vida atual
		var _healthWidth = (hpTemp / hpMax) * _width;
		
		// Efeito de "Drain", drenagem da vida
		var _backgroundHealthWidth;
		if (_useDrainEffect) _backgroundHealthWidth = (hpBackground / hpMax) * _width;
		else _backgroundHealthWidth = _healthWidth;
		
		// Mesclando as cores da barra de vida
		var _color;
		if (_canMergeColors) _color = merge_color(_secondaryColor, _primaryColor, (hpTemp/hpMax));
		else _color = _primaryColor;
		
		// Aplicando suavização na vida
		hpTemp = lerp(hpTemp, hp, _drainSpeed);
		hpBackground = lerp(hpBackground, hpTemp, _drainSpeed * 0.75);
		
		draw_rectangle_color(_x-_borderPadding, _y-_borderPadding, _x + _width + _borderPadding, _y + _height + _borderPadding, _borderColor, _borderColor, _borderColor, _borderColor, false);
		
		// Desenhando a parte de trás da barra de vida (background)
		//draw_rectangle_color(_x-_borderPadding, _y-_borderPadding, _x + _width + _borderPadding, _y + _height + _borderPadding, _backgroundColor, _backgroundColor, _backgroundColor, _backgroundColor, false);
		draw_rectangle_color(_x, _y, _x + _width, _y + _height, _backgroundColor, _backgroundColor, _backgroundColor, _backgroundColor, false);
		
		// Se eu usar o efeito de "Drain", desenhar a vida de trás
		if (_useDrainEffect)
		{
			// Desenhando o efeito de "Drain", drenagem da vida
			draw_rectangle_color(_x, _y, _x + _backgroundHealthWidth, _y + _height, _secondaryColor, _secondaryColor, _secondaryColor, _secondaryColor, false);
		}
		
		// Desenhando a barra de vida (parte da frente)
		draw_rectangle_color(_x, _y, _x + _healthWidth, _y + _height, _color, _color, _color, _color, false);
	}
	
	/// @function DrawHealthbarRounded(borderTypes, spriteHealth, x, y, width, height, [borderColor], [healthColor]);
	static DrawHealthbarRounded = function(_borderType, _spriteHealth, _x, _y, _width, _height, _borderColor = c_white, _healthColor = c_green)
	{
		// Pegar a largura da minha barra de vida com base na minha vida atual
		var _healthWidth = (hpTemp / hpMax) * _width;
		
		// Aplicando suavização na vida
		hpTemp = lerp(hpTemp, hp, 0.2);
		
		// Desenhando a barra de vida
		draw_sprite_ext(_spriteHealth, 0, _x, _y, _healthWidth, _height, 0, _healthColor, 1);
		
		// Desenhando a borda
		draw_sprite_ext(_borderType, 0, _x, _y, _width, _height, 0, _borderColor, 1);
	}
	
	/// @function DrawHealthbarRoundedExt(spriteHealth, x, y, width, height, [borderTypes], [backgroundColor], [borderColor], [primaryColor], [secondaryColor], [useDrainEffect], [drainSpeed], [canMergeColors], [textFont], [textString], [textScale]);
	static DrawHealthbarRoundedExt = function(
		_spriteHealth, 
		_x, 
		_y, 
		_width, 
		_height, 
		_borderType = HP_BORDER_TYPE_THIN, 
		_backgroundColor = c_black, 
		_borderColor = c_white, 
		_primaryColor = c_green, 
		_secondaryColor = c_red, 
		_useDrainEffect = true, 
		_drainSpeed = 0.1,
		_canMergeColors = false,
		_textFont = -1,
		_textString = "",
		_textScale = 2)
	{
		var _customWidth = _width * 0.1;
		var _customHeight = _height * 0.1;
		
		// Pegar a largura da minha barra de vida com base na minha vida atual
		var _healthWidth = (hpTemp / hpMax) * _customWidth;
		
		// Mesclando as cores da barra de vida
		var _color;
		if (_canMergeColors) _color = merge_color(_secondaryColor, _primaryColor, (hpTemp/hpMax));
		else _color = _primaryColor;
		
		var _backgroundHealthWidth;
		if (_useDrainEffect) _backgroundHealthWidth = (hpBackground / hpMax) * _customWidth
		else _backgroundHealthWidth = _healthWidth;
		
		// Aplicando suavização na vida
		hpTemp = lerp(hpTemp, hp, _drainSpeed);
		hpBackground = lerp(hpBackground, hpTemp, _drainSpeed * 0.75);
		
		// Desenhando o background
		draw_sprite_ext(_spriteHealth, 0, _x, _y, _customWidth, _customHeight, 0, _backgroundColor, 1);
		
		// Desenhando a barra de vida de background (Drain Effect)
		if (_useDrainEffect)
		{
			// Desenhando o efeito de "Drain", drenagem da vida
			draw_sprite_ext(_spriteHealth, 0, _x, _y, _backgroundHealthWidth, _customHeight, 0, _secondaryColor, 1);
		}
		
		// Desenhando a barra de vida
		draw_sprite_ext(_spriteHealth, 0, _x, _y, _healthWidth, _customHeight, 0, _color, 1);
		
		// Desenhando a borda
		draw_sprite_ext(_borderType, 0, _x, _y, _customWidth, _customHeight, 0, _borderColor, 1);
		
		draw_set_font(_textFont);
		draw_text_transformed(_x+2, _y-14*_textScale, _textString, _textScale, _textScale, 0);
		draw_set_font(-1);
	}
}