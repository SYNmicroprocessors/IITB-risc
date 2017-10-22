library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU16 is port
 ( 	A: in std_logic_vector (15 downto 0);
 	B: in std_logic_vector (15 downto 0);
 	AluOp: in std_logic_vector (1 downto 0);
 	Zero: out std_logic;
 	Carry: out std_logic;
 	R: out std_logic_vector (15 downto 0)
 );
 end ALU16;

architecture behavioral of ALU is
  signal AluResult: std_logic_vector(15 downto 0);
  signal tmp: std_logic_vector (16 downto 0);
begin
process(A,B,AluOp,AluResult,Zero)
begin
  case AluOp is
    when "00" => --Add
      AluResult <= A+B;
    when "01" => --sub
      AluResult <= A - B;
    when "10" => --nand
      AluResult <= A nand B;
    when others =>
      NULL;

    if( AluResult = "0000000000000000" ) then
        Zero <= '1';
    else Zero <='0';
    end if;
  end case;
end process;
R <= AluResult;
tmp <= ('0' & A) + ('0' & B);
Carry <= tmp(16);
end behavioral;
