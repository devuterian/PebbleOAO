import socket,time,sys
from pathlib import Path
from PIL import Image
r=Path(__file__).parent
s=socket.socket(socket.AF_UNIX);s.connect('/tmp/pebble-charge.sock');s.recv(4096)
for key in sys.argv[2:]:
 s.sendall(('sendkey '+key+' 200\n').encode());time.sleep(.8)
s.sendall(('screendump '+str(r/(sys.argv[1]+'.ppm'))+'\n').encode());time.sleep(.3)
Image.open(r/(sys.argv[1]+'.ppm')).save(r/(sys.argv[1]+'.png'))
