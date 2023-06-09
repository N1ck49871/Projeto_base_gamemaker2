/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Defina as margens da câmera (espaço em torno do jogador antes de a câmera começar a se mover)
var margem_esquerda = 200;
var margem_direita = 200;
var margem_superior = 150;
var margem_inferior = 150;

// Defina a velocidade de movimento da câmera
var velocidade_camera = 5;

// Obtenha a instância do jogador
var jogador = instance_find(obj_player, 0);

// Defina a posição inicial da câmera para a posição do jogador
camera_set_view_pos(view_current, jogador.x, jogador.y);
