----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/10/2023 07:03:17 PM
-- Design Name: 1-bit buffer
-- Module Name: Buff_1 - Behavioral
-- Project Name: NanoProcessor
-- Target Devices: Basys3
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

entity Buff_1 is
    Port ( D : in STD_LOGIC;
           Ctrl : in STD_LOGIC;
           Y : out STD_LOGIC);
end Buff_1;

architecture Behavioral of Buff_1 is

begin

    Y <= D WHEN Ctrl = '1' ELSE 'Z';

end Behavioral;
