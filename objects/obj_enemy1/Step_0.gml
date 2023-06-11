alcance_ataque = 10; // Define o alcance de ataque do inimigo (ajuste conforme necessário)
intervalo_ataque = 60; // Define o intervalo entre os ataques em número de frames (ajuste conforme necessário)
tempo_ataque = 0; // Inicializa o temporizador de ataque

// Código Step do obj_inimigo
if (!no_chao) {
   velocidade_vertical += gravidade; // Aplica a gravidade
} else {
   velocidade_vertical = 0; // Reinicia a velocidade vertical
}

// Move o objeto na vertical
y += velocidade_vertical;

// Move o objeto na horizontal com velocidade aleatória
x += velocidade_horizontal;

// Verifica a colisão com obj_plat
if (place_meeting(x, y + 1, obj_plat)) {
   while (!place_meeting(x, y + sign(velocidade_vertical), obj_plat)) {
      y += sign(velocidade_vertical);
   }
   velocidade_vertical = 0; // Reinicia a velocidade vertical quando colide com o objeto
   no_chao = true;
} else {
   no_chao = false;
}

// Verifica se chegou na beirada do obj_plat e muda de direção
var obj_plat_width = obj_plat.sprite_width; // Obtém a largura do objeto obj_plat

if (x <= obj_plat.x || x >= obj_plat.x + obj_plat_width) {
   velocidade_horizontal *= -1; // Inverte a velocidade horizontal para mudar de direção
   image_xscale = sign(velocidade_horizontal); // Altera a escala horizontal do sprite para acompanhar a direção
}

// Verifica a distância para o obj_player
var distancia_para_player = distance_to_object(obj_player);

// Verifica se pode atacar
if (distancia_para_player <= alcance_ataque && tempo_ataque <= 0) {
   // Faça o inimigo atacar o obj_player
   // Coloque o código de ataque aqui
   tempo_ataque = intervalo_ataque; // Reinicia o temporizador de ataque
} else {
   // Move em direção ao objeto jogador
   var direcao = sign(obj_player.x - x);
   velocidade_horizontal = abs(velocidade_horizontal) * direcao;
   image_xscale = direcao; // Altera a escala horizontal do sprite com base na direção
}

// Atualiza o temporizador de ataque
if (tempo_ataque > 0) {
   tempo_ataque -= 1; // Reduz o tempo restante para o próximo ataque
}
