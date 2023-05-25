----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 03:40:26 PM
-- Design Name: 
-- Module Name: Buff_3 - Behavioral
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

entity Buff_3 is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Ctrl : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end Buff_3;

architecture Behavioral of Buff_3 is

begin
    
    Y <= D WHEN Ctrl = '1' ELSE "ZZZ";

end Behavioral;
