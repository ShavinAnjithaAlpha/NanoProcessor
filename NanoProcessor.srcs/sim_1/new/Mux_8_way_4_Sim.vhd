----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/25/2023 03:22:32 PM
-- Design Name: 8 way 4-bit Multiplexer Simulation
-- Module Name: Mux_8_way_4_Sim - Behavioral
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

entity Mux_8_way_4_Sim is
--  Port ( );
end Mux_8_way_4_Sim;

architecture Behavioral of Mux_8_way_4_Sim is

    Component Mux_8_way_4
        PORT (
            Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
            A0, A1, A2, A3, A4, A5, A6, A7 : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    End Component;
    
    SIGNAL Reg_Sel : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL A0, A1, A2, A3, A4, A5, A6, A7 : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Y : STD_LOGIC_VECTOR(3 downto 0);
    
begin

    UUT : Mux_8_way_4 PORT MAP(
        Reg_Sel => Reg_Sel,
        Y => Y,
        A0 => A0,
        A1 => A1,
        A2 => A2,
        A3 => A3,
        A4 => A4,
        A5 => A5,
        A6 => A6,
        A7 => A7
    );
    
    process
    begin
        -- Index 210077D = 0011 0011 0100 1001 1101
        -- Index 210134C = 0011 0011 0100 1101 0110
        
        -- set the initial data of A0 - A7
        A0 <= "1101";
        A1 <= "0110";
        A2 <= "1001";
        A3 <= "1101";
        A4 <= "0100";
        A5 <= "0011";
        A6 <= "0011";
        A7 <= "1111";
        
        -- set the register selecter values
        Reg_Sel <= "000";
        wait for 5ns;
        
        Reg_Sel <= "001";
        wait for 5ns;
        
        Reg_Sel <= "010";
        wait for 5ns;
        
        Reg_Sel <= "011";
        wait for 5ns;
        
        Reg_Sel <= "100";
        wait for 5ns;
        
        Reg_Sel <= "101";
        wait for 5ns;
        
        Reg_Sel <= "110";
        wait for 5ns;
        
        Reg_Sel <= "111";
        wait for 5ns;
        
        wait; -- wait forever
    
    end process;


end Behavioral;
