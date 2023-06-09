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
           ins : out STD_LOGIC_VECTOR (17 downto 0));
end ROM_8;

architecture Behavioral of ROM_8 is

    
    type rom_type is array (0 to 7) of std_logic_vector(17 downto 0);
        
        -- shifting program
    signal mem_8 : rom_type := (    "001011100011111111",
                                    "001000100000000001",
                                    "000100100000000000",
                                    "000011100100000000",
                                    "001111100000000111",
                                    "001100000000000011",
                                    "000000000000000000",
                                    "000000000000000000"
                                    
    );
    -- assembly code for above program
--                                        MOVI R7, 8
--                                        RSHIFT R7
--                                        MOVI R7, 1
--                                        LSHIFT R7
    
    -- another assembly program to confirm the functionality of the processor
    -- 1. Count Down Program
--            0010 111 000 1111
--            0010 001 000 0001
--            0001 001 000 0000
--            0000 111 001 0000
--            0011 111 000 0111
--            0011 000 000 0011

--                MOVI R7, F
--                MOVI R1, 1
--                NEG R1
--                ADD R7, R1
--                JZR R7, 7
--                JZR R0, 3

     -- 2. multiplication program
--             0010 111 000 0001
--             0010 001 000 0010
--             1000 111 001 0000
--             1111 111 000 0010
--             1100 000 000 0000

--                    MOVI R7, 1
--                    MOVI R1, 2
--                    MUL R7, R1
--                    JNER R7, R0, 2
--                    JER R0, 0, 0

    -- 3. register transfer program
    --         0010 001 000 0001
    --         0010 010 000 0011
    --         0010 011 000 0110
    --         0010 100 000 1001
    --         1011 111 001 0000
    --         1011 111 010 0000
    --         1011 111 011 0000
    --         1011 111 100 0000
    
--                    MOVI R1, 1
--                    MOVI R2, 3
--                    MOVI R3, 6
--                    MOVI R4, 9
--                    RGT R7, R1
--                    RGT R7, R2
--                    RGT R7, R3
--                    RGT R7, R4  
    
    -- 4. comparing program
--                0010 111 000 0000
--                0010 001 000 0001
--                0010 010 000 0010
--                0010 011 000 0100
--                1000 001 010 0000
--                1110 001 011 0110
--                0010 111 000 1111
--                0011 000 000 0011   

--                        MOVI R7, 0
--                        MOVI R1, 1
--                        MOVI R2, 2
--                        MOVI R3, 4
--                        MUL R1, R2
--                        JLR R1, R3, 6
--                        MOVI R7, F
--                        JZR R0, 3     
    
begin

    ins <= mem_8(to_integer(unsigned(address)));

end Behavioral;
