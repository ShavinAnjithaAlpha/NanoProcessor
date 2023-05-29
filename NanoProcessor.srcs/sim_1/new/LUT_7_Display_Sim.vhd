----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 08:46:15 PM
-- Design Name: 
-- Module Name: LUT_7_Display_Sim - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_7_Display_Sim is
--  Port ( );
end LUT_7_Display_Sim;

architecture Behavioral of LUT_7_Display_Sim is
component LUT_7_Display 
    port(
        address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal d : std_logic_vector(6 downto 0);
signal a : std_logic_vector(3 downto 0);

begin
UUT : LUT_7_Display
port map(
    data => d,
    address => a);

process
begin 
    a <= "0000";
    wait for 10ns;
    
    a <= "0001";
    wait for 10ns;
    
    a <= "0010";
    wait for 10ns;
    
    a <= "0011";
    wait for 10ns;
    
    a <= "0100";
    wait for 10ns;
    
    a <= "0101";
    wait for 10ns;
    
    a <= "0110";
    wait for 10ns;
    
    a <= "0111";
    wait for 10ns;
    
    a <= "1000";
    wait for 10ns;
    
    a <= "1001";
    wait for 10ns;
    
    a <= "1010";
    wait for 10ns;
    
    a <= "1011";
    wait for 10ns;
    
    a <= "1100";
    wait for 10ns;
    
    a <= "1101";
    wait for 10ns;
    
    a <= "1110";
    wait for 10ns;
    
    a <= "1111";
    wait;
    
end process;
end Behavioral;

