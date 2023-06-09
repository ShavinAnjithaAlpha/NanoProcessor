----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:22:14 PM
-- Design Name: 
-- Module Name: Comparetor_Sim - Behavioral
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

entity Comparator_Sim is
--  Port ( );
end Comparator_Sim;

architecture Behavioral of Comparator_Sim is
    Component Comparator
        PORT(
            A_in : in STD_LOGIC_VECTOR (7 downto 0);
            B_in : in STD_LOGIC_VECTOR (7 downto 0);
            M : in STD_LOGIC_VECTOR (1 downto 0);
            S_out : out STD_LOGIC);
    End Component;

SIGNAL A_in, B_in: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL M : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL S_out : STD_LOGIC;

begin
    UUT : Comparator
        PORT MAP(
            A_in => A_in,
            B_in => B_in,
            M => M,
            S_out => S_out);

    process
        begin
            -- this is for checking equality
            M <= "00";
            A_in <= "00000000";
            B_in <= "11111111";
            wait for 10ns;
            
            A_in <= "00000000";
            B_in <= "00000000";
            wait for 10ns;            
            
            A_in <= "11111111";
            B_in <= "10010010";
            wait for 10ns;            
            
            A_in <= "10010011";
            B_in <= "01101100";
            wait for 10ns; 
            
            -- this is for checking A < B
            M <= "01";
            A_in <= "00000000";
            B_in <= "11110000";
            wait for 10ns;
            
            A_in <= "00100000";
            B_in <= "00000000";
            wait for 10ns;            
            
            A_in <= "11110000";
            B_in <= "11100000";
            wait for 10ns;            
            
            A_in <= "11100000";
            B_in <= "11110000";
            wait for 10ns;
            
             -- this is for checking A > B
            M <= "10";
            A_in <= "00000000";
            B_in <= "11110000";
            wait for 10ns;
            
            A_in <= "00010000";
            B_in <= "00000000";
            wait for 10ns;            
            
            A_in <= "10000000";
            B_in <= "10010000";
            wait for 10ns;            
            
            A_in <= "11100000";
            B_in <= "10010000";
            wait for 10ns; 
            
            -- this is for checking inequality
            M <= "11";
            A_in <= "00000000";
            B_in <= "11110000";
            wait for 10ns;
            
            A_in <= "00000000";
            B_in <= "00000000";
            wait for 10ns;            
            
            A_in <= "11110000";
            B_in <= "10010000";
            wait for 10ns;            
            
            A_in <= "10010000";
            B_in <= "01100000";
            wait;
                       
    end process;
end Behavioral;
