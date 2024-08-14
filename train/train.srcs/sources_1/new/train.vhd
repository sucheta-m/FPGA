----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2024 10:13:24 PM
-- Design Name: 
-- Module Name: train - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--The IEEE.std_logic_unsigned contains definitions that allow 
--std_logic_vector types to be used with the + operator to instantiate a 
--counter.
use IEEE.std_logic_unsigned.all;

entity train is
    Port( CLK 			: in  STD_LOGIC; 
          LED 			: out  STD_LOGIC_VECTOR (3 downto 0);
          UART_TXD 	    : out  STD_LOGIC;
          RGB0_Red		: out  STD_LOGIC;
          RGB0_Green    : out  STD_LOGIC;
          RGB0_Blue     : out  STD_LOGIC;    
          RGB1_Red		: out  STD_LOGIC;
          RGB1_Green	: out  STD_LOGIC;
          RGB1_Blue	    : out  STD_LOGIC;
          RGB2_Red		: out  STD_LOGIC;
          RGB2_Green    : out  STD_LOGIC;
          RGB2_Blue     : out  STD_LOGIC;    
          RGB3_Red		: out  STD_LOGIC;
          RGB3_Green	: out  STD_LOGIC;
          RGB3_Blue	    : out  STD_LOGIC
			  );
end train;

architecture Behavioral of train is

component RGB_train
Port(
	GCLK 		   : in std_logic;
	RGB_LED_1_O	   : out std_logic_vector(2 downto 0);
	RGB_LED_2_O	   : out std_logic_vector(2 downto 0)
	);
end component;

begin

RGB_Core1: RGB_train port map(
	GCLK => CLK, 			
	RGB_LED_1_O(0) => RGB0_Green, 
	RGB_LED_1_O(1) => RGB0_Blue,
	RGB_LED_1_O(2) => RGB0_Red,
	RGB_LED_2_O(0) => RGB2_Green, 
	RGB_LED_2_O(1) => RGB2_Blue,
	RGB_LED_2_O(2) => RGB2_Red
	);
	
RGB_Core2: RGB_train port map(
    GCLK => CLK,             
    RGB_LED_1_O(0) => RGB1_Green, 
    RGB_LED_1_O(1) => RGB1_Blue,
    RGB_LED_1_O(2) => RGB1_Red,
    RGB_LED_2_O(0) => RGB3_Green, 
    RGB_LED_2_O(1) => RGB3_Blue, 
    RGB_LED_2_O(2) => RGB3_Red
    );

end Behavioral;
