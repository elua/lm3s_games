-- eLua test 

local uartid, invert, ledpin = 0, false
if pd.board() == "EK-LM3S8962" or pd.board() == "EK-LM3S6965" then
  ledpin = pio.PF_0
else
  print( "\nError: Unsupported board " .. pd.board() )
  return
end

function cycle()
  pio.pin.sethigh( ledpin ) 
  tmr.delay( 0, 500000 )
  pio.pin.setlow( ledpin ) 
  tmr.delay( 0, 500000 )
end

pio.pin.setdir( pio.OUTPUT, ledpin )
print( "Hello from eLua on " .. pd.board() )
print "Watch your LED blinking :)"
print "Press any key to end this demo.\n"

while uart.getchar( uartid, 0 ) == "" do
  cycle()
end

