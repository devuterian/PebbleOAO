from pathlib import Path
import subprocess,socket,time
from PIL import Image
r=Path(__file__).parent
cases=[('wide','100.000%','0.52W / 23시간 59분 남음'),('complete','80.000%','충전 완료!'),('cruising','79.253%','완충 후 항해 중')]
for name,pct,detail in cases:
 script=r/(name+'.gdb');script.write_text('set pagination off\ntarget remote 127.0.0.1:12646\nbreak prv_charge_draw\ncontinue\nset s_charge_percent = "'+pct+'"\nset s_charge_detail = "'+detail+'"\ndisable breakpoints\ndetach\n')
 res=subprocess.run(['/Users/marie/Documents/Codex/pebble/watchos-audio-work/sdk/arm-none-eabi/bin/arm-none-eabi-gdb','-q','-batch','/Volumes/marie-4TB2/codex-pebble-health-preview/build-health-preview/pebbleos.elf','-x',str(script)],capture_output=True,text=True,timeout=15);(r/(name+'.log')).write_text(res.stdout+res.stderr);res.check_returncode()
 s=socket.socket(socket.AF_UNIX);s.connect('/tmp/pebble-charge.sock');s.recv(4096);time.sleep(.2);s.sendall(('screendump '+str(r/(name+'.ppm'))+'\n').encode());time.sleep(.2);s.close();Image.open(r/(name+'.ppm')).save(r/(name+'.png'))
 print(name,flush=True)
