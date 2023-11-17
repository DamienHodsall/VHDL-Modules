# VHDL-Modules

# bclk

This is pretty easy to use and is almost essential to any project. Use as follows:

```vhdl
library ieee;
use ieee.std_logic_1164.all; -- clks are std_logic
use ieee.numeric_bit.all; -- uses integer for counting

entity example is
    port (
        clk: in std_logic;
        clkout: out std_logic
     );
end entity;

architecture main of example is

    component bclk is
        port (
            clk: in std_logic;
            period: in integer;
            clkout: out std_logic
         );
    end component;

    signal clktmp: std_logic;

begin

    C1: bclk port map (clk, 500000, clktmp); -- this will make clktmp 500 times slower than clk
    C2: bclk port map (clktmp, 20, clkout); -- input clk does not need to be the system clk

end main;
```

# pwm

Pulse Width Modulation is used to interface with lots of hardware. A great example of it's use is in servo.vhd.

# servo

Servos are useful... yeah.
