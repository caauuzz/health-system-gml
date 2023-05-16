if (keyboard_check_pressed(vk_left))
{
	hp = healthManager.RemoveHealth(damage);
}

if (keyboard_check_pressed(vk_right))
{
	hp = healthManager.ReceiveHealth(receive);
}

if (keyboard_check_pressed(vk_up))
{
	receive += 1;
	damage += 1;
}

if (keyboard_check_pressed(vk_down))
{
	damage -= 1;
	receive -= 1;
}