library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;

entity pwm is
    port (
        clk: in std_logic;
        period: in integer;
        duty: in integer;
        sig: out std_logic
    );
end entity;

architecture main of pwm is

    signal count: integer:= 0;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if count < duty then
                sig <= '1';
            else
                sig <= '0';
            end if;
            count <= count + 1;
            if count >= (period - 1) then
                count <= 0;
            end if;
        end if;
    end process;

end architecture;