----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/09/2023 06:12:08 PM
-- Design Name: 2-way 8-bit MUX
-- Module Name: Mux_2_way_8 - Behavioral
-- Project Name: NanoProcessor
-- Target Devices: basys3
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

entity Mux_2_way_8 is
    Port ( I : in STD_LOGIC;
           A0, A1 : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Mux_2_way_8;

architecture Behavioral of Mux_2_way_8 is
    
    Component Buff_8
        PORT (
            D : in STD_LOGIC_VECTOR(7 downto 0);
            Ctrl : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    End Component;
    
    SIGNAL NOT_I : STD_LOGIC;
    
begin

    NOT_I <= NOT(I);
    
    Buff_8_0 : Buff_8 PORT MAP(D => A0, Ctrl => NOT_I, Y => Y);
    Buff_8_1 : Buff_8 PORT MAP(D => A1, Ctrl => I, Y => Y);

end Behavioral;
