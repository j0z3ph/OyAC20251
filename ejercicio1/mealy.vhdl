-- Quartus Prime VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;

entity mealy is

	port
	(
		clk		 : in	std_logic;
		input	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic
	);

end entity;

architecture rtl of mealy is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal state : state_type;

begin

	process (clk, reset)
	begin

		if reset = '1' then
			state <= s0;

		elsif (rising_edge(clk)) then

			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when s0=>
					if input = '1' then
						state <= s0;
					else
						state <= s1;
					end if;
				when s1=>
					if input = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
					if input = '1' then
						state <= s0;
					else
						state <= s3;
					end if;
				when s3=>
					if input = '1' then
						state <= s0;
					else
						state <= s1;
					end if;
			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state, input)
	begin
			case state is
				when s0=>
					if input = '1' then
						output <= '0';
					else
						output <= '0';
					end if;
				when s1=>
					if input = '1' then
						output <= '0';
					else
						output <= '0';
					end if;
				when s2=>
					if input = '1' then
						output <= '0';
					else
						output <= '0';
					end if;
				when s3=>
					if input = '1' then
						output <= '1';
					else
						output <= '0';
					end if;
			end case;
	end process;

end rtl;
