set pagination off
target remote 127.0.0.1:12646
break prv_charge_draw
continue
set s_charge_percent = "80.000%"
set s_charge_detail = "충전 완료!"
disable breakpoints
detach
