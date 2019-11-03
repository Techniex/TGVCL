=============================================================================
--! @file templet.vhd
=============================================================================
--! Standard library
library IEEE;
--! Standard packages
use IEEE.XXX.ALL;
use IEEE.XXX.ALL;
--! Specific packages
use work.XXX.ALL;
-------------------------------------------------------------------------------
-- --
-- company name, division and the name of the design --
-- --
-------------------------------------------------------------------------------
--
-- unit name: full name (shortname / entity name)
--
--! @brief <file content, behavior, purpose, special usage notes>
--! <further description>
--
--! @author <author name (email)>
--
--! @date <--\--\---->
--
--! @version <v.>
--
--! @details
--!
--! <b>Dependencies:</b>\n
--! <Entity Name,...>
--!
--! <b>References:</b>\n
--! <reference one> \n
--! <reference two>
--!
--! <b>Modified by:</b>\n
--! Author: <name>
-------------------------------------------------------------------------------
--! \n\n<b>Last changes:</b>\n
--! <date> <initials> <log>\n
--! <extended description>
-------------------------------------------------------------------------------
--! @todo <next thing to do> \n
--! <another thing to do> \n
--
-------------------------------------------------------------------------------

--============================================================================
--! Entity declaration for <long entity name of my_entity>
--============================================================================
entity my_entity is
generic (
	g_MYGENERIC : positive := 32 --! something which has to be configurable
);
port (
	-- global input signals
	--! Extend description of the local bus clock
	clk_i: in std_logic; --! local bus clock
	reset_n_i : in std_logic; --! reset =0: reset active reset =1: no reset
	-- global output signals
	led_o: out std_logic; --! LED =0: LED on LED =1: LED off
	-- data bus(es)
	data_b: inout std_logic_vector (7 downto 0) --! data bus
);
end entity my_entity;

--============================================================================
-- ! architecture declaration
--============================================================================
architecture rtl of my_entity is
--! Extended description of local clock \n
signal s_lclk : std_logic; --! local clock
--============================================================================
-- architecture begin
--============================================================================
begin
--============================================================================
-- Beginning of my_process
--! Process <description>
--! read: clk_i, reset_n_i \n
--! write: s_lclk \n
--! r/w: led_o \n
--============================================================================
p_my_process: process (clk_i)
begin
	if (clk_i’event and clk_i = ’1’) then -- synchronous process
		if reset_n_i = ’0’ then
			-- reset to default value
			led_o <= ’1’;
		else
			-- generate clock signal and LED output
			s_lclk <= not s_lclk; -- s_lclk now runs at half of clk_i
			if s_lclk = ’1’ then
				led_o <= ’0’ -- turn on LED if s_lclk is high
			end if;
		end if;
	end if;
end process p_my_process;

end architecture rtl;
--============================================================================
-- architecture end
--============================================================================
