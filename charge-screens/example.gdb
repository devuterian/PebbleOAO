set pagination off
target remote 127.0.0.1:12646
break prv_charge_draw
continue
set s_charge_percent = "53.253%"
set s_charge_detail = "0.52W / 1시간 3분 남음"
disable breakpoints
detach
