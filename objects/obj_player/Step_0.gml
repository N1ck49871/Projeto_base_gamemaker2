#region Control

key_right = keyboard_check(ord("D"))//Direita
key_left = keyboard_check(ord("A"))//Esquerda
key_jump = keyboard_check(vk_space)//Pulo

#endregion

#region Moves

var move = key_right - key_left

hspd = move * spd;
vspd = vspd + grv;

if (hspd !=0){
image_xscale = sign(hspd);
}

#endregion