----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 07:47:04 PM
-- Design Name: 
-- Module Name: Shift_operator_Sim - Behavioral
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

entity Shift_operator_Sim is
--  Port ( );
end Shift_operator_Sim;

architecture Behavioral of Shift_operator_Sim is
Component Shift_operator
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC_VECTOR (1 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

SIGNAL A_in, S_out, B_in : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL M : STD_LOGIC_VECTOR (1 downto 0);

begin
    UUT : Shift_operator
        PORT MAP(
            A_in => A_in,
            B_in => B_in,
            M => M,
            S_out => S_out);
        -- m = 11 for left shift
        -- m = 10 for right shift
    process
        begin
        A_in <= "0000";
        B_in <= "0000";
        M <= "10";
        wait for 10ns;
        
        A_in <= "0001";
        B_in <= "0000";
        M <= "10";
        wait for 10ns;
        
        A_in <= "0010";
        B_in <= "0000";
        M <= "10";
        wait for 10ns;
        
        A_in <= "0100";
        B_in <= "0000";
        M <= "10";
        wait for 10ns;
        
        A_in <= "1000";
        B_in <= "0000";
        M <= "10";
        wait for 10ns;
        
        A_in <= "0000";
        B_in <= "0000";
        M <= "01";
        wait for 10ns;
        
        A_in <= "0001";
        B_in <= "0000";
        M <= "01";
        wait for 10ns;
        
        A_in <= "0010";
        B_in <= "0000";
        M <= "01";
        wait for 10ns;
        
        A_in <= "0100";
        B_in <= "0000";
        M <= "01";   
        wait for 10ns;
        
        A_in <= "1000";
        B_in <= "0000";
        M <= "01";        
        wait;
    end process;

end Behavioral;