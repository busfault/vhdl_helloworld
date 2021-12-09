library ieee;
use ieee.std_logic_1164.all;

library work;


--entity name must match filename
entity helloworld is
   port (
      i_clk    : in std_logic;
      i_reset  : in std_logic;
      --
      o_leds   : out std_logic_vector(3 downto 0)
   );
end entity helloworld;

--Architecture OF the ENTITY

architecture rtl of helloworld is
  --Signal definitions

  signal ff    : std_logic_vector(1 downto 0);


begin
   o_leds(0) <= ff(1) and ff(0);
   o_leds(1) <= ff(1)  or ff(0);
   o_leds(2) <= ff(1) xor ff(0);
   --instantiate two_flop
   ff2a : entity work.two_flop
   port map (
      i_clock => i_clk,
      i_reset => i_reset,
      o_ff    => ff(0)
   );


   --instantiate two_flop
   ff2b : entity work.two_flop
   port map (
      i_clock => i_clk,
      i_reset => i_reset,
      o_ff    => ff(1)
   );


end architecture rtl;