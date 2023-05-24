----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/24/2023 09:22:58 AM
-- Design Name: 4-bit Register
-- Module Name: Reg - Behavioral
-- Project Name: Nano Processor
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

entity Reg is
    Port ( Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

begin

    process (Clk) begin
    
        if (rising_edge(Clk)) then -- respont at the rising edge of the clock pulse
            if En = '1' then -- store the 4-bit fi En is asserted
                Q <= D;
            end if;
        end if;
    
    end process;


end Behavioral;
