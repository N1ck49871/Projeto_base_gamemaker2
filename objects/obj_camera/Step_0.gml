/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Obtenha a instância do jogador
var jogador = instance_find(obj_player, 0);

// Calcule a posição da câmera em relação ao jogador
var camera_x = camera_get_view_x(view_current);
var camera_y = camera_get_view_y(view_current);

// Calcule os limites da câmera
var limite_esquerda = jogador.x - margem_esquerda;
var limite_direita = jogador.x + margem_direita;
var limite_superior = jogador.y - margem_superior;
var limite_inferior = jogador.y + margem_inferior;

// Verifique se a posição da câmera está dentro dos limites
if (camera_x < limite_esquerda)
    camera_x += velocidade_camera;
else if (camera_x > limite_direita)
    camera_x -= velocidade_camera;

if (camera_y < limite_superior)
    camera_y += velocidade_camera;
else if (camera_y > limite_inferior)
    camera_y -= velocidade_camera;

// Defina a nova posição da câmera
camera_set_view_pos(view_current, camera_x, camera_y);
