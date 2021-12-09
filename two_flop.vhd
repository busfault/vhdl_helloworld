-- A 2-flop similar to the verilog example.
library ieee;
use ieee.std_logic_1164.all;
------ Entity
entity two_flop is
   port (
      i_clock : in std_logic;
      i_reset : in std_logic;
      o_ff  : out std_logic
   );
end entity two_flop;
------ Architecture
architecture RTL of two_flop is	
   signal flop1   : std_logic;
   signal flop2   : std_logic;

begin
  --Process
  o_ff <= flop2;
  twoFlopProc:  process(i_clock, i_reset) is
  begin
     if (i_reset = '1') then
         flop1 <= '0';
         flop2 <= '1';
     elsif rising_edge(i_clock) then
         flop1 <= flop2;
         flop2 <= flop1;
     end if;
  end process twoFlopProc;
end architecture RTL;
