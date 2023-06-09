----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 04:32:05 PM
-- Design Name: 
-- Module Name: Adder_8Bit_Sim - Behavioral
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

entity Adder_8Bit_Sim is
--  Port ( );
end Adder_8Bit_Sim;

architecture Behavioral of Adder_8Bit_Sim is
Component Adder_8Bit
    PORT(   A_in : in STD_LOGIC_VECTOR (7 downto 0);
            B_in : in STD_LOGIC;
            S_out : out STD_LOGIC_VECTOR (7 downto 0);
            Q : in STD_LOGIC_VECTOR (7 downto 0);
            LSB : out STD_LOGIC);
End Component;

SIGNAL A_in, Q, S_out : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL LSB, B_in : STD_LOGIC;

begin
    UUT : Adder_8Bit
        PORT MAP(
            A_in => A_in,
            B_in => B_in,
            S_out => S_out,
            Q => Q,
            LSB => LSB);
        
    process
    begin
        A_in <= "00000000";
        B_in <= '1';
        Q <= "11111111";
        wait for 10ns;
        
        A_in <= "00000001";
        B_in <= '1';
        Q <= "11111111";
        wait for 10ns;
        
        A_in <= "00000010";
        B_in <= '1';
        Q <= "11111111";
        wait for 10ns;
        
        A_in <= "00000100";
        B_in <= '1';
        Q <= "11111111";
        wait for 10ns;
                
        A_in <= "00001000";
        B_in <= '1';
        Q <= "11111111";
        wait;
    end process;

end Behavioral;
