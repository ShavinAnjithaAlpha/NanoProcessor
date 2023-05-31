----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/24/2023 09:02:01 AM
-- Design Name: D Flip Flop
-- Module Name: D_FF - Behavioral
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

entity D_FF is
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Rst : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is

begin

    process (Clk, Rst) begin -- procss begin when clock changes
        if Rst'event AND Rst = '1' then Q <= '0'; -- reset the D flip-flop asynchronously
        end if;
        if (rising_edge(Clk)) then  -- respond at clock rising edge
            if En = '1' then -- store D if En is asserted
                Q <= D;
             end if;
         end if;
    end process;


end Behavioral;
