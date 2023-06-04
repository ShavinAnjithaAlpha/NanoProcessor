----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/29/2023 09:25:37 AM
-- Design Name: 12-bitx8 ROM
-- Module Name: ROM_8 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_8 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           ins : out STD_LOGIC_VECTOR (13 downto 0));
end ROM_8;

architecture Behavioral of ROM_8 is

    
    type rom_type is array (0 to 7) of std_logic_vector(13 downto 0);
        
    signal mem_8 : rom_type := ( "00101110001010",
                                 "00100010000001",
                                 "00010010000000",
                                 "00001110010000",
                                 "00111110000111",
                                 "00110000000011",
                                 "00000000000000",
                                 "00000000000000"   
    );

begin

    ins <= mem_8(to_integer(unsigned(address)));

end Behavioral;
