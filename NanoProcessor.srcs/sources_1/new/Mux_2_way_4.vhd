----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 03:53:52 PM
-- Design Name: 
-- Module Name: Mux_2_way_4 - Behavioral
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

entity Mux_2_way_4 is
    Port ( I : in STD_LOGIC;
           A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4;

architecture Behavioral of Mux_2_way_4 is

    Component Buff_4
        PORT (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Ctrl : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    End Component;
    
    SIGNAL NOT_I : STD_LOGIC;
    
begin

    NOT_I <= NOT(I);
    
    Buff_4_0 : Buff_4 PORT MAP(D => A0, Ctrl => NOT_I, Y => Y);
    Buff_4_1 : Buff_4 PORT MAP(D => A1, Ctrl => I, Y => Y);

end Behavioral;
