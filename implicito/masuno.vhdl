library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity masuno is
	generic 
	(
		DATA_WIDTH : natural := 3
	);
	Port (  entrada : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
			  salida  : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0));
end masuno;

architecture Behavioral of masuno is
begin
	process (entrada)
	begin
		salida <= entrada + 1;
	end process;
end Behavioral;