----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:35:36 PM
-- Design Name: 
-- Module Name: Multiplicator_Sim - Behavioral
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

entity Multiplicator_Sim is
--  Port ( );
end Multiplicator_Sim;

architecture Behavioral of Multiplicator_Sim is
Component Multiplicator
    PORT ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Ovf : out STD_LOGIC);
End Component;

    SIGNAL A, B, S : STD_LOGIC_VECTOR (7 downto 0);
    SIGNAL Ovf : STD_LOGIC;
    
begin
UUT : Multiplicator
    PORT MAP(
        A => A,
        B => B,
        S => S,
        Ovf => Ovf);

    process 
    begin
        A <= "00000000";
        B <= "11111111";
        wait for 10ns;
        
        A <= "00000001";
        B <= "11111111";
        wait for 10ns;
        
        A <= "00000010";
        B <= "11111111";
        wait for 10ns;
        
        A <= "00000100";
        B <= "11111111";
        wait for 10ns;
        
        A <= "00001000";
        B <= "11111111";
        
        A <= "00011011";
        B <= "00000011";
        wait for 5ns;
        
        A <= "00001001";
        B <= "00001000";
        wait for 5ns; 
        
        A <= "00010111";
        B <= "00001000";
        wait for 5ns;
        
        wait;
    
    end process;
    
end Behavioral;
