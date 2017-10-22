library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_2to1 is
  port(
    A,B: in std_logic_vector(15 downto 0);
    S: in std_logic;
    R: out std_logic_vector(15 downto 0)
  );
end mux_2to1;

architecture behavioral of mux_2 is
begin
  process(A,B,C,D,S)
  begin
    case S is
      when "0" =>
      R<= A;
      when "1" =>
      R<= B;
    end case;
end behavioral;
