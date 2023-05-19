#region DEBUG!
// **** SOMENTE PARA DEBUG! **** //
useDebug = true;
damage = 2; 
receive = 2;
holdFramesMax = 30;
holdFrames = 0;
#endregion

// Vida máxima do seu personagem.
hpMax = 10;
// Vida atual do seu personagem.
hp = hpMax;
// Chamando o construtor {Quem vai fazer toda a mágica :)}
healthManager = new HealthController(hpMax);

