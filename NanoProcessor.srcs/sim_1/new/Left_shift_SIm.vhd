----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 07:40:57 PM
-- Design Name: 
-- Module Name: Left_shift_SIm - Behavioral
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

entity Left_shift_SIm is
--  Port ( );
end Left_shift_SIm;

architecture Behavioral of Left_shift_SIm is
Component Left_shift
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

SIGNAL A_in, S_out : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT : Left_shift
        PORT MAP(
            A_in => A_in,
            S_out => S_out);
        
    process
        begin
        A_in <= "0000";
        wait for 10ns;
        
        A_in <= "0001";
        wait for 10ns;
        
        A_in <= "0010";
        wait for 10ns;
        
        A_in <= "0100";
        wait for 10ns;
        
        A_in <= "1000";
        wait;
    end process;

end Behavioral;
