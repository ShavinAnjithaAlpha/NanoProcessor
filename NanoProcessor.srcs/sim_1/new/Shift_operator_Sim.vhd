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

entity Shifter_Sim is
--  Port ( );
end Shifter_Sim;

architecture Behavioral of Shifter_Sim is
    Component Shifter
        Port ( A_in : in STD_LOGIC_VECTOR (7 downto 0);
               M : in STD_LOGIC_VECTOR (1 downto 0);
               S_out : out STD_LOGIC_VECTOR (7 downto 0));
    End Component;

    SIGNAL A_in, S_out : STD_LOGIC_VECTOR (7 downto 0);
    SIGNAL M : STD_LOGIC_VECTOR (1 downto 0);

begin
    UUT : Shifter
        PORT MAP(
            A_in => A_in,
            M => M,
            S_out => S_out);
        -- m = 01 for left shift
        -- m = 10 for right shift
    process
        begin
        A_in <= "00000001";
        M <= "10";
        wait for 10ns;
        
        A_in <= "00000011";
        M <= "10";
        wait for 10ns;
        
        A_in <= "00001010";
        M <= "10";
        wait for 10ns;
        
        A_in <= "00010100";
        M <= "10";
        wait for 10ns;
        
        A_in <= "00011000";
        M <= "10";
        wait for 10ns;
        
        A_in <= "00010000";
        M <= "01";
        wait for 10ns;
        
        A_in <= "00000101";
        M <= "01";
        wait for 10ns;
        
        A_in <= "00000110";
        M <= "01";
        wait for 10ns;
        
        A_in <= "01000100";
        M <= "01";   
        wait for 10ns;
        
        A_in <= "10001000";
        M <= "01";        
        wait;
    end process;

end Behavioral;