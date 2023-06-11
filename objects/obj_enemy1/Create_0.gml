// Código Create do obj_inimigo
gravidade = 0.5; // Define a força da gravidade
velocidade_vertical = 0; // Inicializa a velocidade vertical
no_chao = false; // Define se o inimigo está no chão

velocidade_horizontal = 1; // Ajuste os valores mínimos e máximos conforme necessário

sprite_index = spr_enemy1; // Define o sprite inicial do inimigo como sprite de espera

alcance_ataque = 10; // Define o alcance de ataque do inimigo (ajuste conforme necessário)
intervalo_ataque = 60; // Define o intervalo entre os ataques em número de frames (ajuste conforme necessário)
tempo_ataque = 0; // Inicializa o temporizador de ataque
