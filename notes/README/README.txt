~ Healthbar System V1.0 ~

Olá, obrigado por adquirir o meu sistema de vida :)

Passo a passo de como utilizar o HBS (Healthbar System).

- Introdução: 
	+ Assim que importar o Local Package do HBS, você verá no seu Asset Browser, uma pasta escrito "HBS System". 
	Nela, ficam todos os arquivos utilizados no sistema.

- Passo 1: Localizar o objeto chamado "oHealth". 
	+ Ele assume o papel do seu player, ou seja, dentro desse objeto contém variáveis que precisam estar no objeto
	na qual você quer que o sistema funcione, por exemplo: "oPlayer ou obj_player".

- Passo 2: Após localizar o objeto "oHealth".
	+ Basta você ir até o evento "Create" do objeto e copiar as variáveis de "hp e hpMax".

- Passo 3: Colar as variáveis.
	 + No seu player ou qualquer objeto do seu jogo, no evento "Create", cole as variáveis anteriomento copiadas.

- Passo 4: Criar o Health Manager
	Agora, basta você criar o seu gerenciador de vida, pode colocar qualquer nome, você só precisa se lembrar.
	
- Final: Finalização
	Após copiado as variáveis do objeto "oHealth", adicionados no seu player e criado a variavél de gerenciador de vida,
	está pronto, é só utilizar o sistema da forma que você quiser!
	
Dicas:
	- Sempre que criar o gerenciador de vida, coloque um nome fácil de lembrar, como por exemplo: healthManager.
	- A variável de gerenciamento de vida, precisa ser nesse formato: nome_do_gerenciador_de_vida = new HealthController(hpMax)
	meu exemplo: healthManager = new HealthController(hpMax).
	
Considerações finais:
	A partir do momento em que você adquiriu o HSB(Healthbar System), ele é seu para toda a eternidade :)
	sempre que sair atualizações novas, você receberá na mesma hora e de forma gratuita.
	
	no mais, obrigado por tudo!
	
	divirta-se.