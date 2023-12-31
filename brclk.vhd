library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity brclk is
    port (
        clkin : in std_logic;
        reset : in std_logic;
        period : in integer;
        clkout : out std_logic
    );
end entity;

architecture main of brclk is
    signal count : integer;
    signal clkint : std_logic;
begin
    process(clkin)
    begin
        count <= count + 1;
        if reset = '1' then
            count <= 0;
        end if;

        if rising_edge(clkin) then
            if count >= period then
                count <= 0;
                clkint <= not clkint;
            end if;
        end if;
    end process;
    clkout <= clkint;
end main;
