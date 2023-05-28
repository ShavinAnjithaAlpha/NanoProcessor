----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/25/2023 03:46:39 PM
-- Design Name: 2-way 3-bit Multiplexer
-- Module Name: Mux_2_way_3_Sim - Behavioral
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

entity Mux_2_way_3_Sim is
--  Port ( );
end Mux_2_way_3_Sim;

architecture Behavioral of Mux_2_way_3_Sim is
    
    Component Mux_2_way_3
        PORT (
            I : in STD_LOGIC;
            A0, A1 : in STD_LOGIC_VECTOR(2 downto 0);
            Y : out STD_LOGIC_VECTOR(2 downto 0)
        );
    End Component;

    SIGNAL I : STD_LOGIC;
    SIGNAL A0, A1, Y : STD_LOGIC_VECTOR(2 downto 0);
    
begin

   UUT : Mux_2_way_3
        PORT MAP(
            I => I,
            A0 => A0,
            A1 => A1,
            Y => Y
        ); 
    
    
    process
    begin
    
        -- set the initial data
        A0 <= "010";
        A1 <= "110";
        
        -- select the data path
        I <= '0';
        wait for 5ns;
        
        I <= '1';
        wait for 5ns;
        
        wait; -- wait forever
    
    end process;
end Behavioral;
