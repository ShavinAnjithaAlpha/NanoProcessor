----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/29/2023 08:41:45 PM
-- Design Name: 7-SegmentController
-- Module Name: LUT_7_Display - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_7_Display is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR(7 downto 0);
           LED_out : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_Out : out STD_LOGIC_VECTOR(3 downto 0));
end LUT_7_Display;

architecture Behavioral of LUT_7_Display is

    SIGNAL one_second_counter: STD_LOGIC_VECTOR (27 downto 0);
    -- counter for generating 1-second clock enable
    SIGNAL one_second_enable: STD_LOGIC;
--    SIGNAL anode_address : STD_LOGIC_VECTOR(3 downto 0);
    -- one second enable for counting numbers
--    SIGNAL displayed_number: STD_LOGIC_VECTOR (15 downto 0);
    -- counting decimal number to be displayed on 4-digit 7-segment display
    SIGNAL LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL refresh_counter: unsigned(19 downto 0);
    -- creating 10.5ms refresh period
    SIGNAL LED_activating_counter: STD_LOGIC;
    SIGNAL inter_vector : STD_LOGIC_VECTOR(19 downto 0);
    -- the other 2-bit for creating 4 LED-activating signals
    -- count         0    ->  1  ->  2  ->  3
    -- activates    LED1    LED2   LED3   LED4
    -- and repeat

--type rom_type is array(0 to 15) of STD_LOGIC_VECTOR(6 downto 0);

--    SIGNAL sevenSegment_ROM : rom_type := (
--                            "1000000", -- 0
--                            "1111001", -- 1
--                            "0100100", -- 2
--                            "0110000", -- 3
--                            "0011001", -- 4
--                            "0010010", -- 5
--                            "0000010", -- 6
--                            "1111000", -- 7
--                            "0000000", -- 8
--                            "0010000", -- 9
--                            "0001000", -- a
--                            "0000011", -- b
--                            "1000110", -- c
--                            "0100001", -- d
--                            "0000110", -- e
--                            "0001110" -- f
--                            );
begin
--    data <= sevenSegment_ROM(to_integer(unsigned(address)));
        
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
    process(LED_BCD)
    begin
        case LED_BCD is
        when "0000" => LED_out <= "0000001"; -- "0"     
        when "0001" => LED_out <= "1001111"; -- "1" 
        when "0010" => LED_out <= "0010010"; -- "2" 
        when "0011" => LED_out <= "0000110"; -- "3" 
        when "0100" => LED_out <= "1001100"; -- "4" 
        when "0101" => LED_out <= "0100100"; -- "5" 
        when "0110" => LED_out <= "0100000"; -- "6" 
        when "0111" => LED_out <= "0001111"; -- "7" 
        when "1000" => LED_out <= "0000000"; -- "8"     
        when "1001" => LED_out <= "0000100"; -- "9" 
        when "1010" => LED_out <= "0000010"; -- a
        when "1011" => LED_out <= "1100000"; -- b
        when "1100" => LED_out <= "0110001"; -- C
        when "1101" => LED_out <= "1000010"; -- d
        when "1110" => LED_out <= "0110000"; -- E
        when "1111" => LED_out <= "0111000"; -- F
        when others => LED_out <= "0000000";
        end case;
    end process;
    
    process(clock,reset)
    begin 
        if(reset='1') then
            refresh_counter <= (others => '0');
        elsif(rising_edge(clock)) then
            refresh_counter <= refresh_counter + 1;
        end if;
    end process;
            
    inter_vector <= std_logic_vector(refresh_counter);
    LED_activating_counter <= inter_vector(18);
    -- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
    process(LED_activating_counter)
    begin
        case LED_activating_counter is
--        when "00" =>
--            address <= "0111"; 
--            -- activate LED1 and Deactivate LED2, LED3, LED4
--            LED_BCD <= displayed_number(15 downto 12);
--            -- the first hex digit of the 16-bit number
--        when "01" =>
--            address <= "1011"; 
--            -- activate LED2 and Deactivate LED1, LED3, LED4
--            LED_BCD <= displayed_number(11 downto 8);
--            -- the second hex digit of the 16-bit number
            when '0' =>
                Anode_Out <= "1101"; 
                -- activate LED3 and Deactivate LED2, LED1, LED4
                LED_BCD <= address(7 downto 4);
                -- the third hex digit of the 16-bit number
            when '1' =>
                Anode_Out <= "1110"; 
                -- activate LED4 and Deactivate LED2, LED3, LED1
                LED_BCD <= address(3 downto 0);
                -- the fourth hex digit of the 16-bit number 
            when others => 
                Anode_Out <= "1110";
                LED_BCD <= address(3 downto 0);   
        end case;
    end process;
end Behavioral;
