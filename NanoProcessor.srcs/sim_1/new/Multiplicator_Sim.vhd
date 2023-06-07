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
    PORT ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           Ovf : out STD_LOGIC);
End Component;

    SIGNAL A_in, B_in, S_out : STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL Ovf : STD_LOGIC;
    
begin
UUT : Multiplicator
    PORT MAP(
        A_in => A_in,
        B_in => B_in,
        S_out => S_out,
        Ovf => Ovf);

    process 
    begin
        A_in <= "0000";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0001";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0010";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0100";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "1000";
        B_in <= "1111";
        wait;
    
    end process;
    
end Behavioral;
