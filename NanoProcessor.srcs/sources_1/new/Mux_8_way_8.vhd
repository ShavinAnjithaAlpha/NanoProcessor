----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/09/2023 01:18:05 PM
-- Design Name: 8-way 4-bit Multiplexer
-- Module Name: Mux_8_way_8 - Behavioral
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



entity Mux_8_way_8 is
    Port ( Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           A0, A1, A2, A3, A4, A5, A6, A7 : in STD_LOGIC_VECTOR(7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
           
end Mux_8_way_8;

architecture Behavioral of Mux_8_way_8 is

    Component Decoder_3_to_8
        PORT (
            I : in STD_LOGIC_VECTOR(2 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    End Component;
    
    Component Buff_8
        PORT (
            D : in STD_LOGIC_VECTOR(7 downto 0);
            Ctrl : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    End Component;
    
    SIGNAL Decoder_Y : STD_LOGIC_VECTOR(7 downto 0);
    
begin

    Decoder_3_to_8_0 : Decoder_3_to_8
        PORT MAP(
            I => Reg_Sel,
            En => '1',
            Y => Decoder_Y
            
        );
    -- use the yti state buffers to pass selected 4-bits
    Buff_8_0 : Buff_8 PORT MAP(D => A0, Ctrl => Decoder_Y(0), Y => Y);
    Buff_8_1 : Buff_8 PORT MAP(D => A1, Ctrl => Decoder_Y(1), Y => Y);
    Buff_8_2 : Buff_8 PORT MAP(D => A2, Ctrl => Decoder_Y(2), Y => Y);
    Buff_8_3 : Buff_8 PORT MAP(D => A3, Ctrl => Decoder_Y(3), Y => Y);
    Buff_8_4 : Buff_8 PORT MAP(D => A4, Ctrl => Decoder_Y(4), Y => Y);
    Buff_8_5 : Buff_8 PORT MAP(D => A5, Ctrl => Decoder_Y(5), Y => Y);
    Buff_8_6 : Buff_8 PORT MAP(D => A6, Ctrl => Decoder_Y(6), Y => Y);
    Buff_8_7 : Buff_8 PORT MAP(D => A7, Ctrl => Decoder_Y(7), Y => Y);

end Behavioral;
