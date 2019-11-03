=============================================================================
--! @file fdre.vhd
=============================================================================
--! Standard library
library IEEE;
--! Standard packages
use IEEE.STD_LOGIC_1164.ALL; 

-------------------------------------------------------------------------------
-- --
-- Techniex.com, Rising Edge D Flip-Flop (FDRE)--
-- --
-------------------------------------------------------------------------------
--
-- unit name: FDRE
--
--! @brief D Flip-flop with Synchronous/Asynchronous reset or Synchronous/Asynchronous set, and clock enable.
--! with clock enable removed, output holds the previous value.
--! reset forces the output to 0 while set forces it to 1.
--! All parameters are selectable by generic port instantiation.
--
--! @author Purnendu Kumar (purnendu.tx@gmail.com)
--
--! @date 03\11\2019
--
--! @version <v0.1>
--
--! @details
--!
--! <b>Dependencies:</b>\n
--! <None>
-------------------------------------------------------------------------------
--! \n\n<b>Last changes:</b>\n
--! 03\11\2019: Purnendu Kumar File Creation\n
-------------------------------------------------------------------------------
--! @todo Create Test Bench \n
--! Update code as per synthesis in Xilinx/Intel FPGA \n
--! Create new article at https://techniex.com
-------------------------------------------------------------------------------

--============================================================================
--! Entity declaration for Rising Edge D Flip-Flop (FDRE)
--============================================================================
entity FDRE is
generic (
  g_ISSR : string := "yes"; --! g_ISSR := yes set/reset function available, g_ISSR := no set/reset function not available 
  g_SRMODE: string := "sync"; --! g_SRMODE := sync synchronous set/reset, g_SRMODE := async asynchronous set/reset
  g_ISCLKEN : string := "yes"; --! g_ISCLKEN := yes clk enable function available, g_ISCLKEN := no clk enable function not available
  g_ISSET: std_logic := '1'; --! g_ISSET := '1' set pin active, g_ISSET := '0' reset pin active
  g_ISSRHIGH: std_logic := '1'; --! g_ISSRHIGH := '1' active high reset/preset, g_ISSRHIGH := '0' active low reset/preset
  g_ISCLKENHIGH: std_logic := '1' --! g_CLKENHIGH := '1' active high ce, g_ISCLKENHIGH := '0' active low ce
);
port (
  -- global input signals
  clk_i: in std_logic; --! input clock
  sr_i : in std_logic; --! set/reset =1: set/reset active if g_ISRESETHIGH := '1'
  ce_i : in std_logic; --! ce =1: clk enable if g_ISCLKENHIGH := yes
  D_i : in std_logic; --! data input
	-- global output signals
	Q_o: out std_logic; --! D flip flop output
  Q_n_o : out std_logic --! D flip flop inverted output
);
end entity FDRE;

--============================================================================
-- ! architecture declaration
--============================================================================
architecture rtl of FDRE is
signal s_output: std_logic := '0'; --! output variable
--============================================================================
-- architecture begin
--============================================================================
begin

--! Getting the complemented output
Q_n_o <= not s_output;
Q_o <= s_output;

--! Process generation based on generic input selection
g_SR: if (g_ISSR = "yes") generate --! generate if set/reset pin is enable
  g_SRCE : if (g_ISCLKEN = "yes") generate --! generate if set/reset pin and ce pin are enable
    g_SRCESYNC: if (g_SRMODE = "sync") generate --! generate if set/reset pin and ce pin are enable in synchronous mode
--============================================================================
-- Beginning of p_FDSCRE
--! Process D FF with synchronous set/reset and clock enable
--! read: clk_i, D_i, sr_i, ce_i \n
--! write: s_output \n
--! r/w: \n
--============================================================================
      p_FDSCRE: process(clk_i)
      begin
        if (rising_edge(clk_i)) then
          if (sr_i = g_ISSRHIGH) then
            s_output <= g_ISSET;
          else
            if (ce_i = g_ISCLKENHIGH) then
              s_output <= D_i;
            end if;
          end if;
        end if;    
      end process p_FDSCRE;
------------------------------------------------------------------------------
-- end process p_FDSCRE
------------------------------------------------------------------------------
    end generate g_SRCESYNC;
    g_SRCEASYNC: if (g_SRMODE = "async") generate --! generate if set/reset pin and ce pin are enable in asynchronous mode
--============================================================================
-- Beginning of p_FDACRE
--! Process D FF with asynchronous set/reset and clock enable
--! read: clk_i, D_i, sr_i, ce_i\n
--! write: s_output \n
--! r/w: \n
--============================================================================
      p_FDACRE: process(clk_i, sr_i)
      begin
        if (sr_i = g_ISSRHIGH) then
          s_output <= g_ISSET;
        else
          if (rising_edge(clk_i)) then
            if (ce_i = g_ISCLKENHIGH) then
              s_output <= D_i;
            end if;
          end if;
        end if;    
      end process p_FDACRE;
------------------------------------------------------------------------------
-- end process p_FDACRE
------------------------------------------------------------------------------
    end generate g_SRCEASYNC;
  end generate g_SRCE;
  g_SRNC : if (g_ISCLKEN = "no") generate --! generate if set/reset pin is enable and ce pin is disable
    g_SRNCSYNC: if (g_SRMODE = "sync") generate --! generate if set/reset pin is enable and ce pin is disable in synchronous mode
--============================================================================
-- Beginning of p_FDSNRE
--! Process D FF with synchronous set/reset
--! read: clk_i, D_i, sr_i \n
--! write: s_output \n
--! r/w: \n
--============================================================================
      p_FDSNRE: process(clk_i)
      begin
        if (rising_edge(clk_i)) then
          if (sr_i = g_ISSRHIGH) then
            s_output <= g_ISSET;
          else
            s_output <= D_i;
          end if;
        end if;    
      end process p_FDSNRE;
------------------------------------------------------------------------------
-- end process p_FDSNRE
------------------------------------------------------------------------------
    end generate g_SRNCSYNC;
    g_SRNCASYNC: if (g_SRMODE = "async") generate --! generate if set/reset pin is enable and ce pin is disable in asynchronous mode
--============================================================================
-- Beginning of p_FDANRE
--! Process D FF with asynchronous set/reset
--! read: clk_i, D_i, sr_i\n
--! write: s_output \n
--! r/w: \n
--============================================================================
      p_FDANRE: process(clk_i, sr_i)
      begin
        if (sr_i = g_ISSRHIGH) then
          s_output <= g_ISSET;
        else
          if (rising_edge(clk_i)) then
            s_output <= D_i;
          end if;
        end if;    
      end process p_FDANRE;
------------------------------------------------------------------------------
-- end process p_FDANRE
------------------------------------------------------------------------------
    end generate g_SRNCASYNC;
  end generate g_SRNC;
end generate g_SR;
g_NSR: if (g_ISSR = "no") generate --! generate if set/reset pin is disable
  g_NSRCE : if (g_ISCLKEN = "yes") generate --! generate if set/reset pin is disable and ce pin is enable
--============================================================================
-- Beginning of p_FDNCRE
--! Process D FF with clock enable
--! read: clk_i, D_i, ce_i\n
--! write: s_output \n
--! r/w: \n
--============================================================================
    p_FDNCRE: process(clk_i)
    begin
      if (rising_edge(clk_i)) then
        if (ce_i = g_ISCLKENHIGH) then
          s_output <= D_i;
        end if;
      end if;    
    end process p_FDNCRE;
------------------------------------------------------------------------------
-- end process p_FDNCRE
------------------------------------------------------------------------------
  end generate NSRCE;
  g_NSRNC : if (g_ISCLKEN = "no") generate --! generate if set/reset pin  and ce pin is disable
--============================================================================
-- Beginning of p_FDNNRE
--! Process D FF simple
--! read: clk_i D_i, \n
--! write: s_output \n
--! r/w: \n
--============================================================================
    p_FDNNRE: process(clk_i)
    begin
      if (rising_edge(clk_i)) then
        s_output <= D_i;
      end if;    
    end process p_FDNNRE;
------------------------------------------------------------------------------
-- end process p_FDNNRE
------------------------------------------------------------------------------
  end generate NSRNC;
end generate g_NSR;

end architecture rtl;
--============================================================================
-- architecture end
--============================================================================
