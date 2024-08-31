library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
	generic 
	(
		DATA_WIDTH : natural := 8
	);
	Port (  RELOJ : in STD_LOGIC;
			  RESET : in STD_LOGIC;
			  ENTRADA  : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
			  SALIDA : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0));
end registro;

architecture Behavioral of registro is
signal valor_interno : std_logic_vector (DATA_WIDTH-1 downto 0) := (others => '0');
begin
	process (RELOJ, RESET, ENTRADA)
	begin		
		if RESET = '0' then 
			valor_interno <= (others => '0');
		elsif rising_edge (RELOJ) then
			valor_interno <= ENTRADA;
		end if;
	end process;
	
	process (valor_interno)
	begin
		SALIDA <= valor_interno;
	end process;
end Behavioral;