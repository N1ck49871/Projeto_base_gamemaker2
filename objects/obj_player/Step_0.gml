var gravidade = 0.5; // Valor da gravidade
var velocidade_y = 0; // Velocidade vertical
var velocidade_maxima = 5; // Velocidade horizontal máxima

// Variáveis de controle
var pulando = false; // Indica se o personagem está pulando
var altura_pulo = -10; // Altura do salto

// Gravidade
velocidade_y += gravidade; // Adiciona a gravidade à velocidade vertical

// Movimentação horizontal
var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var velocidade_x = move_x * velocidade_maxima; // Define a velocidade horizontal máxima

// Verifica colisões com a plataforma
if (place_meeting(x, y + velocidade_y, obj_plat)) {
    while (!place_meeting(x, y + sign(velocidade_y), obj_plat)) {
        y += sign(velocidade_y); // Move gradualmente até a colisão
    }
    velocidade_y = 0; // Define a velocidade vertical como zero após a colisão
    pulando = false; // Define pulando como falso após a colisão
}

// Pulo
if (keyboard_check_pressed(vk_space) && !pulando) {
    velocidade_y = altura_pulo; // Inicia o pulo
    pulando = true; // Define pulando como verdadeiro
}

// Aplica as velocidades no objeto
x += velocidade_x;
y += velocidade_y;
