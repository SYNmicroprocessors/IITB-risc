library ieee;
use ieee.numeric_std.all;

entity signExt9_rev is
  port (
  dataIn: in std_logic_vector(8 downto 0);
  dataOut: out std_logic_vector(15 downto 0)
  );
end signExt9_rev;

architecture behavioral of signExt9_rev is

begin
    dataOut <= dataIn & "0000000";
end behavioral;
