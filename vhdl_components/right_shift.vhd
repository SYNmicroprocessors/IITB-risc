library ieee;
use ieee.std_logic_1164.all;

entity rightshift is
  port (
  dataIn: in std_logic_vector(7 downto 0);
  dataOut: out std_logic_vector(7 downto 0)
  );
end rightshift;

architecture behavioral of rightshift is
begin
  dataOut <= '0' & dataIn(0,6);
end architecture;
