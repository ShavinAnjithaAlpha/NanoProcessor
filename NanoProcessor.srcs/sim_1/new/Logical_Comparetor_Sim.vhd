----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:29:27 PM
-- Design Name: 
-- Module Name: Logical_Comparetor_Sim - Behavioral
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

entity Logical_Unit_Sim is
--  Port ( );
end Logical_Unit_Sim;

architecture Behavioral of Logical_Unit_Sim is
Component Logical_Unit
    PORT(
        A_in : in STD_LOGIC_VECTOR (3 downto 0);
        B_in : in STD_LOGIC_VECTOR (3 downto 0);
        S_out : out STD_LOGIC_VECTOR (3 downto 0);
        M : in STD_LOGIC_VECTOR (1 downto 0));
End Component;

SIGNAL A_in, B_in, S_out : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL M : STD_LOGIC_VECTOR(1 downto 0);

begin
    UUT : Logical_Unit
        PORT MAP(
            A_in => A_in,
            B_in => B_in,
            S_out => S_out,
            M => m);

    process
    begin
        M <= "00";
        A_in <= "1111";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "0101";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0000";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "1010";
        B_in <= "0101";
        wait for 10ns;        
        
        M <= "01";
        A_in <= "1111";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "0101";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0000";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "1010";
        B_in <= "0101";
        wait for 10ns;        
        
        M <= "10";
        A_in <= "1111";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "0101";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0000";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "1010";
        B_in <= "0101";
        wait for 10ns;        
        
        M <= "11";
        A_in <= "1111";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "0101";
        B_in <= "1111";
        wait for 10ns;
        
        A_in <= "0000";
        B_in <= "1010";
        wait for 10ns;
        
        A_in <= "1010";
        B_in <= "0101";
        wait;        
        
    end process;
end Behavioral;
