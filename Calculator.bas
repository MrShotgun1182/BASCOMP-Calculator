$regfile="m16def.dat"
$crystal=1000000
config Lcdpin=Pin, Db4=PortA.4, Db5=porta.5, Db6=porta.6, Db7=porta.7,E=porta.2, Rs=porta.0
Config Lcd=16*2
Cls
locate 2,2
Lcd "Keypad Project"
wait 1
cls

config portc.0=output
config portc.1=output
config portc.2=output
config portc.3=output

config portc.4=input
config portc.5=input
config portc.6=input
config portc.7=input
Dim helper1 As Long
Dim helper2 as long
Dim answer as long
Dim B as byte
Dim A as byte
helper1 = 0
helper2 = 0
B = 0
A = 0

do
waitms 100
portc.0=1
portc.1=0
portc.2=0
portc.3=0
waitms 100
if pinc.4=1 then
lcd "7"
if helper1 = 0 then
helper1 = 7
else
helper2 = 7
endif
waitms 700
endif

if pinc.5=1 then
lcd "8"
if helper1 = 0 then
helper1 = 8
else
helper2 = 8
endif
waitms 700
endif

if pinc.6=1 then
lcd "9"
if helper1 = 0 then
helper1 = 9
else
helper2 = 9
endif
waitms 700
endif

if pinc.7=1 then
lcd "/"
A = 0
B = 0
waitms 700
endif

waitms 100
portc.0=0
portc.1=1
portc.2=0
portc.3=0
waitms 100

if pinc.4=1 then
lcd "4"
if helper1 = 0 then
helper1 = 4
else
helper2 = 4
endif
waitms 700
endif

if pinc.5=1 then
lcd "5"
if helper1 = 0 then
helper1 = 5
else
helper2 = 5
endif
waitms 700
endif

if pinc.6=1 then
lcd "6"
if helper1 = 0 then
helper1 = 6
else
helper2 = 6
endif
waitms 700
endif

if pinc.7=1 then
lcd "*"
A = 0
B = 1
waitms 700
endif

waitms 100
portc.0=0
portc.1=0
portc.2=1
portc.3=0
waitms 100

if pinc.4=1 then
lcd "1"
if helper1 = 0 then
helper1 = 1
else
helper2 = 1
endif
waitms 700
endif

if pinc.5=1 then
lcd "2"
if helper1 = 0 then
helper1 = 2
else
helper2 = 2
endif
waitms 700
endif

if pinc.6=1 then
lcd "3"
if helper1 = 0 then
helper1 = 3
else
helper2 = 3
endif
waitms 700
endif

if pinc.7=1 then
lcd "-"
A = 1
B = 0
waitms 700
endif

waitms 100
portc.0=0
portc.1=0
portc.2=0
portc.3=1
waitms 100

if pinc.4=1 then
cls
lcd "reset"
helper1 = 0
helper2 = 0
A = 0
B = 0
answer = 0
wait 2
cls
endif

if pinc.5=1 then
lcd "0"
if helper1 = 0 then
helper1 = 0
else
helper2 = 0
endif
waitms 700
endif

if pinc.6=1 then
cls
if A = 0 and B = 0 then
lcd helper1
lcd "/"
lcd helper2
lcd "="
answer = helper1 / helper2
lcd answer
endif
if A = 0 and B = 1 then
lcd helper1
lcd "*"
lcd helper2
lcd "="
answer = helper1 * helper2
lcd answer
endif
if A = 1 and B = 0 then
lcd helper1
lcd "-"
lcd helper2
lcd "="
answer = helper1 - helper2
lcd answer
endif
if A = 1 and B = 1 then
lcd helper1
lcd "+"
lcd helper2
lcd "="
answer = helper1 + helper2
lcd answer
endif
waitms 700
endif

if pinc.7=1 then
lcd "+"
A = 1
B = 1
waitms 700
endif
loop
End