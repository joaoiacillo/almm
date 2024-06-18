if (image_xscale <= 1) image_xscale += 0.2;

if (dissapear)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0)
	{
		instance_destroy();
		return;
	}
}