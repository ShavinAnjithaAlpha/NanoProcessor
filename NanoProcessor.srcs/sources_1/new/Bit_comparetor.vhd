----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:14:57 PM
-- Design Name: 
-- Module Name: Bit_comparetor - Behavioral
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

entity Bit_comparetor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           M : in STD_LOGIC_VECTOR(1 downto 0);
           S : out STD_LOGIC;
           E : out STD_LOGIC);
end Bit_comparetor;

architecture Behavioral of Bit_comparetor is

begin

    -- A == B - 00
    -- A < B  - 01 
    -- A > B  - 10
    -- A != B - 11 
    
    S <=    (((NOT A) AND (NOT B)) AND (NOT M(0)) AND (NOT M(1))) OR
            (((A) AND (B)) AND (NOT M(0)) AND (NOT M(1))) OR 
            (B AND (M(0)) AND (M(1))) OR 
            (((NOT A) AND B) AND M(0) AND (NOT M(1))) OR 
            (( A AND (NOT B)) AND (NOT M(0)) AND M(1));
    
    E <= (A AND B) OR ((NOT A) AND (NOT B)); 
end Behavioral;
