----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 04:41:09 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8_Sim - Behavioral
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

entity Decoder_3_to_8_Sim is
--  Port ( );
end Decoder_3_to_8_Sim;

architecture Behavioral of Decoder_3_to_8_Sim is
    
    Component Decoder_3_to_8
        PORT (
            I : in STD_LOGIC_VECTOR(2 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    End Component;
    
    SIGNAL I : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL En : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR(7 downto 0);
    
begin
    
    UUT : Decoder_3_to_8
        PORT MAP(
            I => I,
            En => En,
            Y => Y
        );
    
    
    process
    begin
    
        En <= '0';
        I <= "000";
        wait for 5ns;
        
        En <= '1';
        wait for 5ns;
        
        I <= "001";
        wait for 5ns;
        
        I <= "010";
        wait for 5ns;
        
        I <= "011";
        wait for 5ns;
        
        I <= "100";
        wait for 5ns;
        
        I <= "111";
        wait for 5ns;
        
        wait; -- wait forever
    
    end process;
end Behavioral;
