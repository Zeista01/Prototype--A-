right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);

x_spd = (right_key - left_key);
y_spd = (down_key - up_key);

// Normalize the movement vector if moving diagonally
if (x_spd != 0 && y_spd != 0) {
    x_spd *= move_spd / sqrt(2);
    y_spd *= move_spd / sqrt(2);
} else {
    x_spd *= move_spd;
    y_spd *= move_spd;
}

// Collision detection and response
if (place_meeting(x + x_spd, y, obj_wall)) {
    x_spd = 0;
}
if (place_meeting(x, y + y_spd, obj_wall)) {
    y_spd = 0;
}

// Update position
x += x_spd;
y += y_spd;
