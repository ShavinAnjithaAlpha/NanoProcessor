----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/03/2023 06:23:55 PM
-- Design Name: ALU Multiplexer Simulation
-- Module Name: ALU_Mux_Sim - Behavioral
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

entity ALU_Mux_Sim is
--  Port ( );
end ALU_Mux_Sim;

architecture Behavioral of ALU_Mux_Sim is

    Component ALU_Mux
        PORT ( Add_Sub_Bus : in STD_LOGIC_VECTOR (3 downto 0);
           Logic_Bus : in STD_LOGIC_VECTOR (3 downto 0);
           Mul_Bus : in STD_LOGIC_VECTOR (3 downto 0);
           Shift_Bus : in STD_LOGIC_VECTOR(3 downto 0);
           Mode : in STD_LOGIC_VECTOR (1 downto 0);
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    End Component;
    
    SIGNAL Add_Sub_Bus, Logic_Bus, Mul_Bus, Shift_Bus, Y : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Mode, Op : STD_LOGIC_VECTOR(1 downto 0);
    
begin

    UUT : ALU_Mux
        PORT MAP(
            Add_Sub_Bus => Add_Sub_Bus,
            Logic_Bus => Logic_Bus,
            Mul_Bus => Mul_Bus,
            Shift_Bus => Shift_Bus,
            Mode => Mode,
            Op => Op,
            Y => Y
        );
        
    process
    begin
    
        Add_Sub_Bus <= "0011";
        Logic_Bus <= "1111";
        Mul_Bus <= "1110";
        Shift_Bus <= "1001";
        
        -------------------------------
        Mode <= "00";
        Op <= "00";
        wait for 5ns;
        
        Op <= "01";
        wait for 5ns;
        
        Op <= "11";
        wait for 5ns;
        
        -------------------------------
        Mode <= "01";
        wait for 5ns;
        
        Op <= "00";
        wait for 5ns;
        
        Op <= "01";
        wait for 5ns;
        
        -------------------------------
        Mode <= "11";
        wait for 5ns;
        
        Op <= "00";
        wait for 5ns;
        
        Op <= "11";
        wait for 5ns;
        
        -------------------------------
        Mode <= "10";
        Op <= "11";
        wait for 5ns;
        
        Op <= "00";
        wait for 5ns;
        
        Op <= "01";
        wait for 5ns;
        
        Op <= "10";
        wait for 5ns;
        
        wait; -- wait forever
    
    end process;

end Behavioral;
