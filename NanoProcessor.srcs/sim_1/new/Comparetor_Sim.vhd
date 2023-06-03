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

entity Comparetor_Sim is
--  Port ( );
end Comparetor_Sim;

architecture Behavioral of Comparetor_Sim is
Component Comparetor
    PORT(
        A_in : in STD_LOGIC_VECTOR (3 downto 0);
        B_in : in STD_LOGIC_VECTOR (3 downto 0);
        M : in STD_LOGIC_VECTOR (1 downto 0);
        S_out : out STD_LOGIC);
End Component;

SIGNAL A_in, B_in: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL M : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL S_out : STD_LOGIC;

begin
UUT : Comparetor
    PORT MAP(
        A_in => A_in,
        B_in => B_in,
        M => M,
        S_out => S_out);

    process
        begin
            -- this is for checking equality
            M <= "00";
            A_in <= "0000";
            B_in <= "1111";
            wait for 10ns;
            
            A_in <= "0000";
            B_in <= "0000";
            wait for 10ns;            
            
            A_in <= "1111";
            B_in <= "1001";
            wait for 10ns;            
            
            A_in <= "1001";
            B_in <= "0110";
            wait for 10ns; 
            
            -- this is for checking A > B
            M <= "01";
            A_in <= "0000";
            B_in <= "1111";
            wait for 10ns;
            
            A_in <= "0010";
            B_in <= "0000";
            wait for 10ns;            
            
            A_in <= "1111";
            B_in <= "1110";
            wait for 10ns;            
            
            A_in <= "1110";
            B_in <= "1111";
            wait for 10ns;
            
             -- this is for checking A < B
            M <= "10";
            A_in <= "0000";
            B_in <= "1111";
            wait for 10ns;
            
            A_in <= "0001";
            B_in <= "0000";
            wait for 10ns;            
            
            A_in <= "1000";
            B_in <= "1001";
            wait for 10ns;            
            
            A_in <= "1110";
            B_in <= "1001";
            wait for 10ns; 
            
            -- this is for checking equality
            M <= "11";
            A_in <= "0000";
            B_in <= "1111";
            wait for 10ns;
            
            A_in <= "0000";
            B_in <= "0000";
            wait for 10ns;            
            
            A_in <= "1111";
            B_in <= "1001";
            wait for 10ns;            
            
            A_in <= "1001";
            B_in <= "0110";
            wait;
                       
    end process;
end Behavioral;
