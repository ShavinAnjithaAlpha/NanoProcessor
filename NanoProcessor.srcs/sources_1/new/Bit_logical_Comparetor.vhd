----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:25:33 PM
-- Design Name: 
-- Module Name: Bit_logical_Comparetor - Behavioral
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

entity Bit_logical_Comparetor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           M : in STD_LOGIC_VECTOR (1 downto 0));
end Bit_logical_Comparetor;

architecture Behavioral of Bit_logical_Comparetor is

begin
    S <= (M(0) AND (A XOR B)) OR (A AND B AND (NOT M(1))) OR ((NOT A) AND M(1) AND (NOT M(0)));

end Behavioral;
