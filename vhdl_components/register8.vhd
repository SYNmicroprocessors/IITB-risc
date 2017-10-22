library ieee;
use ieee.std_logic_1164.all;

entity register8 is
  port (
  dataIn: in std_logic_vector(7 downto 0);
  wr: in std_logic;
  rd: in std_logic;
  RST: in std_logic;
  CLK: in std_logic;
  dataOut: out std_logic_vector(7 downto 0)
  );
end register8;

architecture behavioral of register is

  signal data_register: std_logic_vector(dataIn'range);

begin
  dataOut <= data_register;
  process(RST,CLK)
  begin
    if RST = '1' then
      data_register <= (data_register'range => '0');
    elsif rising_edge(CLK) then
      if wr = '0' then
          data_register <= dataIn;
      end if;
    end if;
  end process;

end behavioral;
