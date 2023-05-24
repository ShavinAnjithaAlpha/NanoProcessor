----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/24/2023 04:30:08 PM
-- Design Name: 3-to-8-Decoder
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    
    Component Decoder_2_to_4
        PORT (
            I : in STD_LOGIC_VECTOR(1 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    End Component;
    
    SIGNAL En_0, En_1 : STD_LOGIC;
    
begin

    Decoder_2_to_4_0 : Decoder_2_to_4 
        PORT MAP (
            I => I(1 downto 0),
            En => En_0,
            Y => Y(3 downto 0) 
        );
        
    Decoder_2_to_4_1 : Decoder_2_to_4 
        PORT MAP (
            I => I(1 downto 0),
            En => En_1,
            Y => Y(7 downto 4)
        );
        
    En_0 <= En AND NOT(I(2));
    En_1 <= En AND I(2);

end Behavioral;
