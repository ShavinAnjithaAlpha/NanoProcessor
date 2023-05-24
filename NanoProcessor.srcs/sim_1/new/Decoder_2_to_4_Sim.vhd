----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 04:36:24 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4_Sim - Behavioral
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

entity Decoder_2_to_4_Sim is
--  Port ( );
end Decoder_2_to_4_Sim;

architecture Behavioral of Decoder_2_to_4_Sim is

    Component Decoder_2_to_4
        PORT (
            I : in STD_LOGIC_VECTOR(1 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        ); 
    End Component;
    
    SIGNAL I : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL En : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR(3 downto 0);
    
begin

    UUT : Decoder_2_to_4 
        PORT MAP(
            I => I,
            En => En,
            Y => Y
        );
    
    
    process
    begin
        
        En <= '0';
        I <= "00";
        wait for 5ns;
        
        En <= '1';
        wait for 5ns;
        
        I <= "01";
        wait for 5ns;
        
        I <= "10";
        wait for 5ns;
        
        I <= "11";
        wait for 5ns;
        
        wait; -- wait forever
        
    end process;

end Behavioral;
