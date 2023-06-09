----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 07:45:01 PM
-- Design Name: 
-- Module Name: Right_shift_SIm - Behavioral
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

entity Right_shift_SIm is
--  Port ( );
end Right_shift_SIm;

architecture Behavioral of Right_shift_SIm is
Component Right_shift
    Port ( A_in : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0));
End Component;

SIGNAL A_in, S_out : STD_LOGIC_VECTOR (7 downto 0);

begin
    UUT : Right_shift
        PORT MAP(
            A_in => A_in,
            S_out => S_out);
        
    process
        begin
        A_in <= "00000001";
        wait for 10ns;
        
        A_in <= "00000100";
        wait for 10ns;
        
        A_in <= "00100000";
        wait for 10ns;
        
        A_in <= "01001111";
        wait for 10ns;
        
        A_in <= "01111000";
        wait;
    end process;

end Behavioral;