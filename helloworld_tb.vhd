
library ieee;
use ieee.std_logic_1164.all;

library work;

--Every file needs entity, TB can be empty

entity helloworld_tb is

end entity helloworld_tb;

--Test bench architecture (note name 'testbench' is not siginificant)
architecture testbench of helloworld_tb is
   signal tb_clock  : std_logic;
   signal tb_reset  : std_logic := '1';
   signal tb_leds   : std_logic_vector(3 downto 0);

begin

   -- Instantiate top level
   tb : entity work.helloworld
      port map(
         i_clk   => tb_clock,
         i_reset => tb_reset,
         o_leds  => tb_leds);

   -- create clock ("INFINITE LOOP")
   clkGen : process
   begin
      tb_clock <= '0';
      wait for 10 ns;
      tb_clock <= '1';
      wait for 10 ns;
   end process clkgen;

   -- create reset
   resetGen : process
   begin
      tb_reset <= '1';
      wait for 42 ns;
      tb_reset <= '0'; --de-assert reset
      wait; --Wait FOREVER
   end process resetGen;

end architecture testbench;