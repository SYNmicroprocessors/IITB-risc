library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
  port(
    outA        : out std_logic_vector(15 downto 0);
    outB        : out std_logic_vector(15 downto 0);
    PCOut       : out std_logic_vector(15 downto 0);
    PCIn        : in std_logic_vector(15 downto 0);
    inputC       : in  std_logic_vector(15 downto 0);
    writeEnable : in  std_logic;
    PCEnable    : in std_logic;
    regASel     : in  std_logic_vector(2 downto 0);
    regBSel     : in  std_logic_vector(2 downto 0);
    writeRegSel : in  std_logic_vector(2 downto 0);
    clk         : in  std_logic
    );
end register_file;


architecture behavioral of register_file is
  type registerFile is array(0 to 7) of std_logic_vector(15 downto 0);
  signal registers : registerFile;
begin
  regFile : process (clk) is
  begin
    if rising_edge(clk) then
      -- Read A and B before bypass
      outA <= registers(to_integer(unsigned(regASel)));
      outB <= registers(to_integer(unsigned(regBSel)));
      PCOut <= registers(7);
      -- Write and bypass
      if writeEnable = '1' then
        registers(to_integer(unsigned(writeRegSel))) <= inputC;  -- Write
        if regASel = writeRegSel then  -- Bypass for read A
          outA <= inputC;
        end if;
        if regBSel = writeRegSel then  -- Bypass for read B
          outB <= inputC;
        end if;
      end if;
      --pc
      if PCEnable = '1' then
        registers(7) <= PCIn;
      end if;  
    end if;
  end process;
end behavioral;
