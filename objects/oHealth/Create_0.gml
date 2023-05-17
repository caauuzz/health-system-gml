hpMax = 10;
hp = hpMax;

hpdemoMax = 10;
hpdemo = hpdemoMax;

shieldMax = 10;
shield = shieldMax;

damage = 2;
receive = 2;

holdFramesMax = 30;
holdFrames = 0;

healthManager = new HealthController(hpMax);
shieldManager = new HealthController(shieldMax);
demoManager = new HealthController(hpdemoMax);