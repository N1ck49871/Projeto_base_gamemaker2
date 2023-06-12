#region Control

key_right = keyboard_check(ord("D"))//Direita
key_left = keyboard_check(ord("A"))//Esquerda
key_jump = keyboard_check_pressed(vk_space)//Pulo
key_atk = keyboard_check(ord("X"))//Ataque

#endregion

#region Moves

var move = key_right - key_left

hspd = move * spd;
vspd = vspd + grv;

if (hspd !=0){
image_xscale = sign(hspd);
}
//Colisão Horizontal
if place_meeting(x+hspd,y,obj_plat){
while(!place_meeting(x+sign(hspd),y,obj_plat)){
x = x + hspd;
}
hspd = 0;
}
x = x + hspd

//Colisão Vertical
if place_meeting(x,y + vspd,obj_plat){
while(!place_meeting(x,y + sign(vspd),obj_plat)){
y = y + vspd;
}
vspd = 0;
}
y = y + vspd

//Pulo
if place_meeting(x,y+1,obj_plat) and key_jump{
vspd -=6;
}
#endregion

#region Animations

if (!place_meeting(x, y + 1, obj_plat))
{
    sprite_index = spr_player_jump;
    if (sign(vspd) > 0.5)
        sprite_index = spr_player_fall;
    else
        sprite_index = spr_player_jump;
}
else
{
    if (hspd != 0)
    {
        sprite_index = spr_player_move;
    }
    else
    {
        sprite_index = spr_player_idle;
    }
}

if (hspd != 0)
{
    if (place_meeting(x, y + 1, obj_plat))
    {
        sprite_index = spr_player_move;
    }
}

#endregion

#region Vida
if (vida <= 0) {
    game_restart();
}


#endregion

#region Ataque

if key_atk {
   sprite_index = spr_player_attack;
   hspd = 0;
   if obj_player.image_index == sprite_get_number(obj_player.sprite_index) - 1 {
      if place_meeting(x, y, obj_enemy1) {
         obj_enemy1.vida -= atk_dmg;
         show_debug_message("Jogador atacou inimigo");

         if obj_enemy1.vida > 0 {
            if obj_enemy1.image_index != 0 { // Verifica se o obj_enemy1 não está na animação atualmente
               obj_enemy1.sprite_index = spr_enemy1_hit;
               obj_enemy1.image_index = 0; // Reinicia a animação
            }
         } else {
            obj_enemy1.sprite_index = spr_enemy1_dead;
         }
      }
   }
}

#endregion