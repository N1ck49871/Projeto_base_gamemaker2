#region Control

key_right = keyboard_check(ord("D"))//Direita
key_left = keyboard_check(ord("A"))//Esquerda
key_jump = keyboard_check_pressed(vk_space)//Pulo

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