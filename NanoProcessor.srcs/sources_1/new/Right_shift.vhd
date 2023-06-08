----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 07:25:52 PM
-- Design Name: 
-- Module Name: Right_shift - Behavioral
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

entity Right_shift is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
end Right_shift;

architecture Behavioral of Right_shift is

begin

    S_out(0) <= A_in(1);
    S_out(1) <= A_in(2);
    S_out(2) <= A_in(3);
    S_out(3) <= '0';
    
end Behavioral;
