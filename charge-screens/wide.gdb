set pagination off
target remote 127.0.0.1:12646
break prv_charge_draw
continue
set s_charge_percent = "100.000%"
set s_charge_detail = "0.52W / 23시간 59분 남음"
disable breakpoints
detach
