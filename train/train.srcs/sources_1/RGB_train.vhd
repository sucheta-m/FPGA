----------------------------------------------------------------------------
--	RGB_controller.vhd -- Nexys4 RGB LED controller
----------------------------------------------------------------------------
-- Author:  Marshall Wingerson 
--          Copyright 2013 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  08/08/2013(MarshallW): Created 
--  08/30/2013(SamB): Modified RGB pattern
--                    Added comments
----------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity RGB_train is
	port(
	GCLK 			: in std_logic;
	RGB_LED_1_O	: out std_logic_vector(2 downto 0);
	RGB_LED_2_O	: out std_logic_vector(2 downto 0)
	);
end RGB_train;

architecture Behavioral of RGB_train is
    constant max_count : natural := 48000000;
    signal Rst : std_logic;
    
    --PWM registers
    signal rgbLedReg1: std_logic_vector(2 downto 0);
    signal rgbLedReg2: std_logic_vector(2 downto 0);
begin
    Rst <= '0';
    -- 0 to max_count counter
    counter : process(GCLK, Rst)
        variable count : natural range 0 to max_count;
    begin
        if Rst = '1' then
            count := 0;
            rgbLedReg1 <= '1';
        elsif rising_edge(GCLK) then
            if count < max_count/2 then
                count := count + 1;
                rgbLedReg1 <= '1';
            elsif count < max_count then
                rgbLedReg1 <= '0';
                count := count + 1;
            else
                rgbLedReg1 <= '1';
                count := 0;
            end if;
        end if;
    end process counter; 

RGB_LED_1_O <= rgbLedReg1;
RGB_LED_2_O <= rgbLedReg2;	
end Behavioral;