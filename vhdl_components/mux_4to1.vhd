library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_4to1 is
  port(
    A,B,C,D: in std_logic_vector(15 downto 0);
    S: in std_logic_vector(1 downto 0);
    R: out std_logic_vector(15 downto 0)
  );
end mux_4to1;

architecture behavioral of mux is

begin
  process(A,B,C,D,S)
  begin
    case S is
      when "00" =>
      R<= A;
      when "01" =>
      R<= B;
      when "10" =>
      R<= C;
      when "11" =>
      R<= D;
    end case;
end behavioral;
