library ieee;
use ieee.numeric_std.all;

entity signExt9 is
  port (
  dataIn: in std_logic_vector(8 downto 0);
  dataOut: out std_logic_vector(15 downto 0)
  );
end signExt9;

architecture behavioral of signExt9 is
begin
    dataOut <= "0000000" & dataIn;
end behavioral;
