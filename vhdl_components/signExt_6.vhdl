library ieee;
use ieee.numeric_std.all;

entity signExt6 is
  port (
  dataIn: in std_logic_vector(5 downto 0);
  dataOut: out std_logic_vector(15 downto 0)
  );
end signExt6;

architecture behavioral of signExt6 is
    --signal s6  : std_logic_vector( 5 downto 0);
    --signal s16 : std_logic_vector( 15 downto 0);
begin
    dataOut <= "0000000000" & dataIn;
end behavioral;
