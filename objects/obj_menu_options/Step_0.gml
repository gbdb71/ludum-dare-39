/// @description Step

if (!is_active) exit;


/*
 * User input
 */
 
var key_up      = -(keyboard_check_released(vk_up) || keyboard_check_released(ord("W")));
var key_down    = keyboard_check_released(vk_down) || keyboard_check_released(ord("S"));

//Action key: enter or pace
var key_action  = keyboard_check_released(vk_enter) || keyboard_check_released(vk_space);



/*
 * Scrolling event
 */
 
//Check which direction is pressed
var vdir = key_down + key_up;

//Move up the list
if (vdir == -1) 
{
    if (active == 0) active = item_count - 1;
    else active--;
}
//Move down the list
else if (vdir == 1)
{
    if (active == item_count - 1) active = 0;
    else active++;
}

//Play scroll sound
if (vdir != 0)
{
    audio_play_sound(snd_menu_scroll, 5, false);
}

image_index = active;



/*
 * Action event
 */
 
if (key_action) 
{
    switch (active)
    {
        //Play
        case 0:
            alarm[0] = scr_seconds(0.5);
            break;
            
        //Tutorials
        case 1:
            alarm[1] = scr_seconds(0.5);
            break;
            
        //Exit
        default:
            alarm[2] = scr_seconds(0.5);
    }
    
    is_active = false;
    audio_play_sound(snd_button, 5, false);
}

/* */
/*  */