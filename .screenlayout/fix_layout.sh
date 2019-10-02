#!/bin/sh
alias screen_to_l="i3 move workspace to output left"
alias screen_to_r="i3 move workspace to output right"
alias screen_to_m="i3 move workspace to output primary"
alias screen_to_l_of_m="screen_to_m; screen_to_l"
alias screen_to_r_of_m="screen_to_m; screen_to_r"
select_screen() {
    i3 workspace $1
}

select_screen 1; screen_to_m;
select_screen 2; screen_to_l_of_m;
select_screen 3; screen_to_r_of_m;
select_screen 4; screen_to_m;
select_screen 5; screen_to_m;
select_screen 6; screen_to_m;
select_screen 7; screen_to_m;
select_screen 8; screen_to_m;
select_screen 9; screen_to_m;
select_screen 10; screen_to_m;
select_screen 1

select_screen 1; screen_to_m;
select_screen 2; screen_to_l_of_m;
select_screen 3; screen_to_r_of_m;
select_screen 4; screen_to_m;
select_screen 5; screen_to_m;
select_screen 6; screen_to_m;
select_screen 7; screen_to_m;
select_screen 8; screen_to_m;
select_screen 9; screen_to_m;
select_screen 10; screen_to_m;
select_screen 1

