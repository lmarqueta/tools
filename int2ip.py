import ipaddress
import sys

if len(sys.argv) != 2:
    sys.stderr.write("Uso: int2ip.py <integer>\n")
else:
    print(str(ipaddress.IPv4Address(int(sys.argv[1]))))
