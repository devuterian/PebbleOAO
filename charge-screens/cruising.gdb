set pagination off
target remote 127.0.0.1:12646
break prv_charge_draw
continue
set s_charge_percent = "79.253%"
set s_charge_detail = "완충 후 항해 중"
disable breakpoints
detach
