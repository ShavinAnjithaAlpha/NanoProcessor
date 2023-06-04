----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:33:48 PM
-- Design Name: 
-- Module Name: Adder_4Bit_Sim - Behavioral
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

entity Adder_4Bit_Sim is
--  Port ( );
end Adder_4Bit_Sim;

architecture Behavioral of Adder_4Bit_Sim is
Component Adder_4Bit
    PORT(   A_in : in STD_LOGIC_VECTOR (3 downto 0);
            B_in : in STD_LOGIC;
            S_out : out STD_LOGIC_VECTOR (3 downto 0);
            Q : in STD_LOGIC_VECTOR (3 downto 0);
            LSB : out STD_LOGIC);
End Component;

SIGNAL A_in, Q, S_out : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL LSB, B_in : STD_LOGIC;

begin
    UUT : Adder_4Bit
        PORT MAP(
            A_in => A_in,
            B_in => B_in,
            S_out => S_out,
            Q => Q,
            LSB => LSB);
        
    process
    begin
        A_in <= "0000";
        B_in <= '1';
        Q <= "1111";
        wait for 10ns;
        
        A_in <= "0001";
        B_in <= '1';
        Q <= "1111";
        wait for 10ns;
        
        A_in <= "0010";
        B_in <= '1';
        Q <= "1111";
        wait for 10ns;
        
        A_in <= "0100";
        B_in <= '1';
        Q <= "1111";
        wait for 10ns;
                
        A_in <= "1000";
        B_in <= '1';
        Q <= "1111";
        wait;
    end process;

end Behavioral;

