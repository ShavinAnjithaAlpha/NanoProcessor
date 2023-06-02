----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 10:50:23 AM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

    SIGNAL Count : integer := 1;
    SIGNAL Clk_status : STD_LOGIC := '0';

begin
    
    Clk_out <= Clk_status;
    -- in this we slow down the clock speed for get visible output
    process (Clk_in) begin
        IF (rising_edge(Clk_in)) THEN
            Count <= count + 1;
            IF (Count = 30000000) THEN -- for this we are considering only 2 otherwise count = 5000000
                Clk_status <= NOT Clk_status;
                Count <= 1;
            END IF;
        END IF;
    end process;

end Behavioral;
