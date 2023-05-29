----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 09:38:29 AM
-- Design Name: 
-- Module Name: Count_3 - Behavioral
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

entity Count_3 is
    Port ( Clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Add_in : in STD_LOGIC_VECTOR (2 downto 0);
           Add_out : out STD_LOGIC_VECTOR (2 downto 0));
end Count_3;

architecture Behavioral of Count_3 is

begin


end Behavioral;
