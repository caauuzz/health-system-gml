holdFrames += 1;
holdFrames = clamp(holdFrames, 0, holdFramesMax);

if (holdFrames >= holdFramesMax)
{
	receive -= 1;
	damage -= 1;
	
	damage = clamp(damage, 0, 100);
	receive = clamp(receive, 0, 100);
}

show_debug_message(holdFrames);