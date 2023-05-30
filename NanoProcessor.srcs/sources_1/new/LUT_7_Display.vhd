----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 08:41:45 PM
-- Design Name: 
-- Module Name: LUT_7_Display - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_7_Display is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_7_Display;

architecture Behavioral of LUT_7_Display is

type rom_type is array(0 to 15) of STD_LOGIC_VECTOR(6 downto 0);

    SIGNAL sevenSegment_ROM : rom_type := (
                            "1000000", -- 0
                            "1111001", -- 1
                            "0100100", -- 2
                            "0110000", -- 3
                            "0011001", -- 4
                            "0010010", -- 5
                            "0000010", -- 6
                            "1111000", -- 7
                            "0000000", -- 8
                            "0010000", -- 9
                            "0001000", -- a
                            "0000011", -- b
                            "1000110", -- c
                            "0100001", -- d
                            "0000110", -- e
                            "0001110" -- f
                            );
begin
    data <= sevenSegment_ROM(to_integer(unsigned(address)));
    
end Behavioral;
