library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity bclk is
    port (
        clk: in std_logic;
        period: in integer;
        clkout: out std_logic
    );
end entity;

architecture main of bclk is
    signal count: integer;
    signal clkint: std_logic;
begin
    process(clk)
    begin
        count <= count + 1;
        if clk'event and clk = '1' then
            if count = period then
                count <= 0;
                clkint <= not clkint;
            end if;
        end if;
    end process;
    clkout <= clkint;
end main;
